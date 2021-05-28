using Images
include("vector.jl")

# image
aspectratio = 16 / 9 
imgwidth = 800
imgheight = trunc(Int64, imgwidth / aspectratio)
image = RGB.(zeros(imgheight, imgwidth))

# camera
viewportheight = 2.0
viewportwidth = viewportheight * aspectratio
horizontal = Vec3(viewportwidth, 0.0, 0.0)
vertical = Vec3(0.0, viewportheight, 0.0)
focallenght = 1.0
origin = Vec3(0.0, 0.0, 0.0)
lowerleftcorner = origin - horizontal/2 - vertical/2 - Vec3(0.0, 0.0, focallenght)

println("Image size $imgwidth x $imgwidth")

function raycolor(ray::Ray)
    t = 0.5 * ray.direction[2] + 1.0
    (1-t)RGB(1.0, 1.0, 1.0) + t*RGB(0.5, 0.7, 1.0)
end

for j = 1:imgheight
    for i = 1:imgwidth
        u = (i - 1) / (imgwidth - 1)
        v = 1.0 - (j - 1) / (imgheight - 1)
        dir = lowerleftcorner + u*horizontal + v*vertical - origin
        ray = Ray(origin, dir)

        image[j, i] = raycolor(ray)
    end
end

save("rendered/image1.png", image)