inherited frmEnviaFornComiss: TfrmEnviaFornComiss
  Left = 72
  Top = 121
  Caption = 'Envio de Comissão do Fornecedor via Interface'
  ClientHeight = 435
  ClientWidth = 632
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 632
    Height = 396
    object pnlResult: TPanel
      Left = 5
      Top = 147
      Width = 622
      Height = 244
      Align = alClient
      BevelOuter = bvLowered
      Caption = 'pnlResult'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object memResult: TMemo
        Left = 1
        Top = 1
        Width = 450
        Height = 242
        Align = alLeft
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object bbtnVoltar: TBitBtn
        Left = 459
        Top = 15
        Width = 115
        Height = 38
        Caption = '&Voltar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = bbtnVoltarClick
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DD00DDDDD4444DDDDD00DDD44444444DDD00DD444DDDD444DD00DD44DDDDDD44
          DD00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD4
          4D00DD44DDDD4D44DD00DD44DDDD4444DD00DDDDDDDD444DDD00DDDDDDDD4444
          DD00DDDDDDDDDDDDDD00}
      end
      object bbtnSalvar: TBitBtn
        Left = 459
        Top = 59
        Width = 115
        Height = 38
        Caption = 'S&alvar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = bbtnSalvarClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000000000007770330770000330777033077000033077703307700003
          30777033000000033077703333333333307770330000000330777030FFFFFFF0
          30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
          8077777CCC777700007777CCC77777777777777C777777777777}
      end
    end
    object pnlOpcoes: TPanel
      Left = 5
      Top = 147
      Width = 622
      Height = 244
      Align = alClient
      BevelOuter = bvLowered
      Caption = 'pnlOpcoes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 7
        Top = 29
        Width = 65
        Height = 13
        Caption = 'Fornecedores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object chklstForn: TCheckListBox
        Left = 7
        Top = 45
        Width = 481
        Height = 169
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
      end
      object StaticText2: TStaticText
        Left = 10
        Top = 3
        Width = 160
        Height = 27
        Caption = 'Opções de  Envio'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        TabOrder = 1
      end
      object chkResult: TCheckBox
        Left = 6
        Top = 220
        Width = 124
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Exibir exceções'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object pnlProgresso: TPanel
        Left = 45
        Top = 59
        Width = 406
        Height = 94
        Caption = 'pnlProgresso'
        TabOrder = 2
        object Label4: TLabel
          Left = 18
          Top = 24
          Width = 104
          Height = 13
          Caption = 'Eviando Comissões ...'
        end
        object pBar: TProgressBar
          Left = 18
          Top = 42
          Width = 361
          Height = 28
          Min = 0
          Max = 100
          Step = 1
          TabOrder = 0
        end
      end
      object bbtnVerResultado: TBitBtn
        Left = 493
        Top = 46
        Width = 115
        Height = 38
        Hint = 'Ir para tela de resultado '
        Caption = 'Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = bbtnVerResultadoClick
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DD00DD4444DDDDDDDD00DDD444DDDDDDDD00DD4444DDDD44DD00DD44D4DDDD44
          DD00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD4
          4D00DD44DDDDDD44DD00DD444DDDD444DD00DDD44444444DDD00DDDDD4444DDD
          DD00DDDDDDDDDDDDDD00}
      end
    end
    object Panel2: TPanel
      Left = 5
      Top = 5
      Width = 622
      Height = 142
      Align = alTop
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object StaticText1: TStaticText
        Left = 8
        Top = 3
        Width = 283
        Height = 27
        Caption = 'Informações para a Comissão'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        TabOrder = 3
      end
      object grpMesAnoRef: TGroupBox
        Left = 6
        Top = 30
        Width = 151
        Height = 57
        Caption = 'Mês e Ano de Referência'
        TabOrder = 0
        object cmbMesRef: TComboBox
          Left = 6
          Top = 21
          Width = 82
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Janeiro'
            'Fevereiro'
            'Março'
            'Abril'
            'Maio'
            'Junho'
            'Julho'
            'Agosto'
            'Setembro '
            'Outubro'
            'Novembro'
            'Dezembro')
        end
        object spedAnoRef: TSpinEdit
          Left = 90
          Top = 20
          Width = 55
          Height = 22
          MaxLength = 4
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 1998
        end
      end
      object GroupBox2: TGroupBox
        Left = 6
        Top = 92
        Width = 304
        Height = 43
        Caption = 'Motivo'
        TabOrder = 1
        Visible = False
        object dblkpcmbmotivo: TwwDBLookupCombo
          Left = 9
          Top = 16
          Width = 286
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'DESCRICAO')
          LookupTable = qrymotivo
          LookupField = 'DESCRICAO'
          Options = [loTitles]
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
      end
      object bbtnEnviar: TBitBtn
        Left = 463
        Top = 36
        Width = 115
        Height = 38
        Caption = '&Enviar '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = bbtnEnviarClick
        Glyph.Data = {
          06010000424D060100000000000076000000280000000B000000120000000100
          0400000000009000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333A
          000033833333333F00003088333333380000300883333337000030A088333338
          000030AA088333300000307A70883338000030AAAA08833F000030A7A7A08837
          000030AAAAAA03300000307A7A703338000030AAAA033338000030A7A0333330
          000030AA0333333800003070333333380000300333333338000030333333333F
          00003333333333300000}
      end
    end
  end
  inherited Dock971: TDock97
    Top = 396
    Width = 632
    inherited tb97Fundo: TToolbar97
      Left = 466
      DockPos = 466
    end
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar cálculo de contribuições'
    Left = 569
    Top = 153
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 490
    Top = 73
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 297
    Top = 52
  end
  object qrymotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  *  FROM   MOTIVO')
    ValidateWithMask = True
    Left = 230
    Top = 59
  end
  object qryforn: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME,IDPESSOA FROM PESSOA '
      'WHERE IDPESSOA IN'
      '( SELECT IDPESSOA FROM FORNSERV)'
      'AND IDPESSOA IN'
      '(SELECT IDFORNSERV FROM PLANASS)')
    ValidateWithMask = True
    Left = 373
    Top = 45
  end
  object qrybuscaassist: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 213
    Top = 163
  end
  object qryinsereassist: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 293
    Top = 179
  end
  object qrydeletaassist: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 362
    Top = 222
  end
  object qrylote: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 223
    Top = 94
  end
end
