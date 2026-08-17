inherited frmExecConcessaoREFER: TfrmExecConcessaoREFER
  Left = 180
  Top = 196
  ClientHeight = 440
  ClientWidth = 774
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 774
    Height = 407
    inherited pgcControle: TPageControl
      Width = 774
      Height = 374
      inherited TabSheet1: TTabSheet
        Caption = 'Principal'
        object chkElegibilidade: TCheckBox
          Left = 24
          Top = 312
          Width = 265
          Height = 33
          Caption = 'Verificar Elegibilidade'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 0
        end
      end
      inherited TabSheet2: TTabSheet
        Caption = 'Resultado'
        object Total: TLabel
          Left = 510
          Top = 138
          Width = 163
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total de Contratos gerados: '
        end
        object Label15: TLabel
          Left = 485
          Top = 342
          Width = 193
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total de Contratos NÃO gerados: '
        end
        object memResult: TMemo
          Left = 8
          Top = 34
          Width = 745
          Height = 95
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
        end
        object Panel3: TPanel
          Left = 8
          Top = 8
          Width = 745
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Contratos Gerados'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object memErro: TMemo
          Left = 8
          Top = 190
          Width = 745
          Height = 145
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 2
        end
        object Panel2: TPanel
          Left = 8
          Top = 164
          Width = 745
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Contratos NÃO Gerados'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        object edtNumResult: TRealEdit
          Left = 680
          Top = 134
          Width = 73
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '0')
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = iNumber
          Signal = False
        end
        object edtNumErro: TRealEdit
          Left = 680
          Top = 339
          Width = 73
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '0')
          TabOrder = 5
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = iNumber
          Signal = False
        end
      end
    end
    inherited Panel1: TPanel
      Width = 774
      inherited fcLabel1: TfcLabel
        Width = 410
        Caption = 'REFER - Concessão em Lote [ principal ]'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 407
    Width = 774
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 987
    Top = 11
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  object qryInscricaoLote: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   ILT.IDINSCRICAOEMPTMO,'
      '   ILT.VALORLIQUIDO1,'
      '   ILT.VALORLIQUIDO2,'
      '   ILT.VALORLIQUIDO3,'
      '   ILT.PRESTACAO1,'
      '   ILT.PRESTACAO2,'
      '   ILT.PRESTACAO3,'
      '   ILT.CQM1,'
      '   ILT.CQM2,'
      '   ILT.CQM3,'
      '   ILT.IOF1,'
      '   ILT.IOF2,'
      '   ILT.IOF3,'
      '   ILT.CPMF1,'
      '   ILT.CPMF2,'
      '   ILT.CPMF3,'
      '   ILT.TXADM1,'
      '   ILT.TXADM2,'
      '   ILT.TXADM3,'
      '   ILT.VALORBRUTO1,'
      '   ILT.VALORBRUTO2,'
      '   ILT.VALORBRUTO3,'
      '   ILT.OPCAO,'
      '   ILT.FLGPROCESSADO'
      'FROM'
      '   INSCRICAOLOTE ILT'
      'WHERE'
      '   ILT.FLGPROCESSADO = 0')
    UpdateObject = updInscricaoLote
    ValidateWithMask = True
    Left = 488
    Top = 80
    object qryInscricaoLoteIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
      Origin = 'BASEDADOS.INSCRICAOLOTE.IDINSCRICAOEMPTMO'
    end
    object qryInscricaoLoteVALORLIQUIDO1: TFloatField
      FieldName = 'VALORLIQUIDO1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.VALORLIQUIDO1'
    end
    object qryInscricaoLoteVALORLIQUIDO2: TFloatField
      FieldName = 'VALORLIQUIDO2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.VALORLIQUIDO2'
    end
    object qryInscricaoLoteVALORLIQUIDO3: TFloatField
      FieldName = 'VALORLIQUIDO3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.VALORLIQUIDO3'
    end
    object qryInscricaoLotePRESTACAO1: TFloatField
      FieldName = 'PRESTACAO1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.PRESTACAO1'
    end
    object qryInscricaoLotePRESTACAO2: TFloatField
      FieldName = 'PRESTACAO2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.PRESTACAO2'
    end
    object qryInscricaoLotePRESTACAO3: TFloatField
      FieldName = 'PRESTACAO3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.PRESTACAO3'
    end
    object qryInscricaoLoteCQM1: TFloatField
      FieldName = 'CQM1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.CQM1'
    end
    object qryInscricaoLoteCQM2: TFloatField
      FieldName = 'CQM2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.CQM2'
    end
    object qryInscricaoLoteCQM3: TFloatField
      FieldName = 'CQM3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.CQM3'
    end
    object qryInscricaoLoteIOF1: TFloatField
      FieldName = 'IOF1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.IOF1'
    end
    object qryInscricaoLoteIOF2: TFloatField
      FieldName = 'IOF2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.IOF2'
    end
    object qryInscricaoLoteIOF3: TFloatField
      FieldName = 'IOF3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.IOF3'
    end
    object qryInscricaoLoteCPMF1: TFloatField
      FieldName = 'CPMF1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.CPMF1'
    end
    object qryInscricaoLoteCPMF2: TFloatField
      FieldName = 'CPMF2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.CPMF2'
    end
    object qryInscricaoLoteCPMF3: TFloatField
      FieldName = 'CPMF3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.CPMF3'
    end
    object qryInscricaoLoteTXADM1: TFloatField
      FieldName = 'TXADM1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.TXADM1'
    end
    object qryInscricaoLoteTXADM2: TFloatField
      FieldName = 'TXADM2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.TXADM2'
    end
    object qryInscricaoLoteTXADM3: TFloatField
      FieldName = 'TXADM3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.TXADM3'
    end
    object qryInscricaoLoteVALORBRUTO1: TFloatField
      FieldName = 'VALORBRUTO1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.VALORBRUTO1'
    end
    object qryInscricaoLoteVALORBRUTO2: TFloatField
      FieldName = 'VALORBRUTO2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.VALORBRUTO2'
    end
    object qryInscricaoLoteVALORBRUTO3: TFloatField
      FieldName = 'VALORBRUTO3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.VALORBRUTO3'
    end
    object qryInscricaoLoteOPCAO: TFloatField
      FieldName = 'OPCAO'
      Origin = 'BASEDADOS.INSCRICAOLOTE.OPCAO'
    end
    object qryInscricaoLoteFLGPROCESSADO: TFloatField
      FieldName = 'FLGPROCESSADO'
      Origin = 'BASEDADOS.INSCRICAOLOTE.FLGPROCESSADO'
    end
  end
  object qryInscricao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   INS.*'
      'FROM'
      '   INSCRICAOEMPTMO INS'
      'WHERE'
      '   INS.IDINSCRICAOEMPTMO =:PIDINSCRICAOEMPTMO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 617
    Top = 82
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDINSCRICAOEMPTMO'
        ParamType = ptInput
      end>
    object qryInscricaoIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.IDINSCRICAOEMPTMO'
    end
    object qryInscricaoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.IDTIPOCONTREMPTMO'
    end
    object qryInscricaoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.IDPESSOA'
    end
    object qryInscricaoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.IDPATRO'
    end
    object qryInscricaoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.IDPLANOPREV'
    end
    object qryInscricaoIDVERBA: TFloatField
      FieldName = 'IDVERBA'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.IDVERBA'
    end
    object qryInscricaoIDBENEF: TFloatField
      FieldName = 'IDBENEF'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.IDBENEF'
    end
    object qryInscricaoIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.IDCBANCARIA'
    end
    object qryInscricaoFLGPENDENTE: TStringField
      FieldName = 'FLGPENDENTE'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.FLGPENDENTE'
      FixedChar = True
      Size = 1
    end
    object qryInscricaoFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryInscricaoFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryInscricaoFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryInscricaoCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.CODFORMAPAG'
    end
    object qryInscricaoPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.PORTFORMAPAG'
    end
    object qryInscricaoPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.PORTFORMAREC'
    end
    object qryInscricaoDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.DATAINSC'
    end
    object qryInscricaoDATACANCINSC: TDateTimeField
      FieldName = 'DATACANCINSC'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.DATACANCINSC'
    end
    object qryInscricaoIDMOTIVOCANC: TFloatField
      FieldName = 'IDMOTIVOCANC'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.IDMOTIVOCANC'
    end
    object qryInscricaoVLRSOLIC: TFloatField
      FieldName = 'VLRSOLIC'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.VLRSOLIC'
    end
    object qryInscricaoNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.NUMPARCELAS'
    end
    object qryInscricaoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.TRGDTINCLUSAO'
    end
    object qryInscricaoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryInscricaoFLGSUSPENSAOAUTO: TFloatField
      FieldName = 'FLGSUSPENSAOAUTO'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.FLGSUSPENSAOAUTO'
    end
    object qryInscricaoVLRSALBASE: TFloatField
      FieldName = 'VLRSALBASE'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.VLRSALBASE'
    end
    object qryInscricaoVLRMARGEM: TFloatField
      FieldName = 'VLRMARGEM'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.VLRMARGEM'
    end
    object qryInscricaoVLRMAXPERMIT: TFloatField
      FieldName = 'VLRMAXPERMIT'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.VLRMAXPERMIT'
    end
    object qryInscricaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.MOECODIGO'
    end
    object qryInscricaoDATAVALIDADE: TDateTimeField
      FieldName = 'DATAVALIDADE'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.DATAVALIDADE'
    end
    object qryInscricaoFLGALTSALARIO: TFloatField
      FieldName = 'FLGALTSALARIO'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.FLGALTSALARIO'
    end
    object qryInscricaoFLGALTMARGEM: TFloatField
      FieldName = 'FLGALTMARGEM'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.FLGALTMARGEM'
    end
    object qryInscricaoFLGALTVALMAX: TFloatField
      FieldName = 'FLGALTVALMAX'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.FLGALTVALMAX'
    end
    object qryInscricaoVLRPARCELAMES: TFloatField
      FieldName = 'VLRPARCELAMES'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.VLRPARCELAMES'
    end
    object qryInscricaoVLRPARCATRASO: TFloatField
      FieldName = 'VLRPARCATRASO'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.VLRPARCATRASO'
    end
    object qryInscricaoFLGINTERNET: TFloatField
      FieldName = 'FLGINTERNET'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.FLGINTERNET'
    end
    object qryInscricaoDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.DATACREDITO'
    end
    object qryInscricaoTXJUROS: TFloatField
      FieldName = 'TXJUROS'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.TXJUROS'
    end
    object qryInscricaoIDCBANCARIADEB: TFloatField
      FieldName = 'IDCBANCARIADEB'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.IDCBANCARIADEB'
    end
    object qryInscricaoIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = 'BASEDADOS.INSCRICAOEMPTMO.IDRESPONSAVEL'
    end
  end
  object qryInscricaoSemContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   INS.*'
      'FROM'
      '   INSCRICAOEMPTMO INS,'
      '   CONTRATOEMPTMO  CON'
      ''
      'WHERE'
      '       INS.IDINSCRICAOEMPTMO =:PIDINSCRICAOEMPTMO'
      '   AND CON.IDINSCRICAOEMPTMO IS NULL'
      '   AND INS.IDINSCRICAOEMPTMO = CON.IDINSCRICAOEMPTMO(+)')
    ValidateWithMask = True
    Left = 617
    Top = 66
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDINSCRICAOEMPTMO'
        ParamType = ptInput
      end>
  end
  object updInscricaoLote: TUpdateSQL
    ModifySQL.Strings = (
      'update INSCRICAOLOTE'
      'set'
      '  FLGPROCESSADO = :FLGPROCESSADO'
      'where'
      '  IDINSCRICAOEMPTMO = :OLD_IDINSCRICAOEMPTMO')
    InsertSQL.Strings = (
      'insert into INSCRICAOLOTE'
      '  (IDINSCRICAOEMPTMO, FLGPROCESSADO)'
      'values'
      '  (:IDINSCRICAOEMPTMO, :FLGPROCESSADO)')
    DeleteSQL.Strings = (
      'delete from INSCRICAOLOTE'
      'where'
      '  IDINSCRICAOEMPTMO = :OLD_IDINSCRICAOEMPTMO')
    Left = 488
    Top = 64
  end
  object qryInsertContratoEmptmo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CONTRATOEMPTMO'
      '('
      
        'IDCONTRATOEMPTMO, MOECODIGO, IDINSCRICAOEMPTMO, IDTIPOCONTREMPTM' +
        'O,'
      
        'IDPESSOA, IDPATRO, IDPLANOPREV, IDBENEF, IDCBANCARIA, FLGSITUACA' +
        'O, FLGFORMAREC,'
      
        'FLGFORMAPAG, CODFORMAPAG, PORTFORMAPAG, PORTFORMAREC, DATAASSINA' +
        'TURA,'
      
        'VLRCONTRATO, VLRPARCELA, TXJUROS, NUMPARCELAS, DATACREDITO, DATA' +
        'PRIMPARC,'
      'IDCBANCARIADEB'
      ')'
      'VALUES'
      '('
      
        ':PIDCONTRATOEMPTMO, :PMOECODIGO, :PIDINSCRICAOEMPTMO, :PIDTIPOCO' +
        'NTREMPTMO,'
      
        ':PIDPESSOA, :PIDPATRO, :PIDPLANOPREV, :PIDBENEF, :PIDCBANCARIA, ' +
        #39'A'#39', :PFLGFORMAREC,'
      
        ':PFLGFORMAPAG, :PCODFORMAPAG, :PPORTFORMAPAG, :PPORTFORMAREC, :P' +
        'DATAASSINATURA,'
      
        ':PVLRCONTRATO, :PVLRPARCELA, :PTXJUROS, :PNUMPARCELAS, :PDATACRE' +
        'DITO, :PDATAPRIMPARC,'
      ':PIDCBANCARIADEB'
      ')')
    ValidateWithMask = True
    Left = 345
    Top = 82
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMOECODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDINSCRICAOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCBANCARIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGFORMAREC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGFORMAPAG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODFORMAPAG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PPORTFORMAPAG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PPORTFORMAREC'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAASSINATURA'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVLRCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVLRPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PTXJUROS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNUMPARCELAS'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATACREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAPRIMPARC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCBANCARIADEB'
        ParamType = ptInput
      end>
    object FloatField1: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
      Origin = 'BASEDADOS.INSCRICAOLOTE.IDINSCRICAOEMPTMO'
    end
    object FloatField2: TFloatField
      FieldName = 'VALORLIQUIDO1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.VALORLIQUIDO1'
    end
    object FloatField3: TFloatField
      FieldName = 'VALORLIQUIDO2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.VALORLIQUIDO2'
    end
    object FloatField4: TFloatField
      FieldName = 'VALORLIQUIDO3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.VALORLIQUIDO3'
    end
    object FloatField5: TFloatField
      FieldName = 'PRESTACAO1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.PRESTACAO1'
    end
    object FloatField6: TFloatField
      FieldName = 'PRESTACAO2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.PRESTACAO2'
    end
    object FloatField7: TFloatField
      FieldName = 'PRESTACAO3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.PRESTACAO3'
    end
    object FloatField8: TFloatField
      FieldName = 'CQM1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.CQM1'
    end
    object FloatField9: TFloatField
      FieldName = 'CQM2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.CQM2'
    end
    object FloatField10: TFloatField
      FieldName = 'CQM3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.CQM3'
    end
    object FloatField11: TFloatField
      FieldName = 'IOF1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.IOF1'
    end
    object FloatField12: TFloatField
      FieldName = 'IOF2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.IOF2'
    end
    object FloatField13: TFloatField
      FieldName = 'IOF3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.IOF3'
    end
    object FloatField14: TFloatField
      FieldName = 'CPMF1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.CPMF1'
    end
    object FloatField15: TFloatField
      FieldName = 'CPMF2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.CPMF2'
    end
    object FloatField16: TFloatField
      FieldName = 'CPMF3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.CPMF3'
    end
    object FloatField17: TFloatField
      FieldName = 'TXADM1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.TXADM1'
    end
    object FloatField18: TFloatField
      FieldName = 'TXADM2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.TXADM2'
    end
    object FloatField19: TFloatField
      FieldName = 'TXADM3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.TXADM3'
    end
    object FloatField20: TFloatField
      FieldName = 'VALORBRUTO1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.VALORBRUTO1'
    end
    object FloatField21: TFloatField
      FieldName = 'VALORBRUTO2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.VALORBRUTO2'
    end
    object FloatField22: TFloatField
      FieldName = 'VALORBRUTO3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.VALORBRUTO3'
    end
    object FloatField23: TFloatField
      FieldName = 'OPCAO'
      Origin = 'BASEDADOS.INSCRICAOLOTE.OPCAO'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.INSCRICAOLOTE.TRGDTINCLUSAO'
    end
    object StringField1: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.INSCRICAOLOTE.TRGUSERINCLUSAO'
      Size = 30
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATACREDITO'
      Origin = 'BASEDADOS.INSCRICAOLOTE.DATACREDITO'
    end
    object FloatField24: TFloatField
      FieldName = 'FLGPROCESSADO'
      Origin = 'BASEDADOS.INSCRICAOLOTE.FLGPROCESSADO'
    end
    object StringField2: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
end
