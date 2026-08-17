inherited FrmAssocReservaPart: TFrmAssocReservaPart
  Left = 196
  Top = 210
  HelpContext = 4520003
  Caption = 'Associação de Reservas ao Participante'
  ClientHeight = 436
  ClientWidth = 668
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 668
    Height = 397
    object Splitter1: TSplitter
      Left = 1
      Top = 161
      Width = 666
      Height = 7
      Cursor = crVSplit
      Align = alTop
    end
    object pnlInformacao: TPanel
      Left = 1
      Top = 168
      Width = 666
      Height = 228
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Panel2: TPanel
        Left = 293
        Top = 0
        Width = 80
        Height = 228
        Align = alClient
        TabOrder = 0
        object sbtnAssocia: TSpeedButton
          Left = 13
          Top = 114
          Width = 47
          Height = 34
          Hint = 'Desassociar reserva'
          Caption = '<'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnAssociaClick
        end
        object sbtnAssociaTodos: TSpeedButton
          Left = 13
          Top = 152
          Width = 47
          Height = 34
          Hint = 'Desassociar todas as reservas'
          Caption = '<<'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnAssociaTodosClick
        end
        object sbtnDesassocia: TSpeedButton
          Left = 13
          Top = 38
          Width = 47
          Height = 34
          Hint = 'Associar reserva'
          Caption = '>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnDesassociaClick
        end
        object sbtnDesassociaTodos: TSpeedButton
          Left = 13
          Top = 76
          Width = 47
          Height = 34
          Hint = 'Associar todas as reservas'
          Caption = '>>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnDesassociaTodosClick
        end
      end
      object Panel3: TPanel
        Left = 373
        Top = 0
        Width = 293
        Height = 228
        Align = alRight
        TabOrder = 1
        object Label9: TLabel
          Left = 1
          Top = 1
          Width = 291
          Height = 27
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'Reservas Relacionadas'
          Color = clInactiveCaption
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentColor = False
          ParentFont = False
        end
        object dbgridreservarel: TwwDBGrid
          Left = 1
          Top = 28
          Width = 291
          Height = 199
          Hint = 'Duplo-Clique para Ativar/Desativar reservas'
          Selected.Strings = (
            'ATIVO'#9'10'#9'ATIVO'
            'NOME'#9'50'#9'NOME')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = False
          ShowVertScrollBar = False
          Align = alClient
          DataSource = dsreservarel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgEditing, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          ParentShowHint = False
          PopupMenu = popmnureserva
          ShowHint = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = dbgridreservarelCalcCellColors
          OnDblClick = dbgridreservarelDblClick
          OnDragDrop = dbgridreservarelDragDrop
          OnDragOver = dbgridreservarelDragOver
          OnMouseDown = dbgridreservarelMouseDown
          IndicatorColor = icBlack
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 293
        Height = 228
        Align = alLeft
        TabOrder = 2
        object Label8: TLabel
          Left = 1
          Top = 1
          Width = 291
          Height = 27
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'Reservas não Relacionadas'
          Color = clInactiveCaption
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentColor = False
          ParentFont = False
        end
        object lstbxreserva: TDBLookupListBox
          Left = 1
          Top = 28
          Width = 291
          Height = 199
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'IDTIPORESERVA'
          ListField = 'NOME'
          ListSource = dsreserva
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          OnDragDrop = lstbxreservaDragDrop
          OnDragOver = lstbxreservaDragOver
          OnMouseDown = lstbxreservaMouseDown
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 666
      Height = 160
      Align = alTop
      TabOrder = 1
      object lblValores: TLabel
        Left = 15
        Top = 4
        Width = 222
        Height = 23
        AutoSize = False
        Caption = 'Dados do Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object ConsPart1: TConsPart
        Left = 15
        Top = 82
        Width = 96
        Height = 42
        Caption = '&Consulta'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333300333333
          3333333333333333333333330033333333333333333333333333333303333330
          3333333333333333333333330333333033333333333333333333333330333300
          0333333333333333333333333033330003333333333333333333333330033003
          3333333333333333333333333003300333333333333333333333333333030033
          3333333333333333333333333303003333333333333333333333333333000333
          3333333333333333333333333300033333333333333333330033333333000333
          3333333333333330003333333300033333333337000733000333333303300003
          333333000000000333333333033000033333307888EE70333333333330300333
          33337088888EE073333333333030033333330888888888033333333333000333
          33330888888888033333333333000333333308E8888888033333333333300333
          333308EEE888880333333333333003333333307EEE8870333333333333330033
          3333330088800333333333333333003333333337000733333333333333330033
          3333333333333333333333333333003333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        ParentFont = False
      end
      object Panel5: TPanel
        Left = 660
        Top = 181
        Width = 259
        Height = 166
        Caption = 'Panel5'
        Enabled = False
        TabOrder = 0
        Visible = False
        object Label1: TLabel
          Left = 15
          Top = 7
          Width = 152
          Height = 13
          Caption = 'Situação na Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 15
          Top = 45
          Width = 105
          Height = 13
          Caption = 'Situação no Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 15
          Top = 83
          Width = 129
          Height = 13
          Caption = 'Situação na Fundação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edSitPatro: TEdit
          Left = 15
          Top = 20
          Width = 230
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'edSitPatro'
          Visible = False
        end
        object edSitFundacao: TEdit
          Left = 15
          Top = 96
          Width = 230
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = 'edSitFundacao'
          Visible = False
        end
      end
      object bbtnProcurar: TBitBtn
        Left = 15
        Top = 37
        Width = 96
        Height = 42
        Hint = 'Procurar participante'
        Caption = '&Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bbtnProcurarClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      end
      object Panel7: TPanel
        Left = 237
        Top = 14
        Width = 410
        Height = 118
        BevelOuter = bvNone
        TabOrder = 2
        object Label4: TLabel
          Left = 14
          Top = 5
          Width = 95
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
          Top = 43
          Width = 162
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
          Top = 84
          Width = 112
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
          Top = 25
          Width = 355
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
          Top = 101
          Width = 355
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
          Top = 62
          Width = 355
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 14
          Top = 130
          Width = 35
          Height = 19
          Caption = 'Filial'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblfilial: TLabel
          Left = 14
          Top = 146
          Width = 296
          Height = 16
          AutoSize = False
          Caption = 'lblfilial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 397
    Width = 668
    inherited tb97Fundo: TToolbar97
      Left = 500
      DockPos = 502
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryreserva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT  RP.NOME, RP.IDTIPORESERVA'
      'FROM RESERVAXPLANO RP'
      'WHERE RP.IDTIPORESERVA'
      ' NOT IN (SELECT RA.IDTIPORESERVA'
      'FROM RESERVAPART RA '
      'WHERE '
      'RA.IDPESSOA = :IDPESSOA'
      'AND RA.SEQPROPOSTA = :SEQPROPOSTA'
      'AND RA.IDPLANOPREV = :IDPLANOPREV'
      'AND RA.IDPESSJUR =  :IDPESSJUR)'
      'AND RP.IDPLANOPREV = :IDPLANOPREV'
      'ORDER BY RP.NOME')
    ValidateWithMask = True
    Left = 85
    Top = 212
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPLANOPREV'
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
      end>
  end
  object dsreserva: TwwDataSource
    AutoEdit = False
    DataSet = qryreserva
    Left = 112
    Top = 256
  end
  object qryreservarel: TwwQuery
    OnCalcFields = qryreservarelCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT  RP.NOME, RP.IDTIPORESERVA,'
      'DECODE(RA.FLGATIVO,1,'#39'Ativo'#39',0,'#39'Desativado'#39') flgativo,'
      'RA.FLGATIVO FLGATIVOC'
      'FROM RESERVAXPLANO RP, RESERVAPART RA'
      'WHERE RP.IDTIPORESERVA = RA.IDTIPORESERVA'
      'AND RP.IDPLANOPREV = RA.IDPLANOPREV'
      'AND RA.IDPESSOA = :IDPESSOA'
      'AND RA.SEQPROPOSTA = :SEQPROPOSTA'
      'AND RA.IDPLANOPREV = :IDPLANOPREV'
      'AND RA.IDPESSJUR =  :IDPESSJUR'
      'ORDER BY RP.NOME')
    ControlType.Strings = (
      'FLGATIVOC;CheckBox;1;0')
    ValidateWithMask = True
    Left = 474
    Top = 220
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '71'
      end
      item
        DataType = ftString
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '67'
      end>
    object qryreservarelATIVO: TStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'ATIVO'
      Calculated = True
    end
    object qryreservarelNOME: TStringField
      DisplayWidth = 50
      FieldName = 'NOME'
      Size = 50
    end
    object qryreservarelFLGATIVO: TStringField
      Alignment = taCenter
      DisplayWidth = 10
      FieldName = 'FLGATIVO'
      Visible = False
      Size = 10
    end
    object qryreservarelIDTIPORESERVA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPORESERVA'
      Visible = False
    end
    object qryreservarelFLGATIVOC: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGATIVOC'
      Visible = False
    end
  end
  object dsreservarel: TwwDataSource
    AutoEdit = False
    DataSet = qryreservarel
    Left = 474
    Top = 252
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'PARTPREVPLAN.SEQPROPOSTA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 132
    Top = 18
  end
  object qryaux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 205
    Top = 101
  end
  object popmnureserva: TPopupMenu
    OnPopup = popmnureservaPopup
    Left = 309
    Top = 149
    object AtivarReserva1: TMenuItem
      Caption = '&Ativar Reserva'
      OnClick = AtivarReserva1Click
    end
    object DesativarReserva1: TMenuItem
      Caption = '&Desativar Reserva'
      OnClick = DesativarReserva1Click
    end
  end
end
