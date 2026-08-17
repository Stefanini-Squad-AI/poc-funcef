inherited FrmOkCancelarImob1: TFrmOkCancelarImob1
  Left = 242
  Top = 174
  Caption = 'FrmOkCancelarImob1'
  ClientHeight = 436
  ClientWidth = 753
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 753
    Height = 403
    object Bevel2: TBevel
      Left = 16
      Top = 34
      Width = 720
      Height = 3
      Shape = bsBottomLine
    end
    object lbNomItem: TfcLabel
      Left = 16
      Top = 8
      Width = 139
      Height = 24
      Caption = 'Nome do Item'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
    end
    object Label4: TLabel
      Left = 16
      Top = 177
      Width = 126
      Height = 13
      Caption = 'Grupo de Lançamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbGrupo: TLabel
      Left = 590
      Top = 48
      Width = 108
      Height = 13
      Caption = 'Tratamento quanto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object chkCentraliza: TCheckBox
      Left = 630
      Top = 11
      Width = 107
      Height = 17
      Caption = 'Total do Grupo'
      TabOrder = 0
    end
    object pnlCContabilBaixa: TPanel
      Left = 8
      Top = 222
      Width = 241
      Height = 46
      BevelOuter = bvNone
      TabOrder = 2
      object lblCCDebFinan: TLabel
        Left = 8
        Top = 2
        Width = 137
        Height = 13
        Caption = 'Conta Contábil de Baixa'
      end
      object btnBuscaContaCBaixa: TBitBtn
        Left = 184
        Top = 16
        Width = 24
        Height = 22
        Hint = 'Busca uma Conta Contábil'
        TabOrder = 0
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
      end
      object btnLimpaContaCBaixa: TBitBtn
        Left = 208
        Top = 16
        Width = 24
        Height = 22
        Hint = 'Limpa a seleção de Regra'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888FF8888888888888008888888888888F77F8888888888800F08888
          8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
          88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
          888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
          0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
          03088878F88878F878788887F8888090B03088878F888787878788887888880B
          0B038888788888787878888888888880B0B38888888888878788888888888888
          0BBB88888888888878F888888888888880BB8888888888888788}
        NumGlyphs = 2
      end
      object edtContaCBaixa: TMaskEdit
        Left = 8
        Top = 16
        Width = 177
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
    end
    object GrpbPeriodicidade: TGroupBox
      Left = 576
      Top = 220
      Width = 163
      Height = 74
      Caption = ' Periodicidade '
      TabOrder = 4
      object Label7: TLabel
        Left = 26
        Top = 49
        Width = 78
        Height = 13
        Caption = 'Nº de vezes: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 106
        Top = 22
        Width = 50
        Height = 13
        Caption = 'Parcelas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 6
        Top = 22
        Width = 40
        Height = 13
        Caption = 'a cada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBspnParcelas: TwwDBSpinEdit
        Left = 50
        Top = 18
        Width = 49
        Height = 21
        Increment = 1
        MaxValue = 99
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
      end
      object DBspnNumPeriodicidade: TwwDBSpinEdit
        Left = 104
        Top = 45
        Width = 49
        Height = 21
        Increment = 1
        MaxValue = 99
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
      end
    end
    object DBcboGrupoLanc: TwwDBLookupCombo
      Left = 16
      Top = 191
      Width = 377
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO'#9'F')
      DataField = 'TIPCODIGO'
      DataSource = dts
      LookupTable = dtmLookEmptmo.qryLookTipOper
      LookupField = 'TIPCODIGO'
      ParentFont = False
      TabOrder = 5
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    inline molRegraCalculo: TmolRegraDB
      Left = 8
      Top = 45
      Width = 393
      TabOrder = 6
      inherited Regra: TLabel
        Width = 99
        Caption = 'Regra de Cálculo'
      end
      inherited DBedtRegra: TDBEdit
        Width = 329
        Font.Height = -9
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited btnBuscaRegra: TBitBtn
        Left = 336
      end
      inherited btnLimpaRegra: TBitBtn
        Left = 360
      end
      inherited DBedtIDRegra: TDBEdit
        Left = 288
      end
    end
    inline molRegraDevQuitacaoAnt: TmolRegraDB
      Left = 8
      Top = 87
      Width = 393
      TabOrder = 7
      inherited Regra: TLabel
        Width = 182
        Caption = 'Regra de Cálculo na Devolução'
      end
      inherited DBedtRegra: TDBEdit
        Width = 329
        Font.Height = -9
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited btnBuscaRegra: TBitBtn
        Left = 336
      end
      inherited btnLimpaRegra: TBitBtn
        Left = 360
      end
      inherited DBedtIDRegra: TDBEdit
        Left = 288
      end
    end
    inline molRegraCalculoDiario: TmolRegraDB
      Left = 8
      Top = 129
      Width = 393
      TabOrder = 8
      inherited Regra: TLabel
        Width = 311
        Caption = 'Regra de Cálculo Diário (para item com reajuste diário)'
      end
      inherited DBedtRegra: TDBEdit
        Width = 329
        Font.Height = -9
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited btnBuscaRegra: TBitBtn
        Left = 336
      end
      inherited btnLimpaRegra: TBitBtn
        Left = 360
      end
      inherited DBedtIDRegra: TDBEdit
        Left = 288
      end
    end
    object GrpRubricas: TGroupBox
      Left = 16
      Top = 270
      Width = 513
      Height = 117
      Caption = ' Rubricas '
      TabOrder = 9
      object Label1: TLabel
        Left = 35
        Top = 20
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Normal: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 38
        Top = 44
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Atraso: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 13
        Top = 68
        Width = 70
        Height = 13
        Alignment = taRightJustify
        Caption = 'Devolução: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 42
        Top = 92
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Saldo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBcboRubNormal: TwwDBLookupCombo
        Left = 88
        Top = 16
        Width = 409
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'1'#9'Descrição'#9'F')
        LookupTable = dtmLookEmptmo.qryLookRubricaInforma
        LookupField = 'IDPROVENTO'
        DropDownCount = 4
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object DBcboRubAtraso: TwwDBLookupCombo
        Left = 88
        Top = 40
        Width = 409
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'1'#9'Descrição'#9'F')
        LookupTable = dtmLookEmptmo.qryLookRubricaNormal
        LookupField = 'IDPROVENTO'
        DropDownCount = 4
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object DBcboRubDevolucao: TwwDBLookupCombo
        Left = 88
        Top = 64
        Width = 409
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'1'#9'Descrição'#9'F')
        LookupTable = dtmLookEmptmo.qryLookRubricaAtraso
        LookupField = 'IDPROVENTO'
        DropDownCount = 4
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object DBcboRubSaldo: TwwDBLookupCombo
        Left = 88
        Top = 88
        Width = 409
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'1'#9'Descrição'#9'F')
        LookupTable = dtmLookEmptmo.qryLookProventoS
        LookupField = 'IDPROVENTO'
        DropDownCount = 4
        ParentFont = False
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    object GroupBox1: TGroupBox
      Left = 544
      Top = 296
      Width = 193
      Height = 91
      TabOrder = 13
      object lblSeqCalculo: TLabel
        Left = 35
        Top = 24
        Width = 99
        Height = 13
        Alignment = taRightJustify
        Caption = 'Seq. de Cálculo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 16
        Top = 61
        Width = 118
        Height = 13
        Alignment = taRightJustify
        Caption = 'Prioridade p/ Baixa: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBspnSeqCalculo: TwwDBSpinEdit
        Left = 136
        Top = 20
        Width = 49
        Height = 21
        Increment = 1
        MaxValue = 99
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
      end
      object DBspnPrioridade: TwwDBSpinEdit
        Left = 136
        Top = 57
        Width = 49
        Height = 21
        Increment = 1
        MaxValue = 99
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
      end
    end
    object rdgTipoItem: TDBRadioGroup
      Left = 408
      Top = 48
      Width = 161
      Height = 105
      Caption = ' Tipo de Item '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        'Concessão'
        'Parcela'
        'Amortização'
        'Quitação'
        'Atualização Débito')
      ParentFont = False
      TabOrder = 1
    end
    object RdGrpIncidencia: TDBRadioGroup
      Left = 576
      Top = 160
      Width = 163
      Height = 54
      Caption = ' Incidência '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object DBrdgAgrupadoDestacado: TDBRadioGroup
      Left = 408
      Top = 160
      Width = 161
      Height = 54
      Caption = ' Cobrança do Item '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        'Agrupado'
        'Destacado')
      ParentFont = False
      TabOrder = 10
    end
    object rdgNaturezaItem: TDBRadioGroup
      Left = 256
      Top = 220
      Width = 313
      Height = 44
      Caption = ' Natureza do Item '
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      TabStop = True
    end
    object rdgTrataSaldo: TDBRadioGroup
      Left = 576
      Top = 60
      Width = 163
      Height = 93
      Caption = ' ao Saldo Devedor '
      Items.Strings = (
        'Não tratar'
        'Abater'
        'Incorporar ')
      TabOrder = 12
      TabStop = True
    end
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 753
    inherited tb97Fundo: TToolbar97
      Left = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 995
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IRC.ITEDESCRICAO,'
      ''
      '   IT.IDREGRACALC, RCALC.NOMEREGRA AS NOMERCALC,'
      '   IT.IDREGRADEVOL, RDEVOL.NOMEREGRA AS NOMERDEVOL,'
      '   IT.IDREGRADIARIA, RDIARIO.NOMEREGRA AS NOMERDIARIO,'
      ''
      '   IT.IDPROVENTON, RUBN.DESCRICAO AS DESCRUBNORMAL,'
      '   IT.IDPROVENTOA, RUBA.DESCRICAO AS DESCRUBATRASO,'
      '   IT.IDPROVENTOD, RUBD.DESCRICAO AS DESCRUBDDEVOL,'
      '   IT.IDPROVENTOS, RUBS.DESCRICAO AS DESCRUBSSALDO,'
      ''
      '   IT.IDITEMEMPTMO, IT.IDTIPOCONTREMPTMO, IT.ITCEVENTO,'
      '   IT.ITCRECPAG, IT.ITCSEQCALCULO, IT.FLGTEMPORARIO,'
      '   IT.FLGCENTRALIZA, IT.FLGDESTACADO, IT.CODTIPDOC,'
      '   IT.ITCNUMVEZES, IT.ITCPERIODICIDADE, IT.PLANO,'
      '   IT.ITCPRIORIDADE, IT.TIPCODIGO, IT.ITCTRATASALDODEV,'
      '   IT.CONTABAIXA'
      ''
      'FROM'
      '   ITEMXTIPOCONTR IT, ITEMEMPTMO IRC,'
      ''
      '   REGRA RCALC,'
      '   REGRA RDEVOL,'
      '   REGRA RDIARIO,'
      '   PROVDESC RUBN,'
      '   PROVDESC RUBA,'
      '   PROVDESC RUBD,'
      '   PROVDESC RUBS'
      ''
      'WHERE'
      '   ( IT.IDITEMEMPTMO =:PIDITEMEMPTMO )'
      '   AND ( IT.IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO )'
      '   AND ( IT.IDITEMEMPTMO = IRC.IDITEMEMPTMO )'
      '   AND ( IT.IDREGRACALC = RCALC.IDREGRA(+) )'
      '   AND ( IT.IDREGRADEVOL = RDEVOL.IDREGRA(+) )'
      '   AND ( IT.IDREGRADIARIA = RDIARIO.IDREGRA(+) )'
      '   AND ( IT.IDPROVENTON = RUBN.IDPROVENTO(+) )'
      '   AND ( IT.IDPROVENTOA = RUBA.IDPROVENTO(+) )'
      '   AND ( IT.IDPROVENTOD = RUBD.IDPROVENTO(+) )'
      '   AND ( IT.IDPROVENTOS = RUBS.IDPROVENTO(+) )')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 328
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDItemEmptmo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTipoContrEmptmo'
        ParamType = ptInput
      end>
  end
  object dts: TwwDataSource
    DataSet = qry
    Left = 360
    Top = 8
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMXTIPOCONTR'
      'set'
      '  IDTIPOCONTREMPTMO = :IDTIPOCONTREMPTMO,'
      '  IDITEMEMPTMO = :IDITEMEMPTMO,'
      '  ITCRECPAG = :ITCRECPAG,'
      '  IDREGRACALC = :IDREGRACALC,'
      '  IDREGRADEVOL = :IDREGRADEVOL,'
      '  IDREGRADIARIA = :IDREGRADIARIA,'
      '  ITCEVENTO = :ITCEVENTO,'
      '  FLGCENTRALIZA = :FLGCENTRALIZA,'
      '  FLGDESTACADO = :FLGDESTACADO,'
      '  ITCSEQCALCULO = :ITCSEQCALCULO,'
      '  ITCPRIORIDADE = :ITCPRIORIDADE,'
      '  ITCTRATASALDODEV = :ITCTRATASALDODEV,'
      '  FLGTEMPORARIO = :FLGTEMPORARIO,'
      '  ITCPERIODICIDADE = :ITCPERIODICIDADE,'
      '  ITCNUMVEZES = :ITCNUMVEZES,'
      '  IDPROVENTON = :IDPROVENTON,'
      '  IDPROVENTOA = :IDPROVENTOA,'
      '  IDPROVENTOD = :IDPROVENTOD,'
      '  PLANO = :PLANO,'
      '  CONTABAIXA = :CONTABAIXA,'
      '  CODTIPDOC = :CODTIPDOC,'
      '  TIPCODIGO = :TIPCODIGO,'
      '  IDPROVENTOS = :IDPROVENTOS'
      'where'
      '  IDTIPOCONTREMPTMO = :OLD_IDTIPOCONTREMPTMO and'
      '  IDITEMEMPTMO = :OLD_IDITEMEMPTMO')
    InsertSQL.Strings = (
      'insert into ITEMXTIPOCONTR'
      
        '  (IDTIPOCONTREMPTMO, IDITEMEMPTMO, ITCRECPAG, IDREGRACALC, IDRE' +
        'GRADEVOL, '
      
        '   IDREGRADIARIA, ITCEVENTO, FLGCENTRALIZA, FLGDESTACADO, ITCSEQ' +
        'CALCULO, '
      
        '   ITCPRIORIDADE, ITCTRATASALDODEV, FLGTEMPORARIO, ITCPERIODICID' +
        'ADE, ITCNUMVEZES, '
      
        '   IDPROVENTON, IDPROVENTOA, IDPROVENTOD, PLANO, CONTABAIXA, COD' +
        'TIPDOC, '
      '   TIPCODIGO, IDPROVENTOS)'
      'values'
      
        '  (:IDTIPOCONTREMPTMO, :IDITEMEMPTMO, :ITCRECPAG, :IDREGRACALC, ' +
        ':IDREGRADEVOL, '
      
        '   :IDREGRADIARIA, :ITCEVENTO, :FLGCENTRALIZA, :FLGDESTACADO, :I' +
        'TCSEQCALCULO, '
      
        '   :ITCPRIORIDADE, :ITCTRATASALDODEV, :FLGTEMPORARIO, :ITCPERIOD' +
        'ICIDADE, '
      
        '   :ITCNUMVEZES, :IDPROVENTON, :IDPROVENTOA, :IDPROVENTOD, :PLAN' +
        'O, :CONTABAIXA, '
      '   :CODTIPDOC, :TIPCODIGO, :IDPROVENTOS)')
    DeleteSQL.Strings = (
      'delete from ITEMXTIPOCONTR'
      'where'
      '  IDTIPOCONTREMPTMO = :OLD_IDTIPOCONTREMPTMO and'
      '  IDITEMEMPTMO = :OLD_IDITEMEMPTMO')
    Left = 296
    Top = 8
  end
end
