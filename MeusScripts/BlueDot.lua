local dlg = Dialog { title = "The Blue Dot Maker" }


-- Tamanho X do circulo
dlg:number {

    id = "x",
    label = "X: ",
    text = string.format("%.1f", 32),
    decimals = 5

}

-- Tamanho Y do circulo
dlg:number {

    id = "y",
    label = "Y: ",
    text = string.format("%.1f", 32),
    decimals = 5
}


-- Tamanho do "Pincel"
dlg:slider {

    id = "stroke",
    label = "Stroke Size: ",
    min = 1,
    max = 64,
    value = 24
}

-- Escolher a cor 
dlg:color {

    id = "clr",
    label = "Color: ",
    color = Color(0xffff7f00)
}


dlg:button {

    id = "ok",
    text = "OK",
    focus = true,
    onclick = function()

        local args = dlg.data


        local sprite = app.activeSprite
        if sprite == nil then
            sprite = Sprite(64, 64)
            app.activeSprite = sprite
        end

        local layer = sprite:newLayer()
        local cel = sprite:newCel(layer, 1)

        
        local brush = Brush {

            type = BrushType.CIRCLE,
            size = args.stroke

        }



        app.useTool {

            tool = "pencil",
            color = args.clr,
            brush = brush,
            points = { Point(args.x , args.y) },
            cel = cel,
            layer = layer

        }


        app.refresh()
    end

}

dlg:button {

    id = "btnCancel",
    text = "CANCEL",
    onClick = function()

        dlg:close()
    end
}




dlg:show {await = false }