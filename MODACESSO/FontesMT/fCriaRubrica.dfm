inherited frmCriaRubrica: TfrmCriaRubrica
  Left = 198
  Top = 204
  BorderStyle = bsToolWindow
  Caption = 'Criação de Nova Rubrica da Folha de Pagamento'
  ClientHeight = 236
  ClientWidth = 408
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 408
    Height = 197
    BorderWidth = 2
    object Label17: TLabel
      Left = 12
      Top = 10
      Width = 33
      Height = 13
      Caption = 'Código'
    end
    object Label18: TLabel
      Left = 12
      Top = 52
      Width = 48
      Height = 13
      Caption = 'Descrição'
    end
    object edCodigo: TEdit
      Left = 12
      Top = 25
      Width = 80
      Height = 21
      TabOrder = 0
    end
    object edDescricao: TEdit
      Left = 12
      Top = 67
      Width = 383
      Height = 21
      TabOrder = 1
    end
    object rgDestino: TRadioGroup
      Left = 12
      Top = 93
      Width = 383
      Height = 92
      Caption = 'Destina-se a'
      Columns = 2
      Items.Strings = (
        'Atrasos'
        'Extras Diurnas'
        'Extras Noturnas'
        'Extraordinárias'
        'Adicional Noturno'
        'Repouso Remunerado'
        'Faltas'
        'Faltas Abonadas')
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 197
    Width = 408
    inherited tb97Fundo: TToolbar97
      Left = 157
      inherited sep1: TToolbarSep97
        Left = 164
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnSair: TBitBtn
        Left = 83
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 166
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 18
    Top = 191
  end
end
