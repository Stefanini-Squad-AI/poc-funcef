inherited frmConsRecLoteMT: TfrmConsRecLoteMT
  Left = 59
  Top = 89
  HelpContext = 110010
  Caption = 'Consulta Recebimentos por Lote'
  ClientHeight = 416
  ClientWidth = 715
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 715
    Height = 377
    object dbgrRecebimentos: TwwDBGrid
      Left = 1
      Top = 85
      Width = 713
      Height = 291
      Selected.Strings = (
        'RAZAOSOCIAL'#9'60'#9'Cliente'
        'NODOCUMENTO'#9'10'#9'Documento'
        'COMPLDOCUMENTO'#9'3'#9'Complemento'
        'VALOR'#9'10'#9'Valor Recebido'
        'NOME'#9'60'#9'Nome Fantasia'
        'CODLANCFINANC'#9'10'#9'Código no Financeiro')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsRecebimentos
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object pnlSeleciona: TPanel
      Left = 1
      Top = 1
      Width = 713
      Height = 84
      Align = alTop
      TabOrder = 1
      object spdSeleciona: TSpeedButton
        Left = 15
        Top = 11
        Width = 186
        Height = 33
        Caption = '&Selecionar Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clActiveCaption
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
        ParentFont = False
        OnClick = spdSelecionaClick
      end
      object DBText1: TDBText
        Left = 402
        Top = 8
        Width = 50
        Height = 13
        AutoSize = True
        Color = clBtnFace
        DataField = 'NUMCHQBORDERO'
        DataSource = dsRecebimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6316128
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblNumLote: TLabel
        Left = 208
        Top = 8
        Width = 191
        Height = 13
        Caption = 'Número do Lote de Recebimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 16
        Top = 56
        Width = 199
        Height = 13
        Caption = 'Bancos/Caixa x Tipo de Cobrança:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 221
        Top = 56
        Width = 50
        Height = 13
        AutoSize = True
        Color = clBtnFace
        DataField = 'DESCRICAO'
        DataSource = dsRecebimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6316128
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label2: TLabel
        Left = 208
        Top = 32
        Width = 128
        Height = 13
        Caption = 'Data do Recebimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText3: TDBText
        Left = 342
        Top = 32
        Width = 50
        Height = 13
        AutoSize = True
        Color = clBtnFace
        DataField = 'DATALANCTO'
        DataSource = dsRecebimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6316128
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label3: TLabel
        Left = 472
        Top = 32
        Width = 91
        Height = 13
        Caption = 'Data com Float:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText4: TDBText
        Left = 568
        Top = 32
        Width = 50
        Height = 13
        AutoSize = True
        Color = clBtnFace
        DataField = 'DATACFLOAT'
        DataSource = dsRecebimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6316128
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label4: TLabel
        Left = 472
        Top = 8
        Width = 92
        Height = 13
        Caption = 'Total Recebido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object reTotRec: TRealEdit
        Left = 565
        Top = 4
        Width = 121
        Height = 17
        Alignment = taRightJustify
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6316128
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '0,00')
        ParentFont = False
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 377
    Width = 715
    inherited tb97Fundo: TToolbar97
      Left = 421
      inherited sep1: TToolbarSep97
        Left = 162
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 81
        HelpContext = 110010
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 35
    Top = 187
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object dsRecebimentos: TwwDataSource
    DataSet = cdsRecebimentos
    Left = 350
    Top = 168
  end
  object cdsRecebimentos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 440
    Top = 168
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PORTADORFORMA.DESCRICAO'
      'RECBTOPAGTO.NUMCHQBORDERO'
      'LANCTODOCUM.DATALANCTO'
      'RECBTOPAGTO.DATACFLOAT')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'D')
    Descricao.Strings = (
      'Bancos/Caixa x Forma de Pagamento'
      'Número do Lote'
      'Data da Baixa'
      'Data com Float')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DOCUMENTO'
      'LANCTODOCUM'
      'RECBTOPAGTO'
      'PORTADORFORMA')
    CamposChave.Strings = (
      'RECBTOPAGTO.NUMCHQBORDERO'
      'RECBTOPAGTO.CODPORTFORMA'
      'RECBTOPAGTO.DATACFLOAT')
    Filtro.Strings = (
      'RECBTOPAGTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO'
      'DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO'
      'RECBTOPAGTO.NUMLANCTO = LANCTODOCUM.NUMLANCTO'
      'RECBTOPAGTO.CODPORTFORMA = PORTADORFORMA.CODPORTFORMA'
      'DOCUMENTO.RECPAG = '#39'R'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '15'
      '18'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 269
    Top = 230
  end
  object sqlRecebimentos: TCMSqlParams
    SQL.Strings = (
      'SELECT R.NUMCHQBORDERO, R.DATACFLOAT, R.CODLANCFINANC,'
      '       R.CODPORTFORMA, P.DESCRICAO, L.VALOR, L.DATALANCTO,'
      '       D.NODOCUMENTO, D.COMPLDOCUMENTO, D.IDFORCLI,'
      '       PE.NOME, PE.RAZAOSOCIAL'
      
        'FROM DOCUMENTO D, LANCTODOCUM L, RECBTOPAGTO R, PORTADORFORMA P,' +
        ' PESSOA PE'
      'WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '  AND (L.CODDOCUMENTO = R.CODDOCUMENTO)'
      '  AND (L.NUMLANCTO = R.NUMLANCTO)'
      '  AND (R.CODPORTFORMA = P.CODPORTFORMA)'
      '  AND (D.IDFORCLI = PE.IDPESSOA)'
      '  AND (D.RECPAG = '#39'R'#39')'
      '  AND (R.DATACFLOAT = TO_DATE(:DATACFLOAT,'#39'DD/MM/YYYY'#39'))'
      '  AND (D.IDPESSOA = :IDPESSOA)'
      '  AND (R.CODPORTFORMA = :CODPORTFORMA)'
      '  AND (R.NUMCHQBORDERO = :NUMCHQBORDERO)'
      ''
      ' ')
    ClientDataSet = cdsRecebimentos
    Left = 392
    Top = 272
  end
end
