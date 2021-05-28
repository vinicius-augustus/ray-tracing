using Images

imgwidth = 800
imgheight = 600

image = RGB.(zeros(imgheight, imgwidth))

for j = 1:imgheight
    for i = 1:imgwidth
        r = (i - 1) / (imgwidth - 1)
        g = 1.0 - (j - 1) / (imgheight - 1)
        b = 0.25

        image[j, i] = RGB(r, g, b)
    end
end

save("rendered/image1.png", image)