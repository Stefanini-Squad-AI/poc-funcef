inherited frmParamConcINSSRegiao: TfrmParamConcINSSRegiao
  Caption = 'Relatório de Conciliação do INSS por Região'
  ClientHeight = 227
  ClientWidth = 389
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 389
    Height = 188
    object GroupBox1: TGroupBox
      Left = 40
      Top = 16
      Width = 313
      Height = 57
      Caption = 'Região do INSS - Concessor'
      TabOrder = 0
      object dblkpEstado: TwwDBLookupCombo
        Left = 16
        Top = 24
        Width = 276
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEESTADO'#9'25'#9'Descrição'#9'F')
        LookupTable = qryEstado
        LookupField = 'DESCRICAO'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object GroupBox2: TGroupBox
      Left = 24
      Top = 84
      Width = 345
      Height = 81
      Caption = 'Período'
      TabOrder = 1
      object Label1: TLabel
        Left = 33
        Top = 30
        Width = 35
        Height = 13
        Caption = 'Inicial'
      end
      object Label2: TLabel
        Left = 192
        Top = 30
        Width = 28
        Height = 13
        Caption = 'Final'
      end
      object edMesCobIni: TMaskEdit
        Left = 32
        Top = 45
        Width = 121
        Height = 21
        EditMask = '!9999/99;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        TabOrder = 0
        Text = '    /  '
      end
      object edMesCobFim: TMaskEdit
        Left = 191
        Top = 45
        Width = 121
        Height = 21
        EditMask = '!9999/99;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        TabOrder = 1
        Text = '    /  '
      end
    end
  end
  inherited Dock971: TDock97
    Top = 188
    Width = 389
    inherited tb97Fundo: TToolbar97
      Left = 219
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 52
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 251
  end
  object qryEstado: TQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT CODESTADO, NOMEESTADO, '
      'CODESTADO||'#39' - '#39'||NOMEESTADO AS DESCRICAO'
      'FROM ESTADO'
      'WHERE IDPAIS = 1'
      'ORDER BY CODESTADO')
    Left = 344
    Top = 38
  end
  object dsEstado: TwwDataSource
    DataSet = qryEstado
    Left = 352
    Top = 92
  end
end
