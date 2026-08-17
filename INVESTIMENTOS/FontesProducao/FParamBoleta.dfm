inherited FrmParamBoleta: TFrmParamBoleta
  Left = 214
  Top = 223
  Caption = 'Impressão da Boletas'
  ClientHeight = 118
  ClientWidth = 336
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 336
    Height = 79
    object Label3: TLabel
      Left = 82
      Top = 21
      Width = 102
      Height = 13
      Caption = 'Numero da Boleta'
    end
    object BtMostraCot: TSpeedButton
      Left = 230
      Top = 37
      Width = 23
      Height = 22
      Hint = 'Consultar Boletas'
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
      ParentShowHint = False
      ShowHint = True
      OnClick = BtMostraCotClick
    end
    object edBoleta: TEdit
      Left = 82
      Top = 37
      Width = 145
      Height = 21
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 79
    Width = 336
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 243
    Top = 195
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'INV.DESCINVESTIMENTO '
      'OPR .IDLOTE'
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'OPR.DATAOPERACAO '
      'OPR.NUMDOCUMENTO '
      'INV.FLGATIVO'
      'CORRETVALORES.SGLCORRETVALORES')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'D'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição da Ação '
      'Lote'
      'Tipo de Operação'
      'Data da Operação '
      'Numero do Documento '
      'Ativa'
      'Corretora de Valores')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERACAOINVEST OPR '
      'INVESTIMENTO INV'
      'OPRACAO OPA '
      'BOLSAVALORES BOV'
      'TIPOOPERACAO'
      'CORRETVALORES')
    CamposChave.Strings = (
      'OPR.DATAOPERACAO'
      'OPR.NUMDOCUMENTO')
    Filtro.Strings = (
      '(OPR.IDTIPOINVEST = 2)'
      '(OPR.IDOPERACAOINVEST = OPA.IDOPERACAOINVEST) '
      '(OPA.IDACAO = INV.IDINVESTIMENTO)                               '
      '(OPA.IDBOLSAVALORES = BOV.IDBOLSAVALORES)'
      '(OPR.IDTIPOOPERACAO = TIPOOPERACAO.IDTIPOOPERACAO)'
      ' OPR.IDCORRETVALORES = CORRETVALORES.IDCORRETVALORES(+)'
      '(OPR.IDCARTEIRAGERENC IS NULL)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '10'
      '40'
      '15'
      '20'
      '1'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 296
    Top = 11
  end
  object QryConsulta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '    BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER, OI.QTD' +
        'EOPERACAO, OI.IDOPERACAOINVEST,'
      
        '    OI.PRECOUNITOPERACAO, OI.VLROPERACAO, DS.TOTALDESPESAS, SUBS' +
        'TR(ME.DESCMERCADO,1,10) AS DESCMERCADO,'
      
        '    PS.NOME, SUBSTR(IV.DESCINVESTIMENTO,1,15) AS DESCINVESTIMENT' +
        'O, TI.DESCTIPOOPERACAO, OI.NUMDOCUMENTO,'
      '    TI.NATUREZAOPERACAO, OI.IDTIPOOPERACAO'
      
        'FROM '#9'CM.OPERACAOINVEST OI, CM.OPRACAO OA,  PESSOA PS, BOLSAVALO' +
        'RES BV,'
      #9'CM.INVESTIMENTO IV, CM.TIPOOPERACAO TI, CM.MERCADO ME,'
      
        '      '#9'(SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOT' +
        'ALDESPESAS'
      #9' FROM CM.DESPOPERINVEST DOI, TIPODESPINVEST TDI'
      #9' WHERE '#9'DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST '#9'AND'
      #9'            '#9'TDI.NATUREZAOPERACAO NOT IN ('#39'N'#39')'
      #9' GROUP BY DOI.IDOPERACAOINVEST) DS'
      'WHERE '#9'(OI.NUMDOCUMENTO      = :NUMDOC) '#9#9'AND'
      #9'(OI.IDOPERACAOINVEST = OA.IDOPERACAOINVEST)'#9'AND'
      #9'(OI.IDOPERACAOINVEST = DS.IDOPERACAOINVEST(+)) '#9'AND'
      #9'(OI.IDCORRETVALORES  = PS.IDPESSOA(+)) '#9#9'AND'
      #9'(OA.IDBOLSAVALORES    = BV.IDBOLSAVALORES)'#9'AND'
      #9'(OA.IDACAO '#9'           = IV.IDINVESTIMENTO) AND'
      #9'(TI.IDMERCADO '#9'           = ME.IDMERCADO)'#9'AND'
      #9'(OI.IDTIPOOPERACAO      = TI.IDTIPOOPERACAO)    AND'
      '        (OI.IDCARTEIRAGERENC IS NULL)'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 256
    Top = 11
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMDOC'
        ParamType = ptUnknown
        Value = 'RV-99/0037'
      end>
    object QryConsultaSGLBOLSAVALORES: TStringField
      FieldName = 'SGLBOLSAVALORES'
      Size = 10
    end
    object QryConsultaDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object QryConsultaDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object QryConsultaQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '###,###,##0.00'
    end
    object QryConsultaPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
      DisplayFormat = '###,###,##0.00'
    end
    object QryConsultaVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,##0.00'
    end
    object QryConsultaTOTALDESPESAS: TFloatField
      FieldName = 'TOTALDESPESAS'
      DisplayFormat = '###,###,##0.00'
    end
    object QryConsultaDESCMERCADO: TStringField
      FieldName = 'DESCMERCADO'
      Size = 10
    end
    object QryConsultaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QryConsultaDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 15
    end
    object QryConsultaDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryConsultaNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object QryConsultaNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Size = 1
    end
    object QryConsultaIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object QryConsultaIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
  end
end
