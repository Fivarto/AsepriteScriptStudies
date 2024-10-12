local dlg = Dialog {title = "Estudo Dialog/Janela"}

local bounds = dlg.bounds
--   x = esquerda|direita ## y = cima|baixo ## width = largura da janela ## height = altura da janela
dlg.bounds = Rectangle(100, 100, 200, 200)

--CHECKBOX
dlg:check {

    id = "chkBox01",
    label = "Check?",
    selected = true

}


--COLORS
dlg:color {

    id = "clr_01",
    label = "Color 01: ",
    color = Color(255, 255, 255, 255)
}

dlg:color {

    id = "clr_02",
    label = "Color 02: ",
    color = Color(128, 128, 128)

}


--COMBOBOX
dlg:combobox{

    id = "cmbbx",
    label = "Dias da Semana: ",
    option = "Segunda",
    options = {
        "Segunda",
        "Terça",
        "Quarta",
        "Quinta",
        "Sexta",

    }
}



--OK
dlg:button {

    id = "btnOk",
    text = "OK"


}

--CANCEL
dlg:button {

    id = "btnCancel",
    text = "Cancel",

    onclick = function()
        dlg:close()

    end

}




dlg:show {wait = false }