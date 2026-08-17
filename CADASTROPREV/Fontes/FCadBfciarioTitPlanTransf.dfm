inherited FrmCadBfciarioTitPlanTransf: TFrmCadBfciarioTitPlanTransf
  Left = 27
  Top = 101
  BorderIcons = []
  Caption = 'Transferência de Planos - Beneficiários por Benefício'
  ClientHeight = 454
  ClientWidth = 745
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 745
    Height = 415
    Font.Height = -11
    Font.Style = []
    ParentFont = False
    object pnldest: TPanel
      Left = 396
      Top = 5
      Width = 344
      Height = 405
      Align = alRight
      TabOrder = 0
      object Splitter2: TSplitter
        Left = 1
        Top = 137
        Width = 342
        Height = 6
        Cursor = crVSplit
        Align = alTop
      end
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 342
        Height = 136
        Cursor = crNo
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 14
          Top = 13
          Width = 107
          Height = 19
          Caption = 'Participante '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 14
          Top = 91
          Width = 178
          Height = 19
          Caption = 'Plano Previdenciário '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 14
          Top = 52
          Width = 121
          Height = 19
          Caption = 'Patrocinadora '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblpartdest: TLabel
          Left = 14
          Top = 30
          Width = 296
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblpatrodest: TLabel
          Left = 14
          Top = 69
          Width = 296
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblplanodest: TLabel
          Left = 14
          Top = 110
          Width = 296
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
      object Panel4: TPanel
        Left = 1
        Top = 143
        Width = 342
        Height = 261
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 1
        object Splitter4: TSplitter
          Left = 1
          Top = 113
          Width = 340
          Height = 6
          Cursor = crVSplit
          Align = alTop
        end
        object Panel8: TPanel
          Left = 1
          Top = 1
          Width = 340
          Height = 112
          Align = alTop
          TabOrder = 0
          object GroupBox3: TGroupBox
            Left = 1
            Top = 1
            Width = 338
            Height = 110
            Align = alClient
            Caption = 'Benefícios'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Bookman Old Style'
            Font.Style = [fsItalic]
            ParentFont = False
            TabOrder = 0
            object wwDBGrid2: TwwDBGrid
              Left = 2
              Top = 20
              Width = 334
              Height = 88
              Selected.Strings = (
                'NOME'#9'49'#9'Nome')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              Color = clMenu
              DataSource = dsbenefdest
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ParentFont = False
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
          end
        end
        object Panel9: TPanel
          Left = 1
          Top = 119
          Width = 340
          Height = 141
          Align = alClient
          TabOrder = 1
          object GroupBox4: TGroupBox
            Left = 1
            Top = 1
            Width = 338
            Height = 139
            Align = alClient
            Caption = 'Beneficiários Por Benefício'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Bookman Old Style'
            Font.Style = [fsItalic]
            ParentFont = False
            TabOrder = 0
            object wwDBGrid4: TwwDBGrid
              Left = 2
              Top = 20
              Width = 334
              Height = 117
              Selected.Strings = (
                'BENEF'#9'30'#9'Beneficiário'
                'RESPON'#9'30'#9'Responsável'
                'DESCRICAO'#9'15'#9'Tipo de Dependência do Responsável')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsbeneficiariodest
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
          end
        end
      end
    end
    object pnlorig: TPanel
      Left = 5
      Top = 5
      Width = 356
      Height = 405
      Align = alLeft
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 1
        Top = 137
        Width = 354
        Height = 6
        Cursor = crVSplit
        Align = alTop
      end
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 354
        Height = 136
        Cursor = crNo
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 0
        object Label4: TLabel
          Left = 14
          Top = 13
          Width = 107
          Height = 19
          Caption = 'Participante '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 14
          Top = 91
          Width = 178
          Height = 19
          Caption = 'Plano Previdenciário '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 14
          Top = 52
          Width = 121
          Height = 19
          Caption = 'Patrocinadora '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblpart: TLabel
          Left = 14
          Top = 30
          Width = 296
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblpatro: TLabel
          Left = 14
          Top = 69
          Width = 296
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblplano: TLabel
          Left = 14
          Top = 110
          Width = 296
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
      object Panel2: TPanel
        Left = 1
        Top = 143
        Width = 354
        Height = 261
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 1
        object Splitter3: TSplitter
          Left = 1
          Top = 113
          Width = 352
          Height = 6
          Cursor = crVSplit
          Align = alTop
        end
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 352
          Height = 112
          Align = alTop
          TabOrder = 0
          object GroupBox1: TGroupBox
            Left = 1
            Top = 1
            Width = 350
            Height = 110
            Align = alClient
            Caption = 'Benefícios'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Bookman Old Style'
            Font.Style = [fsItalic]
            ParentFont = False
            TabOrder = 0
            object wwDBGrid1: TwwDBGrid
              Left = 2
              Top = 20
              Width = 346
              Height = 88
              Selected.Strings = (
                'NOME'#9'51'#9'Nome')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              Color = clMenu
              DataSource = dsbeneforig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ParentFont = False
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
          end
        end
        object Panel6: TPanel
          Left = 1
          Top = 119
          Width = 352
          Height = 141
          Align = alClient
          TabOrder = 1
          object GroupBox2: TGroupBox
            Left = 1
            Top = 1
            Width = 350
            Height = 139
            Align = alClient
            Caption = 'Beneficiários Por Benefício'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Bookman Old Style'
            Font.Style = [fsItalic]
            ParentFont = False
            TabOrder = 0
            object wwDBGrid3: TwwDBGrid
              Left = 2
              Top = 20
              Width = 346
              Height = 117
              Selected.Strings = (
                'BENEF'#9'30'#9'Beneficiário'
                'RESPON'#9'30'#9'Responsavel'
                'DESCRICAO'#9'15'#9'Tipo de Dependencia do Responsavel')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsbeneficiarioorig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 361
      Top = 5
      Width = 35
      Height = 405
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object sbtnDesassocia: TSpeedButton
        Left = 5
        Top = 276
        Width = 26
        Height = 25
        Hint = 'Associar Beneficioário ao  benefício do plano destino'
        Caption = '>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnDesassociaClick
      end
      object sbtnDesassociaTodos: TSpeedButton
        Left = 5
        Top = 308
        Width = 26
        Height = 25
        Hint = 'Associar todos os  Beneficioários ao  benefício do plano destino'
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnDesassociaTodosClick
      end
      object sbtnAssocia: TSpeedButton
        Left = 5
        Top = 340
        Width = 26
        Height = 25
        Hint = 'Apaga beneficiário do plano destino'
        Caption = '<'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnAssociaClick
      end
      object sbtnAssociaTodos: TSpeedButton
        Left = 5
        Top = 372
        Width = 26
        Height = 25
        Hint = 'Apaga todos os beneficiários do plano destino'
        Caption = '<<'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnAssociaTodosClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 415
    Width = 745
    inherited tb97Fundo: TToolbar97
      Left = 412
      DockPos = 412
      inherited sep1: TToolbarSep97
        Left = 161
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 243
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 163
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 245
      end
      object bbtnCancelar: TBitBtn
        Left = 80
        Top = 0
        Width = 81
        Height = 33
        Cancel = True
        Caption = '&Cancelar'
        TabOrder = 2
        OnClick = bbtnCancelarClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        TabOrder = 3
        OnClick = bbtnConfirmarClick
        Kind = bkOK
        Spacing = 2
      end
    end
  end
  object qrybeneforig: TwwQuery
    BeforeOpen = qrybeneforigBeforeOpen
    AfterScroll = qrybeneforigAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT BE.NOME , BE.IDBENEFICIO'
      'FROM BENEFICIO BE , BENEFPLANPREV BP, BFCIARIOTITPLAN BT'
      'WHERE'
      'BE.IDBENEFICIO = BP.IDBENEFICIO'
      'AND BP.IDPLANOORIGEM = :IDPLANOPREV'
      'AND BP.IDBENEFICIO = BT.IDBENEFICIO'
      'AND BP.IDPLANOPREV = BT.IDPLANOPREV'
      'AND BT.IDPESSOA <> BT.IDTITULAR'
      ' ')
    ValidateWithMask = True
    Left = 176
    Top = 174
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qrybenefdest: TwwQuery
    BeforeOpen = qrybenefdestBeforeOpen
    AfterScroll = qrybenefdestAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BE.NOME , BE.IDBENEFICIO'
      'FROM BENEFICIO BE , BENEFPLANPREV BP'
      'WHERE '
      'BE.IDBENEFICIO = BP.IDBENEFICIO'
      'AND BP.IDPLANOPREV = :IDPLANOPREV')
    ValidateWithMask = True
    Left = 463
    Top = 174
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qrybeneficiarioorig: TwwQuery
    BeforeOpen = qrybeneficiarioorigBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT  BE.NOME , BE. IDBENEFICIO'
      ', PESSOA.NOME TIT , BENEF.NOME BENEF, RESPON.NOME RESPON'
      ', DEPEN.DESCRICAO, BT.IDPESSOA, BT.IDTITULAR , BT.IDPLANOPREV , '
      'BT.IDPESSJUR , BT.SEQPROPOSTA, PESSJUR.NOME PESSJUR,'
      'BT.IDDEPENRESPON, IDRESPONSAVEL'
      ''
      'FROM BENEFICIO BE , BFCIARIOTITPLAN BT, DEPEN ,'
      'PESSOA RESPON, PESSOA BENEF, PESSOA , PESSOA PESSJUR'
      'WHERE '
      'BE.IDBENEFICIO = BT.IDBENEFICIO'
      'AND BT.IDTITULAR = :IDTITULAR'
      'AND BT.IDPESSOA <> BT.IDTITULAR'
      'AND BT.IDPESSJUR = :IDPESSJUR'
      'AND BT.IDPLANOORIGEM = :IDPLANOPREV'
      'AND BT.IDBENEFICIO = :IDBENEFICIO'
      'AND SEQPROPOSTA  = :SEQPROPOSTA'
      'AND BT.IDPESSOA = BENEF.IDPESSOA'
      'AND BT.IDTITULAR = PESSOA.IDPESSOA'
      'AND BT.IDPESSJUR = PESSJUR.IDPESSOA'
      'AND BT.IDRESPONSAVEL = RESPON.IDPESSOA(+)'
      'AND DEPEN.IDDEPENDENCIA(+) = BT.IDDEPENRESPON'
      'AND BT.IDPESSOA NOT IN('
      'SELECT BT.IDPESSOA FROM BFCIARIOTITPLAN BT'
      'WHERE'
      'BT.IDTITULAR = :IDTITULAR'
      'AND BT.IDPESSJUR = :IDPESSJURDEST'
      'AND BT.IDPESSOA <> BT.IDTITULAR'
      'AND BT.IDPLANOORIGEM = :IDPLANOPREVDEST'
      'AND BT.IDBENEFICIO = :IDBENEFICIODEST'
      ' )')
    ValidateWithMask = True
    Left = 176
    Top = 300
    ParamData = <
      item
        DataType = ftString
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPESSJURDEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPLANOPREVDEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDBENEFICIODEST'
        ParamType = ptUnknown
      end>
  end
  object qrybeneficiariodest: TwwQuery
    BeforeOpen = qrybeneficiariodestBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT  BE.NOME , BE. IDBENEFICIO'
      ', PESSOA.NOME TIT , BENEF.NOME BENEF, RESPON.NOME RESPON'
      ', DEPEN.DESCRICAO, BT.IDPESSOA, BT.IDTITULAR , BT.IDPLANOPREV , '
      'BT.IDPESSJUR , BT.SEQPROPOSTA, PESSJUR.NOME PESSJUR'
      ''
      'FROM BENEFICIO BE , BFCIARIOTITPLAN BT, DEPEN ,'
      'PESSOA RESPON, PESSOA BENEF, PESSOA , PESSOA PESSJUR'
      'WHERE '
      'BE.IDBENEFICIO = BT.IDBENEFICIO'
      'AND BT.IDTITULAR = :IDTITULAR'
      'AND BT.IDPESSJUR = :IDPESSJUR'
      'AND BT.IDPLANOORIGEM = :IDPLANOPREV'
      'AND BT.IDBENEFICIO = :IDBENEFICIO'
      'AND SEQPROPOSTA  = :SEQPROPOSTA'
      'AND BT.IDPESSOA = BENEF.IDPESSOA'
      'AND BT.IDTITULAR = PESSOA.IDPESSOA'
      'AND BT.IDPESSJUR = PESSJUR.IDPESSOA'
      'AND BT.IDRESPONSAVEL = RESPON.IDPESSOA(+)'
      'AND DEPEN.IDDEPENDENCIA(+) = BT.IDDEPENRESPON')
    ValidateWithMask = True
    Left = 471
    Top = 300
    ParamData = <
      item
        DataType = ftString
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object qryaux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 270
    Top = 62
  end
  object dsbeneforig: TwwDataSource
    AutoEdit = False
    DataSet = qrybeneforig
    Left = 240
    Top = 182
  end
  object dsbeneficiarioorig: TwwDataSource
    AutoEdit = False
    DataSet = qrybeneficiarioorig
    Left = 232
    Top = 308
  end
  object dsbenefdest: TwwDataSource
    AutoEdit = False
    DataSet = qrybenefdest
    Left = 519
    Top = 206
  end
  object dsbeneficiariodest: TwwDataSource
    AutoEdit = False
    DataSet = qrybeneficiariodest
    Left = 535
    Top = 316
  end
end
