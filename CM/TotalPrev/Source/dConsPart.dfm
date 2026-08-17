object dtmConsPart: TdtmConsPart
  OldCreateOrder = True
  Left = 285
  Top = 161
  Height = 479
  Width = 741
  object dspartgeral: TwwDataSource
    DataSet = qrypartgeral
    Left = 124
    Top = 104
  end
  object qrypartgeral: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DECODE(EL.MATRICULA, NULL, DP.MATRICULA, EL.MATRICULA) AS' +
        '  MATRICULA,'
      '       P.NOME,'
      '       P.NUMDOCUMENTO,'
      '       PF.NOMEPAI,'
      '       PF.NOMEMAE,'
      '       PF.DATANASC,'
      
        '       DECODE(PF.SEXO, '#39'M'#39', '#39'Masculino'#39', '#39'F'#39', '#39'Feminino'#39') AS SEX' +
        'O,'
      '       DECODE(PF.ESTCIVIL,'
      '              '#39'S'#39','
      '              '#39'Solteiro(a)'#39','
      '              '#39'C'#39','
      '              '#39'Casado(a) ou Equiparado(a)'#39','
      '              '#39'D'#39','
      '              '#39'Divorciado(a)'#39','
      '              '#39'E'#39','
      '              '#39'Desquitado(a)'#39','
      '              '#39'J'#39','
      '              '#39'Separado(a) Judicial'#39','
      '              '#39'V'#39','
      '              '#39'Viúvo(a)'#39','
      '              '#39'M'#39','
      '              '#39'Marital'#39','
      '              '#39'P'#39','
      '              '#39'Separado(a)'#39','
      '              '#39'O'#39','
      '              '#39'Outros'#39') AS ESTADOCIVIL,'
      '       P.EMAIL,'
      '       EL.SALTOTAL,'
      '       EL.DATAADMISSAO,'
      '       EL.DATADEMISSAO,'
      '       EL.NIVEL,'
      
        '       DECODE(NVL(EL.FLGDIRETOR, 0), 1, '#39'Sim'#39', '#39'Não'#39') AS FLGDIRE' +
        'TOR,'
      '       NVL(EL.FLGDIRETOR, 0) AS TIPOFLGDIRETOR,'
      '       '
      '       SIT.DESCRICAO SITPART,'
      '       CARGOEXT.TITULO AS NOMECARGO,'
      
        '       DECODE(EL.IDPESSJUR, PT.IDFUNDACAO, CARGO.TITULO, FUNCAO.' +
        'TITULO) AS FUNCAO,'
      '       VFUNC.DESCRICAO AS VINCULO,'
      '       '
      '       PF.DATAMORTE,'
      '       FILIAL.NOME AS FILIAL,'
      '       LOTACAOFISICA.NOME AS LOTACAOFISICA,'
      '       NVL(PT.NOMEVALORBASE1, '#39'Opção 1'#39') AS NOMEVALORBASE1,'
      '       EL.VALORBASE1,'
      '       NVL(PT.NOMEVALORBASE2, '#39'Opção 2'#39') AS NOMEVALORBASE2,'
      '       EL.VALORBASE2,'
      '       NVL(PT.NOMEVALORBASE3, '#39'Opção 3'#39') AS NOMEVALORBASE3,'
      '       EL.VALORBASE3,'
      
        '       DECODE(PF.FLGMOLESTIAGRAVE, 1, '#39'Sim'#39', '#39'Não'#39') AS FLGMOLEST' +
        'IAGRAVE,'
      '       PF.DATAMOLESTIAGRAVE,'
      '       PF.DATAFIMMOLESTIA,'
      
        '       DECODE(PF.FLGISENTOIRRF, 1, '#39'Isento'#39', '#39'Recolhe'#39') AS SITIR' +
        'RF,'
      '       PF.FLGBLOQUEIO,'
      '       PA.NOMENACIONALIDADE,'
      '       E.CODESTADO,'
      '       CID.NOME AS CIDADE,'
      '       PF.NUMDEPIRRF,'
      '       PF.NUMDEPSALF,'
      '       PF.NUMDEPTOT,'
      '       PF.TIPOSANG,'
      '       SP.DESCRICAO SITPLANOPREV,'
      '       DECODE(PF.CORPESSOA,'
      '              2,'
      '              '#39'Branca'#39','
      '              4,'
      '              '#39'Negra'#39','
      '              6,'
      '              '#39'Amarelo'#39','
      '              8,'
      '              '#39'Parda'#39','
      '              0,'
      '              '#39'Indígena'#39') AS CORPESSOA,'
      
        '       DECODE(PF.FLGDEFICIENTE, 1, '#39'Sim'#39', '#39'Não'#39') AS FLGDEFICIENT' +
        'E,'
      '       PF.INICIOINVALIDEZ,'
      '       PF.FIMINVALIDEZ,'
      '       GR.DESCRICAO AS GRAUINSTRUCAO,'
      '       IM.IMAGEM,'
      '       SF.DESCRICAO AS SITUACAONAPATRO,'
      '       PJ.NOME PATRO,'
      '       PJ.IDPESSOA AS IDPESSJUR,'
      '       PP.IDPLANOPREV,'
      '       PP.NOME AS PLANO,'
      '       PPP.SEQPROPOSTA,'
      '       PPP.INSCRICAONUMERO,'
      '       PPP.INSCRICAODATA,'
      '       PP.IDRGELEGBENEF,'
      '       EL.DTNOMEACAO,'
      '       EL.dtexoneracao,'
      '       PPP.DATACANCELAMENTO,'
      '       NVL(DN.DESCRICAO, '#39'PRÓPRIO'#39') AS DESCRICAO,'
      
        '       DECODE(FLGISENTOIRRF, 0, '#39'Não'#39', '#39'1'#39', '#39'Sim'#39') AS FLGISENTOI' +
        'RRF,'
      
        '       DECODE(FLGSOMAIRSUPINSS, 0, '#39'Não'#39', '#39'1'#39', '#39'Sim'#39') AS FLGSOMA' +
        'IRSUPINSS,'
      '       PF.EMAILFUNCEF,'
      '       DP.Trgdtinclusao,'
      '       DP.Trguserinclusao,'
      '       LG.Trgdtalteracao as Trgdtalteracao,'
      '       PLN.DATACANCEL AS DATACANCEL,'
      '       DD.Idsitdependente,'
      '       DECODE(TRIM(DD.IDSITDEPENDENTE),'#39'0'#39','#39'Normal'#39','
      '                                       '#39'1'#39','#39'Normal'#39','
      '                                       '#39'NULL'#39','#39'Normal'#39','
      '                                       '#39'120'#39','#39'Inválido'#39','
      
        '                                       '#39'2'#39','#39'Decisão Judicial'#39') A' +
        'S SITUACAO,'
      '       DP.Datacancela'
      '      --SIG 21868  -INICIO'
      
        '      ,DECODE(EL.IDPESSJUR, 1,DECODE(TRIM(PF.FLGDEFICIENTE), 1, ' +
        #39'Física'#39', 2, '#39'Não é Portador'#39', 3, '#39'Auditiva'#39', 4, '#39'Visual'#39', 5, '#39'I' +
        'ntelectual (Mental)'#39', 6, '#39'Múltipla'#39', 7, '#39'Reabilitado'#39'),PF.DESCDE' +
        'FICIENCIA) AS TPDEFICIENCIA'
      '      , RL.NOME AS IDRESPONSAVEL'
      '      , RL.DESCRICAO AS CODTIPORESPONSAVEL'
      '      --SIG 21868  -FIM'
      ''
      '  FROM ELEGPATRO    EL,'
      '       PESSOA       P,'
      '       PESSOA       PJ,'
      '       PESSOAFISICA PF,'
      '       PESSOA       FILIAL,'
      '       PESSOA       LOTACAOFISICA,'
      '       SITPART      SIT,'
      '       CARGOEXT,'
      '       PATRO        PT,'
      '       PAIS         PA,'
      '       IMAGENS      IM,'
      '       DEPENTIT     DP,'
      '       SITFUNC      SF,'
      '       PARTPREVPLAN PPP,'
      '       PLANPREV     PP,'
      '       FUNCIONARIO  F,'
      '       CARGO,'
      '       CARGOEXT     FUNCAO,'
      '       VINCULAFUNC  VFUNC,'
      '       SITPLANOPREV SP,'
      '       GRINSTR      GR,'
      '       CIDADES      CID,'
      '       ESTADO E,'
      '       DEPEN DN,'
      '       PLANODEPENDENTE PLN,'
      '       DEPENDENTE DD,'
      '       --SIG 42986  -INICIO'
      '       (SELECT IDPESSOA, MAX(TRGDTINCLUSAO) AS Trgdtalteracao'
      '          FROM LOGALTDEPENDENTES'
      '         GROUP BY IDPESSOA'
      '       ) LG,'
      '       --SIG 126319'
      '       (SELECT DISTINCT T.* FROM ('
      #9'        SELECT TR.DESCRICAO, PL.NOME, HR.IDPESSOA, 2 AS ORDEM'
      #9'          FROM HSTREPRLEGAL HR'
      
        #9'          JOIN TIPORECEBEDOR TR ON TR.CODTIPORECEBEDOR = HR.COD' +
        'TIPORESPONSAVEL'
      #9'          JOIN PESSOA PL ON PL.IDPESSOA = HR.IDRESPONSAVEL'
      
        #9'          WHERE (HR.DATATERMINO IS NULL OR HR.DATATERMINO >= TR' +
        'UNC(SYSDATE))'
      '                    AND HR.IDPESSOA = :IDPESSOA'
      #9'        /* comentado SIG128969'
      '                UNION'
      
        #9'        SELECT DISTINCT TR.DESCRICAO, PL.NOME, BF.IDPESSOA, 1 A' +
        'S ORDEM'
      #9'          FROM BFCIARIOTITPLAN BF'
      
        #9'          JOIN TIPORECEBEDOR TR ON TR.CODTIPORECEBEDOR = BF.COD' +
        'TIPORECEBEDOR'
      #9'          JOIN PESSOA PL ON PL.IDPESSOA = BF.IDRESPONSAVEL'
      '                */'
      #9'        ORDER BY 4  '
      #9'     ) T WHERE ROWNUM = 1   '
      #9'     -- FIM SIG  126319 '
      #9'    ) RL'
      '       --SIG 42986  -FIM'
      ''
      ' WHERE (P.IDPESSOA = :IDPESSOA)'
      '   AND (DD.Idpessoa (+) = P.IDPESSOA)'
      '   AND (PLN.IDPESSOA(+) = P.IDPESSOA)'
      '   AND (DP.IDPESSOA = P.IDPESSOA)'
      '   AND (EL.IDPESSOA(+) = DP.IDPESSOA)'
      ''
      '   --SIG 42986  -INICIO'
      '   AND (LG.IDPESSOA(+) = DP.IDPESSOA)'
      '   AND (RL.IDPESSOA(+) = EL.IDPESSOA)'
      '   --SIG 42986  -FIM'
      ''
      '   AND (PJ.IDPESSOA = EL.IDPESSJUR)'
      '   AND (P.IDPESSOA = PF.IDPESSOA(+))'
      '   AND (FILIAL.IDPESSOA(+) = EL.IDESTAB)'
      '   AND (LOTACAOFISICA.IDPESSOA(+) = EL.IDLOTACAO)'
      '   AND (EL.IDCARGOEXT = CARGOEXT.IDCARGOEXT(+))'
      '   AND (EL.IDPESSJUR = CARGOEXT.IDPESSJUR(+))'
      '   AND (EL.IDPESSJUR = PT.IDPESSOA(+))'
      '   AND (PA.IDPAIS(+) = PF.IDPAIS)'
      '   AND (PF.IDCIDADES = CID.IDCIDADES(+))'
      ''
      '   AND (CID.IDESTADO = E.IDESTADO(+))'
      ''
      '   AND (P.IDIMAGEM = IM.IDIMAGEM(+))'
      '   AND (SF.IDSITFUNC(+) = EL.IDSITFUNC)'
      '   AND (DP.IDDEPENDENCIA = DN.IDDEPENDENCIA(+))'
      '      '
      '   AND (P.IDPESSOA = F.IDPESSOA(+))'
      '   AND (F.IDCARGO = CARGO.IDCARGO(+))'
      '   AND (EL.IDFUNCAOEXT = FUNCAO.IDCARGOEXT(+))'
      '   AND (EL.IDPESSJUR = FUNCAO.IDPESSJUR(+))'
      '      '
      '   AND (EL.CODVINCULAFUNC = VFUNC.CODVINCULAFUNC(+))'
      '   AND (PF.IDGRINSTR = GR.IDGRINSTR(+))'
      '      '
      '   AND (el.IDPESSOA = PPP.IDPESSOA(+))'
      '   AND (el.idpessjur = PPP.IDPESSJUR(+))'
      '   AND (PPP.IDSITPART = SIT.IDSITPART(+))'
      '   AND (PPP.IDPLANOPREV = PP.IDPLANOPREV(+))'
      '   AND ((PPP.FLGDESATIVADO = 1 AND'
      '       PPP.IDPESSOA NOT IN'
      '       (SELECT PPP1.IDPESSOA'
      '            FROM PARTPREVPLAN PPP1'
      '           WHERE PPP1.IDPESSOA = PPP.IDPESSOA'
      '             AND NVL(PPP1.FLGDESATIVADO, 0) = 0'
      '             AND PPP1.IDPESSJUR = PPP.IDPESSJUR)) OR'
      '       NVL(PPP.FLGDESATIVADO, 0) = 0)'
      '   AND (PPP.IDSITPLANOPREV = SP.IDSITPLANOPREV(+))'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 522
    Top = 403
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    object qrypartgeralMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qrypartgeralNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qrypartgeralNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qrypartgeralNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      Size = 50
    end
    object qrypartgeralNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      Size = 50
    end
    object qrypartgeralDATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
    object qrypartgeralSEXO: TStringField
      FieldName = 'SEXO'
      Size = 9
    end
    object qrypartgeralESTADOCIVIL: TStringField
      FieldName = 'ESTADOCIVIL'
      Size = 26
    end
    object qrypartgeralEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object qrypartgeralSALTOTAL: TFloatField
      FieldName = 'SALTOTAL'
    end
    object qrypartgeralDATAADMISSAO: TDateTimeField
      FieldName = 'DATAADMISSAO'
    end
    object qrypartgeralDATADEMISSAO: TDateTimeField
      FieldName = 'DATADEMISSAO'
    end
    object qrypartgeralNIVEL: TStringField
      FieldName = 'NIVEL'
      Size = 15
    end
    object qrypartgeralFLGDIRETOR: TStringField
      FieldName = 'FLGDIRETOR'
      Size = 3
    end
    object qrypartgeralTIPOFLGDIRETOR: TFloatField
      FieldName = 'TIPOFLGDIRETOR'
    end
    object qrypartgeralSITPART: TStringField
      FieldName = 'SITPART'
      Size = 50
    end
    object qrypartgeralNOMECARGO: TStringField
      FieldName = 'NOMECARGO'
      Size = 40
    end
    object qrypartgeralFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Size = 40
    end
    object qrypartgeralVINCULO: TStringField
      FieldName = 'VINCULO'
      Size = 60
    end
    object qrypartgeralDATAMORTE: TDateTimeField
      FieldName = 'DATAMORTE'
    end
    object qrypartgeralFILIAL: TStringField
      FieldName = 'FILIAL'
      Size = 60
    end
    object qrypartgeralLOTACAOFISICA: TStringField
      FieldName = 'LOTACAOFISICA'
      Size = 60
    end
    object qrypartgeralNOMEVALORBASE1: TStringField
      FieldName = 'NOMEVALORBASE1'
      Size = 60
    end
    object qrypartgeralVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
    end
    object qrypartgeralNOMEVALORBASE2: TStringField
      FieldName = 'NOMEVALORBASE2'
      Size = 60
    end
    object qrypartgeralVALORBASE2: TFloatField
      FieldName = 'VALORBASE2'
    end
    object qrypartgeralNOMEVALORBASE3: TStringField
      FieldName = 'NOMEVALORBASE3'
      Size = 60
    end
    object qrypartgeralVALORBASE3: TFloatField
      FieldName = 'VALORBASE3'
    end
    object qrypartgeralFLGMOLESTIAGRAVE: TStringField
      FieldName = 'FLGMOLESTIAGRAVE'
      Size = 3
    end
    object qrypartgeralDATAMOLESTIAGRAVE: TDateTimeField
      FieldName = 'DATAMOLESTIAGRAVE'
    end
    object qrypartgeralDATAFIMMOLESTIA: TDateTimeField
      FieldName = 'DATAFIMMOLESTIA'
    end
    object qrypartgeralSITIRRF: TStringField
      FieldName = 'SITIRRF'
      Size = 7
    end
    object qrypartgeralFLGBLOQUEIO: TFloatField
      FieldName = 'FLGBLOQUEIO'
    end
    object qrypartgeralNOMENACIONALIDADE: TStringField
      FieldName = 'NOMENACIONALIDADE'
      Size = 30
    end
    object qrypartgeralCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qrypartgeralCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qrypartgeralNUMDEPIRRF: TFloatField
      FieldName = 'NUMDEPIRRF'
    end
    object qrypartgeralNUMDEPSALF: TFloatField
      FieldName = 'NUMDEPSALF'
    end
    object qrypartgeralNUMDEPTOT: TFloatField
      FieldName = 'NUMDEPTOT'
    end
    object qrypartgeralTIPOSANG: TStringField
      FieldName = 'TIPOSANG'
      Size = 3
    end
    object qrypartgeralSITPLANOPREV: TStringField
      FieldName = 'SITPLANOPREV'
      Size = 50
    end
    object qrypartgeralCORPESSOA: TStringField
      FieldName = 'CORPESSOA'
      Size = 8
    end
    object qrypartgeralFLGDEFICIENTE: TStringField
      FieldName = 'FLGDEFICIENTE'
      Size = 3
    end
    object qrypartgeralINICIOINVALIDEZ: TDateTimeField
      FieldName = 'INICIOINVALIDEZ'
    end
    object qrypartgeralFIMINVALIDEZ: TDateTimeField
      FieldName = 'FIMINVALIDEZ'
    end
    object qrypartgeralGRAUINSTRUCAO: TStringField
      FieldName = 'GRAUINSTRUCAO'
      Size = 30
    end
    object qrypartgeralIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qrypartgeralSITUACAONAPATRO: TStringField
      FieldName = 'SITUACAONAPATRO'
      Size = 60
    end
    object qrypartgeralPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qrypartgeralIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qrypartgeralIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qrypartgeralPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object qrypartgeralSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qrypartgeralINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qrypartgeralINSCRICAODATA: TDateTimeField
      FieldName = 'INSCRICAODATA'
    end
    object qrypartgeralIDRGELEGBENEF: TFloatField
      FieldName = 'IDRGELEGBENEF'
    end
    object qrypartgeralDTNOMEACAO: TDateTimeField
      FieldName = 'DTNOMEACAO'
    end
    object qrypartgeralDTEXONERACAO: TDateTimeField
      FieldName = 'DTEXONERACAO'
    end
    object qrypartgeralDATACANCELAMENTO: TDateTimeField
      FieldName = 'DATACANCELAMENTO'
    end
    object qrypartgeralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object qrypartgeralFLGISENTOIRRF: TStringField
      FieldName = 'FLGISENTOIRRF'
      Size = 3
    end
    object qrypartgeralFLGSOMAIRSUPINSS: TStringField
      FieldName = 'FLGSOMAIRSUPINSS'
      Size = 3
    end
    object qrypartgeralEMAILFUNCEF: TStringField
      FieldName = 'EMAILFUNCEF'
      Size = 100
    end
    object qrypartgeralTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object qrypartgeralTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object qrypartgeralTRGDTALTERACAO: TDateTimeField
      FieldName = 'TRGDTALTERACAO'
    end
    object qrypartgeralDATACANCEL: TDateTimeField
      FieldName = 'DATACANCEL'
    end
    object qrypartgeralIDSITDEPENDENTE: TStringField
      FieldName = 'IDSITDEPENDENTE'
      FixedChar = True
      Size = 4
    end
    object qrypartgeralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 16
    end
    object qrypartgeralDATACANCELA: TDateTimeField
      FieldName = 'DATACANCELA'
    end
    object qrypartgeralTPDEFICIENCIA: TStringField
      FieldName = 'TPDEFICIENCIA'
      Size = 25
    end
    object qrypartgeralIDRESPONSAVEL: TStringField
      FieldName = 'IDRESPONSAVEL'
      Size = 60
    end
    object qrypartgeralCODTIPORESPONSAVEL: TStringField
      FieldName = 'CODTIPORESPONSAVEL'
      Size = 5
    end
  end
  object qrydepentit: TwwQuery
    CachedUpdates = True
    AfterScroll = qrydepentitAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME,'
      '       PL.NOME AS NOMEPLANO,'
      '       P.IDPESSOA,'
      '       P.NUMDOCUMENTO,'
      '       D.IDTITULAR,'
      '       DP.DESCRICAO AS DEPENDENCIA,'
      '       D.NUMSEQUENCIA,'
      '       D.FLGCONTAIMPOSTOR,'
      '       D.FLGCONTASALARIOF,'
      '       DECODE(BF.IDPESSOA, NULL, 0, 1 ) AS FLGBENEFICIARIO,'
      '       DECODE(PF.ESTCIVIL, '#39'S'#39', '#39'Solteiro'#39','
      '                           '#39'C'#39', '#39'Casado(a) ou Equiparado(a)'#39','
      '                           '#39'D'#39', '#39'Divorciado(a)'#39','
      '                           '#39'E'#39', '#39'Desquitado(a)'#39','
      '                           '#39'J'#39', '#39'Separado(a) Judicial'#39','
      '                           '#39'V'#39', '#39'Viúvo(a)'#39','
      '                           '#39'M'#39', '#39'Marital'#39','
      '                           '#39'P'#39', '#39'Separado(a)'#39','
      '                           '#39'O'#39', '#39'Outros'#39')  AS DESCESTCIVIL,'
      ''
      '       D.FLGDESIGNADO,'
      '       D.FLGDEPLEGAL,'
      '       D.IDDEPENDENCIA,'
      '       D.MATRICULA,'
      '       D.INICIOIMPOSTOR,'
      '       D.FIMIMPOSTOR,'
      '       D.INICIOSALARIOF,'
      '       D.FIMSALARIOF,'
      '       D.DATACANCELA,'
      '       PF.DATANASC,'
      
        '      TRUNC((SYSDATE -  PF.DATANASC)/365.25) AS IDADE, --SIG2186' +
        '8'
      '       PF.DATAMORTE,'
      '       PF.NOMEPAI,'
      '       PF.NOMEMAE,'
      '       PF.SEXO,'
      '       PF.FLGMOLESTIAGRAVE,'
      '       PF.DATAMOLESTIAGRAVE ,'
      '       PF.FLGISENTOIRRF,'
      '       SIT.DESCRICAO AS SITUACAODEPEN,'
      '       0 AS FLGELEGIVEL,'
      '       VALORBASE1,'
      '       VALORBASE2,'
      '       VALORBASE3,'
      '       PF.FLGBLOQUEIO,'
      '       PF.INICIOINVALIDEZ, PF.FIMINVALIDEZ,'
      '       PF.EMAILFUNCEF'
      '       --SIG1868 -INICIO      '
      '       ,TO_DATE(D.TRGDTINCLUSAO, '#39'DD/MM/RRRR'#39') AS DATAINCLUSAO'
      
        '       ,(SELECT NOMEUSUARIO FROM USUARIOSISTEMA US WHERE  US.IDU' +
        'SUARIO= regexp_substr(D.TRGUSERINCLUSAO, '#39'[[:digit:]]+'#39'))AS USUI' +
        'NCLUSAO'
      '       , LG.ULTALTERACAO'
      
        '       ,(SELECT PD.DATACANCEL FROM PLANODEPENDENTE PD WHERE D.ID' +
        'PESSOA = PD.IDPESSOA AND PL.IDPLANOPREV = PD.IDPLANOPREV AND ROW' +
        'NUM =1) DATACANCEL -- PD.DATACANCEL'
      
        '       ,DECODE(DEP.IDSITDEPENDENTE,120,'#39'INVÁLIDO(A)'#39',2,'#39'SENTENÇA' +
        ' JUDICIAL'#39','#39'NORMAL'#39') AS IDSITDEPENDENTE  '
      '       --SIG1868 -FIM'
      '      ,D.FLGIGNORAVALIR --SIG SIG42986'
      ''
      
        'FROM   PESSOA P, PESSOAFISICA PF, SITDEPENDENTE SIT, DEPEN DP, D' +
        'EPENDENTE DEP, DEPENTIT D, (SELECT DISTINCT IDTITULAR,IDPESSOA F' +
        'ROM BENEFBFCIARIO'
      
        'WHERE IDTITULAR     = :IDTITULAR AND IDSITBENEFICIO IN (1,2,4)) ' +
        'BF, PLANPREV PL,'
      
        '       (SELECT IDPESSOA, TO_DATE(MAX(TRGDTINCLUSAO), '#39'DD/MM/RRRR' +
        #39')  AS ULTALTERACAO'
      '          FROM LOGALTDEPENDENTES'
      '         GROUP BY IDPESSOA) LG'
      '--, PLANODEPENDENTE PD --SIG21868  '
      'WHERE  D.IDTITULAR     = :IDTITULAR'
      'AND    D.IDDEPENDENCIA <> '#39'PRP'#39
      'AND    D.IDPESSOA      = P.IDPESSOA'
      ' --SIG21868  -INICIO     '
      '--   AND D.IDPESSOA =PD.IDPESSOA '
      '--   AND PD.IDPLANOPREV = PL.IDPLANOPREV '
      '  --SIG21868  -FIM '
      'AND    D.IDDEPENDENCIA = DP.IDDEPENDENCIA'
      'AND    BF.IDTITULAR(+) = D.IDTITULAR'
      'AND    BF.IDPESSOA(+)  = D.IDPESSOA'
      'AND    LG.IDPESSOA(+)  = D.IDPESSOA    /*SIG42986*/'
      'AND    PF.IDPESSOA     = D.IDPESSOA'
      'AND    DEP.IDPESSOA    = D.IDPESSOA'
      '/*AND    PD.IDPESSOA      = DEP.IDPESSOA*/'
      'AND    D.IDPESSOA      = DEP.IDPESSOA'
      'AND    DEP.IDSITDEPENDENTE = SIT.IDSITDEPENDENTE(+)'
      'AND    PL.IDPLANOPREV = :IDPLANOPREV'
      '/*AND    PL.IDPLANOPREV = PD.IDPLANOPREV*/'
      'ORDER BY D.NUMSEQUENCIA'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpdDepenTit
    ControlType.Strings = (
      'FLGCONTAIMPOSTOR;CheckBox;1;0'
      'FLGCONTASALARIOF;CheckBox;1;0'
      'FLGDEPLEGAL;CheckBox;1;0'
      'FLGISENTOIRRF;CheckBox;1;0'
      'FLGMOLESTIAGRAVE;CheckBox;1;0'
      'FLGELEGIVEL;CheckBox;1;0'
      'FLGBENEFICIARIO;CheckBox;1;0'
      'FLGDESIGNADO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 366
    Top = 512
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end>
    object qrydepentitNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object qrydepentitIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
    end
    object qrydepentitNUMDOCUMENTO: TStringField
      DisplayWidth = 18
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qrydepentitIDTITULAR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTITULAR'
    end
    object qrydepentitDEPENDENCIA: TStringField
      DisplayWidth = 15
      FieldName = 'DEPENDENCIA'
      Size = 15
    end
    object qrydepentitNUMSEQUENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMSEQUENCIA'
    end
    object qrydepentitFLGCONTAIMPOSTOR: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGCONTAIMPOSTOR'
    end
    object qrydepentitFLGCONTASALARIOF: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGCONTASALARIOF'
    end
    object qrydepentitFLGBENEFICIARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGBENEFICIARIO'
    end
    object qrydepentitDESCESTCIVIL: TStringField
      DisplayWidth = 26
      FieldName = 'DESCESTCIVIL'
      Size = 26
    end
    object qrydepentitFLGDESIGNADO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGDESIGNADO'
    end
    object qrydepentitFLGDEPLEGAL: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGDEPLEGAL'
    end
    object qrydepentitIDDEPENDENCIA: TStringField
      DisplayWidth = 3
      FieldName = 'IDDEPENDENCIA'
      FixedChar = True
      Size = 3
    end
    object qrydepentitMATRICULA: TStringField
      DisplayWidth = 15
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qrydepentitINICIOIMPOSTOR: TDateTimeField
      DisplayWidth = 18
      FieldName = 'INICIOIMPOSTOR'
    end
    object qrydepentitFIMIMPOSTOR: TDateTimeField
      DisplayWidth = 18
      FieldName = 'FIMIMPOSTOR'
    end
    object qrydepentitINICIOSALARIOF: TDateTimeField
      DisplayWidth = 18
      FieldName = 'INICIOSALARIOF'
    end
    object qrydepentitFIMSALARIOF: TDateTimeField
      DisplayWidth = 18
      FieldName = 'FIMSALARIOF'
    end
    object qrydepentitDATANASC: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATANASC'
    end
    object qrydepentitDATAMORTE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAMORTE'
    end
    object qrydepentitNOMEPAI: TStringField
      DisplayWidth = 50
      FieldName = 'NOMEPAI'
      Size = 50
    end
    object qrydepentitNOMEMAE: TStringField
      DisplayWidth = 50
      FieldName = 'NOMEMAE'
      Size = 50
    end
    object qrydepentitSEXO: TStringField
      DisplayWidth = 1
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object qrydepentitFLGMOLESTIAGRAVE: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGMOLESTIAGRAVE'
    end
    object qrydepentitDATAMOLESTIAGRAVE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAMOLESTIAGRAVE'
    end
    object qrydepentitFLGISENTOIRRF: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGISENTOIRRF'
    end
    object qrydepentitSITUACAODEPEN: TStringField
      DisplayWidth = 50
      FieldName = 'SITUACAODEPEN'
      Size = 50
    end
    object qrydepentitFLGELEGIVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGELEGIVEL'
    end
    object qrydepentitVALORBASE1: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORBASE1'
    end
    object qrydepentitVALORBASE2: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORBASE2'
    end
    object qrydepentitVALORBASE3: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORBASE3'
    end
    object qrydepentitFLGBLOQUEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGBLOQUEIO'
    end
    object qrydepentitDATACANCELA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATACANCELA'
    end
    object qrydepentitINICIOINVALIDEZ: TDateTimeField
      DisplayWidth = 18
      FieldName = 'INICIOINVALIDEZ'
    end
    object qrydepentitFIMINVALIDEZ: TDateTimeField
      DisplayWidth = 18
      FieldName = 'FIMINVALIDEZ'
    end
    object qrydepentitNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      Size = 50
    end
    object qrydepentitEMAILFUNCEF: TStringField
      FieldName = 'EMAILFUNCEF'
      Size = 100
    end
    object qrydepentitIDADE: TFloatField
      FieldName = 'IDADE'
    end
    object qrydepentitDATAINCLUSAO: TDateTimeField
      FieldName = 'DATAINCLUSAO'
    end
    object qrydepentitDATACANCEL: TDateTimeField
      FieldName = 'DATACANCEL'
    end
    object qrydepentitIDSITDEPENDENTE: TStringField
      FieldName = 'IDSITDEPENDENTE'
      FixedChar = True
      Size = 4
    end
    object qrydepentitUSUINCLUSAO: TStringField
      FieldName = 'USUINCLUSAO'
      FixedChar = True
    end
    object qrydepentitULTALTERACAO: TDateTimeField
      FieldName = 'ULTALTERACAO'
    end
    object qrydepentitFLGIGNORAVALIR: TFloatField
      FieldName = 'FLGIGNORAVALIR'
    end
  end
  object dsdepentit: TwwDataSource
    DataSet = qrydepentit
    Left = 341
    Top = 446
  end
  object qrypart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        BE.IDPESSJUR,'
      '        BE.IDPLANOPREV,'
      '        PL.NOME PLANASS,'
      '        PV.NOME PLANPREV,'
      '        PD.NOME DEPEN'
      'FROM    BENEFASS BE,'
      '        PESSOA PD,'
      '        PLANASS  PL,'
      '        PLANPREV PV'
      'WHERE (BE.IDTITULAR = :IDTITULAR)'
      'AND   (BE.SEQPROPOSTA = :SEQPROPOSTA)'
      'AND   (BE.IDDEPENDENTE = PD.IDPESSOA)'
      'AND   (BE.IDPLANASS = PL.IDPLANASS)'
      'AND   (PV.IDPLANOPREV = BE.IDPLANOPREV)'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 455
    Top = 313
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
    object qrypartDEPEN: TStringField
      DisplayLabel = 'Nome do Beneficiário'
      DisplayWidth = 48
      FieldName = 'DEPEN'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
    object qrypartPLANASS: TStringField
      DisplayLabel = 'Plano Assistencial'
      DisplayWidth = 35
      FieldName = 'PLANASS'
      Origin = '"CM.PLANASS".NOME'
      Size = 40
    end
    object qrypartPLANPREV: TStringField
      DisplayLabel = 'Plano previdenciário'
      DisplayWidth = 25
      FieldName = 'PLANPREV'
      Origin = '"CM.PLANPREV".NOME'
      Size = 50
    end
    object qrypartIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.BENEFASS.IDPESSJUR'
    end
    object qrypartIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.BENEFASS.IDPLANOPREV'
    end
  end
  object qrybenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        M.DESCRICAO AS MOTIVO,'
      '        BE.NOME,'
      '        HBN.IDHSTFOLHABENEF,'
      '        HBN.NUMEROPROCESSO,'
      '        HBN.MES,'
      '        HBN.VLBENEFPGTO,'
      '        HBN.DTEFETPGTO,'
      '        HBN.VALORPREV,'
      '        HBN.DATAPAGAMENTO,'
      '        HBN.VALORBASE1,'
      '        HBN.VALORBASE2,'
      '        HBN.VALORBASE3,'
      '        HBN.VALORCALCULADO,'
      '        HBN.VALORINTEGRAL,'
      '        HBN.VALORTOTAL,'
      '        HBN.MESREFERENCIA,'
      '        HBN.VALOROP1,'
      '        HBN.VALOROP2,'
      '        HBN.VALOROP3,'
      '        HBN.VALORSRB,'
      '        NVL(HBN.FLGMANUAL, 0) AS FLGMANUAL,'
      ''
      '        -- WO18367'
      '        HBN.BSTITULAR,'
      '        HBN.FABTITULAR,'
      
        '        CM.FN_BF_BUSCA_PERC_PENSAO(bb.numeroprocesso, HBN.VALORB' +
        'S, HBN.BSTITULAR, HBN.PERCENTUAL, HBN.MESREFERENCIA) AS PERC_PEN' +
        'SAO,'
      '        -- WO18367'
      ''
      '        PATRO.NOME AS PATROCINADORA,'
      '        PL.NOME AS PLANO,'
      '        P.NOME AS BENEFICIARIO,'
      '        BB.PERCENTUAL,'
      
        '        DECODE(HBN.FLGENVIADO,8,'#39'Fora convênio'#39',9,'#39'Retido'#39',1,'#39'Pr' +
        'ocessado'#39','#39'A Processar'#39') AS FLGPAGAINSS,'
      '        BP.FLGAPRESENTABSFAB'
      'FROM'
      '        ELEGPATRO EL,'
      '        BENEFBFCIARIO BB,'
      '        HSTBENEFBFCIARIO HBN,'
      '        BENEFPLANPREV BP,'
      '        PESSOA P,'
      '        PESSOA TIT,'
      '        PESSOA PATRO,'
      '        PLANPREV PL,'
      '        DEPENTIT D,'
      '        MOTIVO M ,'
      '        BENEFICIO BE,'
      '        PARAMAPREV PR'
      ''
      'WHERE'
      '        (EL.IDPESSOA  = :IDTITULAR)'
      'AND     (EL.IDPESSJUR = :IDPESSJUR)'
      'AND     (BB.IDPESSJUR = :IDPESSJUR)'
      'AND     (BB.IDTITULAR = :IDTITULAR)'
      'AND     (BB.IDPLANOPREV = :IDPLANOPREV)'
      'AND     (BB.SEQPROPOSTA = :SEQPROPOSTA)'
      'AND     (HBN.IDPESSOA = :IDPESSOA)'
      'AND     (BB.NUMEROPROCESSO = HBN.NUMEROPROCESSO(+))'
      'AND     (BB.IDTITULAR   = HBN.IDTITULAR)'
      'AND     (BB.IDPESSJUR   = HBN.IDPESSJUR)'
      'AND     (BB.IDPLANOORIGEM = HBN.IDPLANOORIGEM)'
      'AND     (BB.IDPLANOPREV = HBN.IDPLANOPREV)'
      'AND     (BB.IDPESSOA    = HBN.IDPESSOA)'
      'AND     (BB.IDBENEFICIO = HBN.IDBENEFICIO)'
      'AND     (BB.SEQPROPOSTA = HBN.SEQPROPOSTA)'
      'AND     (HBN.IDMOTIVO = M.IDMOTIVO(+))'
      ''
      'AND     (BB.IDPLANOPREV = PL.IDPLANOPREV)'
      'AND     (BB.IDPESSOA    = D.IDPESSOA)'
      'AND     (BB.IDTITULAR   = D.IDTITULAR)'
      'AND     (BB.IDBENEFICIO = BP.IDBENEFICIO(+))'
      'AND     (BB.IDPLANOPREV = BP.IDPLANOPREV(+))'
      'AND     (BB.IDBENEFICIO = BE.IDBENEFICIO)'
      'AND     (P.IDPESSOA = BB.IDPESSOA)'
      'AND     (TIT.IDPESSOA = EL.IDPESSOA)'
      'AND     (PATRO.IDPESSOA = EL.IDPESSJUR)'
      
        'ORDER BY HBN.MESREFERENCIA DESC, HBN.MES DESC, BE.NOME ASC, P.NO' +
        'ME, M.DESCRICAO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGMANUAL;CheckBox;1;0')
    PictureMasks.Strings = (
      'VALORPREV'#9'###,###,###,##0.00'#9'T'#9'T'
      'VLBENEFPGTO'#9'###,###,###,##0.00'#9'T'#9'T'
      'VALORBASE1'#9'###,###,###,##0.00'#9'T'#9'T'
      'VALORBASE2'#9'###,###,###,##0.00'#9'T'#9'T'
      'VALORBASE3'#9'###,###,###,##0.00'#9'T'#9'T'
      'VALORCALCULADO'#9'###,###,###,##0.00'#9'T'#9'T'
      'BSTITULAR'#9'###,###,###,##0.00'#9'T'#9'T'
      'FABTITULAR'#9'###,###,###,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 134
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    object qrybenefMESREFERENCIA: TStringField
      DisplayLabel = 'Mês~Referência'
      DisplayWidth = 8
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qrybenefMES: TStringField
      DisplayLabel = 'Mês~Pagamento'
      DisplayWidth = 9
      FieldName = 'MES'
      FixedChar = True
      Size = 7
    end
    object qrybenefNOME: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 40
      FieldName = 'NOME'
      Size = 60
    end
    object qrybenefVALORPREV: TFloatField
      DisplayLabel = 'Valor Previsto'
      DisplayWidth = 11
      FieldName = 'VALORPREV'
      DisplayFormat = '#,##0.00'
    end
    object qrybenefVLBENEFPGTO: TFloatField
      DisplayLabel = 'Valor Pago'
      DisplayWidth = 10
      FieldName = 'VLBENEFPGTO'
      DisplayFormat = '#,##0.00'
    end
    object qrybenefMOTIVO: TStringField
      DisplayLabel = 'Motivo'
      DisplayWidth = 48
      FieldName = 'MOTIVO'
      Size = 50
    end
    object qrybenefNUMEROPROCESSO: TFloatField
      DisplayLabel = 'Num Processo.'
      DisplayWidth = 12
      FieldName = 'NUMEROPROCESSO'
    end
    object qrybenefBENEFICIARIO: TStringField
      DisplayLabel = 'Beneficiário'
      DisplayWidth = 60
      FieldName = 'BENEFICIARIO'
      Size = 60
    end
    object qrybenefDATAPAGAMENTO: TDateTimeField
      DisplayLabel = 'Data Pagto~Prevista'
      DisplayWidth = 10
      FieldName = 'DATAPAGAMENTO'
    end
    object qrybenefDTEFETPGTO: TDateTimeField
      DisplayLabel = 'Data Efetivação'
      DisplayWidth = 13
      FieldName = 'DTEFETPGTO'
    end
    object qrybenefVALORBASE1: TFloatField
      DisplayLabel = 'Vlr Base 1'
      DisplayWidth = 10
      FieldName = 'VALORBASE1'
    end
    object qrybenefVALORBASE2: TFloatField
      DisplayLabel = 'Vlr Base 2'
      DisplayWidth = 10
      FieldName = 'VALORBASE2'
    end
    object qrybenefVALORBASE3: TFloatField
      DisplayLabel = 'Vlr Base 3'
      DisplayWidth = 10
      FieldName = 'VALORBASE3'
    end
    object qrybenefVALORCALCULADO: TFloatField
      DisplayLabel = 'Vlr Calculado'
      DisplayWidth = 10
      FieldName = 'VALORCALCULADO'
      DisplayFormat = '#,##0.00'
    end
    object qrybenefVALOROP1: TFloatField
      DisplayLabel = 'Valor Opção 1'
      DisplayWidth = 11
      FieldName = 'VALOROP1'
    end
    object qrybenefVALOROP2: TFloatField
      DisplayLabel = 'Valor Opção 2'
      DisplayWidth = 11
      FieldName = 'VALOROP2'
    end
    object qrybenefVALOROP3: TFloatField
      DisplayLabel = 'Valor Opção 3'
      DisplayWidth = 11
      FieldName = 'VALOROP3'
    end
    object qrybenefVALORINTEGRAL: TFloatField
      DisplayLabel = 'Valor Integral'
      DisplayWidth = 10
      FieldName = 'VALORINTEGRAL'
      DisplayFormat = '#,##0.00'
    end
    object qrybenefVALORSRB: TFloatField
      DisplayLabel = 'Valor SRB'
      DisplayWidth = 10
      FieldName = 'VALORSRB'
      DisplayFormat = '#,##0.00'
    end
    object qrybenefVALORTOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 10
      FieldName = 'VALORTOTAL'
      DisplayFormat = '#,##0.00'
    end
    object qrybenefPATROCINADORA: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 60
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object qrybenefPLANO: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 50
      FieldName = 'PLANO'
      Size = 50
    end
    object qrybenefIDHSTFOLHABENEF: TFloatField
      DisplayLabel = 'Versão da Folha'
      DisplayWidth = 13
      FieldName = 'IDHSTFOLHABENEF'
    end
    object qrybenefFLGMANUAL: TFloatField
      DisplayLabel = 'Entrada Manual'
      DisplayWidth = 12
      FieldName = 'FLGMANUAL'
    end
    object qrybenefBSTITULAR: TFloatField
      DisplayLabel = 'Valor BS~Titular'
      DisplayWidth = 12
      FieldName = 'BSTITULAR'
      DisplayFormat = '#,##0.00'
    end
    object qrybenefFABTITULAR: TFloatField
      DisplayLabel = 'Valor FAB~Titular'
      DisplayWidth = 12
      FieldName = 'FABTITULAR'
      DisplayFormat = '#,##0.00'
    end
    object qrybenefPERC_PENSAO: TFloatField
      DisplayLabel = '% Aplicado~Pensão'
      DisplayWidth = 12
      FieldName = 'PERC_PENSAO'
    end
    object qrybenefPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'PERCENTUAL'
    end
    object qrybenefFLGPAGAINSS: TStringField
      DisplayLabel = 'Convênio~INSS'
      DisplayWidth = 20
      FieldName = 'FLGPAGAINSS'
      Size = 16
    end
    object qrybenefFLGAPRESENTABSFAB: TFloatField
      FieldName = 'FLGAPRESENTABSFAB'
    end
  end
  object dsbenef: TwwDataSource
    AutoEdit = False
    DataSet = qrybenef
    Left = 125
    Top = 153
  end
  object dspart: TwwDataSource
    AutoEdit = False
    DataSet = qrypart
    Left = 456
    Top = 313
  end
  object qryevent: TwwQuery
    Tag = 1
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '           EVENTASS.IDPESSJUR,'
      '           EVENTASS.IDPLANOPREV,'
      '           EVENTASS.DATAEVENT,'
      '           EVENTASS.VALOREVENT,'
      '           EVENTASS.VALORPAGO,'
      '           EVENTASS.DATAPAG,'
      '           EVENTASS.FLGREEMBOLSO,'
      '           P.NOME TIT,'
      '           PP.NOME DEP,'
      '           EL.MATRICULA,'
      '           P.NUMDOCUMENTO CPF ,'
      '           PV.NOME PREV ,'
      '           PL.NOME PLANASS,'
      '           TP.NOME SERV,'
      '           EL.DATAADMISSAO'
      'FROM'
      '           ELEGPATRO EL ,'
      '           EVENTASS,'
      '           PESSOA PA,'
      '           PESSOA P ,'
      '           PESSOA PP,'
      '           TPSERVASS TP,'
      '           PLANASS PL,'
      '           PLANPREV PV,'
      '           PARTASS PAT'
      'WHERE'
      '          (EL.IDPESSJUR = :IDPESSJUR)'
      'AND       (EL.IDPESSOA = :IDTITULAR)'
      'AND       (EVENTASS.IDTITULAR = EL.IDPESSOA)'
      'AND       (EVENTASS.IDPESSJUR = EL.IDPESSJUR)'
      'AND       (EVENTASS.IDPLANOPREV = :IDPLANOPREV)'
      'AND       (EVENTASS.SEQPROPOSTA = :SEQPROPOSTA)'
      'AND       (EVENTASS.IDDEPENDENTE = PP.IDPESSOA)'
      'AND       (EVENTASS.IDSERVASS = TP.IDSERVASS)'
      'AND       (EVENTASS.IDPLANASS = PL.IDPLANASS)'
      'AND       (PA.IDPESSOA = EL.IDPESSJUR)'
      'AND       (P.IDPESSOA = EL.IDPESSOA)'
      'AND       (PV.IDPLANOPREV = EVENTASS.IDPLANOPREV)'
      'AND       (PAT.IDPESSJUR = EL.IDPESSJUR)'
      'AND       (PAT.IDPESSOA = EL.IDPESSOA)'
      'AND       (PAT.IDPLANASS = PL.IDPLANASS)'
      'ORDER BY EVENTASS.DATAEVENT'
      ''
      ''
      ''
      ' ')
    ControlType.Strings = (
      'FLGREEMBOLSO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 182
    Top = 153
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
    object qryeventDATAEVENT: TDateTimeField
      DisplayLabel = 'Data do Evento'
      DisplayWidth = 10
      FieldName = 'DATAEVENT'
      Origin = '"CM.EVENTASS".DATAEVENT'
    end
    object qryeventVALOREVENT: TFloatField
      DisplayLabel = 'Valor do Evento'
      DisplayWidth = 10
      FieldName = 'VALOREVENT'
      Origin = '"CM.EVENTASS".VALOREVENT'
    end
    object qryeventSERV: TStringField
      DisplayLabel = 'Serviço'
      DisplayWidth = 25
      FieldName = 'SERV'
      Origin = '"CM.TPSERVASS".NOME'
      Size = 60
    end
    object qryeventPLANASS: TStringField
      DisplayLabel = 'Plano Assistencial'
      DisplayWidth = 25
      FieldName = 'PLANASS'
      Origin = '"CM.PLANASS".NOME'
      Size = 40
    end
    object qryeventPREV: TStringField
      DisplayLabel = 'Plano Previdenciário'
      DisplayWidth = 25
      FieldName = 'PREV'
      Origin = '"CM.PLANPREV".NOME'
      Size = 50
    end
    object qryeventTIT: TStringField
      DisplayLabel = 'Titular'
      DisplayWidth = 25
      FieldName = 'TIT'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
    object qryeventDEP: TStringField
      DisplayLabel = 'Dependente'
      DisplayWidth = 25
      FieldName = 'DEP'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
    object qryeventVALORPAGO: TFloatField
      DisplayLabel = 'Valor Pago'
      DisplayWidth = 10
      FieldName = 'VALORPAGO'
      Origin = '"CM.EVENTASS".VALORPAGO'
    end
    object qryeventDATAPAG: TDateTimeField
      DisplayLabel = 'Data do Pagamento'
      DisplayWidth = 10
      FieldName = 'DATAPAG'
      Origin = '"CM.EVENTASS".DATAPAG'
    end
    object qryeventFLGREEMBOLSO: TFloatField
      DisplayLabel = 'Reembolso ?'
      DisplayWidth = 10
      FieldName = 'FLGREEMBOLSO'
      Origin = '"CM.EVENTASS".FLGREEMBOLSO'
    end
    object qryeventMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 13
      FieldName = 'MATRICULA'
      Origin = '"CM.ELEGPATRO".MATRICULA'
      Size = 13
    end
    object qryeventCPF: TStringField
      DisplayWidth = 13
      FieldName = 'CPF'
      Origin = '"CM.PESSOA".NUMDOCUMENTO'
      Size = 18
    end
    object qryeventDATAADMISSAO: TDateTimeField
      DisplayLabel = 'Data de Admissão'
      DisplayWidth = 10
      FieldName = 'DATAADMISSAO'
      Origin = '"CM.ELEGPATRO".DATAADMISSAO'
    end
    object qryeventIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.EVENTASS.IDPESSJUR'
    end
    object qryeventIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.EVENTASS.IDPLANOPREV'
    end
  end
  object qryemp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '        SELECT 0 TEMAVALISTA,'
      '       0       NUMPARCELAS,'
      '       '#39#39'       DATAASSIN,'
      '       '#39#39'  DATAREFVALOR,'
      '       0      VALORCONTR,'
      '       '#39#39'   SITUACAOCONTR  ,'
      '       '#39#39'   MESAVERB ,'
      '       '#39#39'   DTPRIMPARC,'
      '       '#39#39'       CARENCIA,'
      '       0      VALORPARCINFOR,'
      '       0      VALORPARCCALC,'
      '       0      VALORFATORINFOR,'
      '       0      VALORFATORCALC,'
      '       '#39#39'      DIAVENC,'
      '       '#39#39'   AVA,'
      '              '#39#39' PLANPREV ,'
      '              '#39#39' PESSJUR ,'
      '              '#39#39' PESSOA ,'
      '              '#39#39' FINAN ,'
      '              '#39#39' DESCTIPOCONTRATO ,'
      '              '#39#39' DESCTIPOEMPTMO,'
      '              '#39#39' IDCONTRCREDMUT'
      'FROM DUAL'
      '')
    ControlType.Strings = (
      'TEMAVALISTA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 477
    Top = 105
    object qryempTEMAVALISTA: TFloatField
      FieldName = 'TEMAVALISTA'
    end
    object qryempNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryempDATAASSIN: TDateTimeField
      FieldName = 'DATAASSIN'
    end
    object qryempDATAREFVALOR: TDateTimeField
      FieldName = 'DATAREFVALOR'
    end
    object qryempVALORCONTR: TFloatField
      FieldName = 'VALORCONTR'
    end
    object qryempSITUACAOCONTR: TStringField
      FieldName = 'SITUACAOCONTR'
      Size = 12
    end
    object qryempMESAVERB: TStringField
      FieldName = 'MESAVERB'
      Size = 7
    end
    object qryempDTPRIMPARC: TDateTimeField
      FieldName = 'DTPRIMPARC'
    end
    object qryempCARENCIA: TFloatField
      FieldName = 'CARENCIA'
    end
    object qryempVALORPARCINFOR: TFloatField
      FieldName = 'VALORPARCINFOR'
    end
    object qryempVALORPARCCALC: TFloatField
      FieldName = 'VALORPARCCALC'
    end
    object qryempVALORFATORINFOR: TFloatField
      FieldName = 'VALORFATORINFOR'
    end
    object qryempVALORFATORCALC: TFloatField
      FieldName = 'VALORFATORCALC'
    end
    object qryempDIAVENC: TFloatField
      FieldName = 'DIAVENC'
    end
    object qryempAVA: TStringField
      FieldName = 'AVA'
      Size = 60
    end
    object qryempPLANPREV: TStringField
      FieldName = 'PLANPREV'
      Size = 50
    end
    object qryempPESSJUR: TStringField
      FieldName = 'PESSJUR'
      Size = 60
    end
    object qryempPESSOA: TStringField
      FieldName = 'PESSOA'
      Size = 60
    end
    object qryempFINAN: TStringField
      FieldName = 'FINAN'
      Size = 60
    end
    object qryempDESCTIPOCONTRATO: TStringField
      FieldName = 'DESCTIPOCONTRATO'
      Size = 60
    end
    object qryempDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryempIDCONTRCREDMUT: TFloatField
      FieldName = 'IDCONTRCREDMUT'
    end
  end
  object dsevent: TwwDataSource
    AutoEdit = False
    DataSet = qryevent
    Left = 180
    Top = 154
  end
  object dsemp: TwwDataSource
    AutoEdit = False
    DataSet = qryemp
    Left = 477
    Top = 109
  end
  object qryprocesso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       RI.IDPROCESSO,'
      '       RI.DATAINIPROCESSO,'
      '       RI.DATAFIMPROCESSO,'
      '       RI.DATAFIMPREV,'
      '       RT.NOME AS TIPOPROCESSO,'
      '       DECODE(RI.FLGOK,'
      '       '#39'S'#39','#39'Processo Encerrado Com Sucesso'#39',DECODE(RI.FLGOK,'
      
        '       '#39'N'#39','#39'Processo Em Andamento'#39','#39'Processp Encerrado Com Erro'#39 +
        ')) AS STATUS'
      'FROM'
      '       RADINSTPROCESSO RI,'
      '       RADTIPOPROCESSO RT'
      'WHERE (RI.IDPESSRESP = :IDTITULAR)'
      'AND   (RI.IDTIPOPROCESSO = RT.IDTIPOPROCESSO(+))'
      ' ')
    ValidateWithMask = True
    Left = 449
    Top = 207
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
    object qryprocessoIDPROCESSO: TFloatField
      DisplayLabel = 'Num. Processo'
      DisplayWidth = 10
      FieldName = 'IDPROCESSO'
    end
    object qryprocessoDATAINIPROCESSO: TDateTimeField
      DisplayLabel = 'Data Ini'
      DisplayWidth = 10
      FieldName = 'DATAINIPROCESSO'
    end
    object qryprocessoDATAFIMPROCESSO: TDateTimeField
      DisplayLabel = 'Data Fim'
      DisplayWidth = 10
      FieldName = 'DATAFIMPROCESSO'
    end
    object qryprocessoDATAFIMPREV: TDateTimeField
      DisplayLabel = 'Fim Prev.'
      DisplayWidth = 10
      FieldName = 'DATAFIMPREV'
    end
    object qryprocessoSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 20
      FieldName = 'STATUS'
      Size = 30
    end
    object qryprocessoTIPOPROCESSO: TStringField
      DisplayLabel = 'Tipo de Processo'
      DisplayWidth = 35
      FieldName = 'TIPOPROCESSO'
      Size = 60
    end
  end
  object qryreserva: TwwQuery
    AfterOpen = qryreservaAfterOpen
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT DISTINCT'
      '       DATAULTALIM,'
      '       VALORRESERVA,'
      '       CO.COTVALOR,'
      '       CO.COTVALOR*VALORRESERVA AS VLRATUAL,'
      '       TP.NOME,'
      '       NVL(TP.FLGCOLETIVA,0) AS FLGCOLETIVA,'
      '       NVL(TP.FLGCONTROLE,0) AS FLGCONTROLE,'
      '       TP.INDICEREAJUSTE,'
      '       ANALITICOSINTETI,'
      '       CODHIERARQUIA,'
      '       PV.NOME PREV,'
      '       PESS.NOME TIT,'
      '       MAXDATA.DATAMAX,'
      '       PESSJUR.NOME PATRO,'
      '       MOEDA.MOESIGLA,'
      '       TP.CODHIERARQUIA CODIGO,'
      '       DECODE(RS.FLGATIVO,1,'#39'ATIVO'#39','#39'INATIVO'#39') AS FLGATIVO,'
      '       TP.FLGTIPORESERVA,'
      '       TP.FLGTRANSFERENCIA,'
      '       TP.FLGTITULARCOLET,'
      '        TP.IDTIPORESERVA'
      'FROM  RESERVAPART RS,'
      '      PESSOA PESS,'
      '      PESSOA PESSJUR,'
      '      RESERVAXPLANO TP,'
      '      PLANPREV PV,'
      '      COTACAOMOEDA CO,'
      '      MOEDA,'
      '     DEPENTIT DP,'
      
        '      (SELECT TP1.INDICEREAJUSTE INDICERE,MAX(COTDATA) AS DATAMA' +
        'X'
      
        '       FROM RESERVAPART RP1, RESERVAXPLANO TP1,COTACAOMOEDA CO1,' +
        ' DEPENTIT DP1'
      
        '       WHERE (DP1.MATRICULA = :IDMATRICULA) AND (RP1.IDPESSJUR =' +
        ' :IDPESSJUR) AND   (RP1.IDPESSOA = :IDTITULAR)'
      
        '       AND   (RP1.IDPLANOPREV = :IDPLANOPREV) AND   (RP1.SEQPROP' +
        'OSTA = :SEQPROPOSTA) AND (RP1.IDPARTICIPANTE = DP1.IDTITULAR) AN' +
        'D RP1.IDPESSOA = DP1.IDPESSOA'
      
        '       AND   (TP1.IDPLANOPREV = RP1.IDPLANOPREV)  AND (TP1.IDTIP' +
        'ORESERVA = RP1.IDTIPORESERVA)'
      '       AND   (CO1.MOECODIGO = TP1.INDICEREAJUSTE)'
      '       GROUP BY TP1.INDICEREAJUSTE) MAXDATA'
      ''
      'WHERE (DP.Matricula = :IDMATRICULA)'
      'AND   (RS.IDPESSJUR = :IDPESSJUR)'
      'AND   (RS.IDPESSOA = :IDTITULAR)'
      'AND   (RS.IDPLANOPREV = :IDPLANOPREV)'
      'AND   (RS.SEQPROPOSTA = :SEQPROPOSTA)'
      'AND   (RS.IDPARTICIPANTE = DP.IDTITULAR)'
      'AND   (RS.IDPESSOA=DP.IDPESSOA)'
      'AND   (PESS.IDPESSOA = RS.IDPESSOA)'
      'AND   (PESSJUR.IDPESSOA = RS.IDPESSJUR)'
      'AND   (TP.IDPLANOPREV = RS.IDPLANOPREV)'
      'AND   (TP.IDTIPORESERVA = RS.IDTIPORESERVA)'
      'AND   (TP.INDICEREAJUSTE = MAXDATA.INDICERE(+))'
      'AND   (TP.ANALITICOSINTETI = '#39'A'#39')'
      'AND   (PV.IDPLANOPREV = RS.IDPLANOPREV)'
      'AND   (CO.MOECODIGO(+) = MAXDATA.INDICERE)'
      'AND   (CO.COTDATA(+) = MAXDATA.DATAMAX)'
      'AND   (MOEDA.MOECODIGO(+)  = TP.INDICEREAJUSTE)'
      'ORDER BY TP.CODHIERARQUIA'
      ''
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGCOLETIVA;CheckBox;1;0'
      'FLGCONTROLE;CheckBox;1;0')
    PictureMasks.Strings = (
      
        'VALORRESULT'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]' +
        '#[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[' +
        '#][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#' +
        '[#][#]]]}'#9'T'#9'T'
      'VALORRESERVA'#9'###,###,###,##0.00'#9'T'#9'T'
      'COTVALOR'#9'###,###,###,##0.00'#9'T'#9'T'
      'VLRATUAL'#9'###,###,###,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 229
    Top = 153
    ParamData = <
      item
        DataType = ftString
        Name = 'IDMATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = '1215012'
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = '14'
      end
      item
        DataType = ftFloat
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'IDMATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
    object qryreservaIDTIPORESERVA: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 6
      FieldName = 'IDTIPORESERVA'
    end
    object qryreservaNOME: TStringField
      DisplayLabel = 'Reserva '
      DisplayWidth = 47
      FieldName = 'NOME'
      Size = 50
    end
    object qryreservaDATAULTALIM: TDateTimeField
      DisplayLabel = 'Data~ Referência'
      DisplayWidth = 10
      FieldName = 'DATAULTALIM'
    end
    object qryreservaVALORRESERVA: TFloatField
      DisplayLabel = 'Reserva~ Em Cotas'
      DisplayWidth = 16
      FieldName = 'VALORRESERVA'
      DisplayFormat = '###,###,###.######'
    end
    object qryreservaCOTVALOR: TFloatField
      DisplayLabel = 'Valor ~da Cota'
      DisplayWidth = 11
      FieldName = 'COTVALOR'
    end
    object qryreservaVLRATUAL: TFloatField
      DisplayLabel = 'Valor na Moeda~Corrente'
      DisplayWidth = 16
      FieldName = 'VLRATUAL'
      DisplayFormat = '###,###,###.##'
    end
    object qryreservaFLGCONTROLE: TFloatField
      DisplayLabel = 'Reserva de ~ Controle'
      DisplayWidth = 10
      FieldName = 'FLGCONTROLE'
    end
    object qryreservaFLGATIVO: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 7
      FieldName = 'FLGATIVO'
      Size = 7
    end
    object qryreservaPREV: TStringField
      DisplayLabel = 'Plano Previdenciário'
      DisplayWidth = 30
      FieldName = 'PREV'
      Visible = False
      Size = 50
    end
    object qryreservaTIT: TStringField
      DisplayLabel = 'Titular'
      DisplayWidth = 25
      FieldName = 'TIT'
      Visible = False
      Size = 60
    end
    object qryreservaPATRO: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 25
      FieldName = 'PATRO'
      Visible = False
      Size = 60
    end
    object qryreservaDATAMAX: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAMAX'
      Visible = False
    end
    object qryreservaFLGCOLETIVA: TFloatField
      FieldName = 'FLGCOLETIVA'
      Visible = False
    end
    object qryreservaINDICEREAJUSTE: TFloatField
      FieldName = 'INDICEREAJUSTE'
      Visible = False
      DisplayFormat = '###,###.######'
    end
    object qryreservaANALITICOSINTETI: TStringField
      FieldName = 'ANALITICOSINTETI'
      Visible = False
      Size = 1
    end
    object qryreservaCODHIERARQUIA: TStringField
      FieldName = 'CODHIERARQUIA'
      Visible = False
      Size = 8
    end
    object qryreservaMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Visible = False
      Size = 10
    end
    object qryreservaCODIGO: TStringField
      FieldName = 'CODIGO'
      Visible = False
      Size = 8
    end
    object qryreservaFLGTIPORESERVA: TFloatField
      FieldName = 'FLGTIPORESERVA'
      Visible = False
    end
    object qryreservaFLGTRANSFERENCIA: TFloatField
      FieldName = 'FLGTRANSFERENCIA'
      Visible = False
    end
    object qryreservaFLGTITULARCOLET: TStringField
      FieldName = 'FLGTITULARCOLET'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object dsprocesso: TwwDataSource
    AutoEdit = False
    DataSet = qryprocesso
    Left = 452
    Top = 208
  end
  object dsreserva: TwwDataSource
    AutoEdit = False
    DataSet = qryreserva
    Left = 232
    Top = 153
  end
  object dsEventosPrev: TwwDataSource
    AutoEdit = False
    DataSet = qryEventosPrev
    Left = 543
    Top = 265
  end
  object qryEventosPrev: TwwQuery
    AfterScroll = qryEventosPrevAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '         EP.IDPLANOPREV,'
      '         EP.IDPESSJUR,  '
      '         EP.IDEVENTOSPREV,'
      '         EG.NOME,'
      '         EP.DATAEVENTO,'
      '         EP.DATAREGISTRO,'
      '         EP.DATAEFETIVADO,'
      '         EP.DATAVOLTA,'
      '         EP.INSCRICAONUMERO,'
      '         SF1.DESCRICAO AS SITFUNCATUAL,'
      '         SPL1.DESCRICAO AS SITPLANOATUAL,'
      '         SP1.DESCRICAO AS SITPARTATUAL,'
      '         SF2.DESCRICAO AS SITFUNCNOVO,'
      '         SPL2.DESCRICAO AS SITPLANONOVO,'
      '         SP2.DESCRICAO AS SITPARTNOVO,'
      '         PF.NOME AS PATRO,'
      '         PL.NOME AS PLANO'
      ''
      'FROM     PESSOA PF,'
      '         EVENTOSPREV EP,'
      '         EVENTOGERADOR EG,'
      '         SITPART SP1,'
      '         SITPART SP2,'
      '         SITFUNC SF1,'
      '         SITFUNC SF2,'
      '         SITPLANOPREV SPL1,'
      '         SITPLANOPREV SPL2,'
      '         PLANPREV PL'
      'WHERE    (EP.IDPESSJUR = :IDPESSJUR)'
      'AND      (EP.IDPESSOA = :IDTITULAR)'
      'AND      (EP.IDPESSJUR = PF.IDPESSOA)'
      'AND      (EP.IDEVENTOGERADOR = EG.IDEVENTOGERADOR)'
      'AND      (EP.IDSITPARTATUAL  = SP1.IDSITPART(+))'
      'AND      (EP.IDSITPARTNOVO   = SP2.IDSITPART(+))'
      'AND      (EP.IDSITFUNCATUAL  = SF1.IDSITFUNC(+))'
      'AND      (EP.IDSITFUNCNOVO   = SF2.IDSITFUNC(+))'
      'AND      (EP.IDSITPLANOATUAL = SPL1.IDSITPLANOPREV)'
      'AND      (EP.IDSITPLANONOVO  = SPL2.IDSITPLANOPREV)'
      'AND      (EP.IDPLANOPREV = PL.IDPLANOPREV)'
      'ORDER BY EP.DATAEVENTO DESC, EG.NOME'
      ''
      ' ')
    ValidateWithMask = True
    Left = 571
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptInput
      end>
    object qryEventosPrevNOME: TStringField
      DisplayLabel = 'Evento Gerador'
      DisplayWidth = 40
      FieldName = 'NOME'
      Origin = 'BASEDADOS.EVENTOGERADOR.NOME'
      Size = 60
    end
    object qryEventosPrevMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 10
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryEventosPrevDATAEVENTO: TDateTimeField
      DisplayLabel = 'Evento'
      DisplayWidth = 11
      FieldName = 'DATAEVENTO'
      Origin = 'BASEDADOS.EVENTOSPREV.DATAEVENTO'
    end
    object qryEventosPrevINSCRICAONUMERO: TFloatField
      DisplayLabel = 'Número~Inscrição'
      DisplayWidth = 11
      FieldName = 'INSCRICAONUMERO'
      Origin = 'BASEDADOS.EVENTOSPREV.INSCRICAONUMERO'
    end
    object qryEventosPrevDATAREGISTRO: TDateTimeField
      DisplayLabel = 'Registro'
      DisplayWidth = 11
      FieldName = 'DATAREGISTRO'
      Origin = 'BASEDADOS.EVENTOSPREV.DATAREGISTRO'
    end
    object qryEventosPrevDATAEFETIVADO: TDateTimeField
      DisplayLabel = 'Efetivação'
      DisplayWidth = 10
      FieldName = 'DATAEFETIVADO'
      Origin = 'BASEDADOS.EVENTOSPREV.DATAEFETIVADO'
    end
    object qryEventosPrevDATAVOLTA: TDateTimeField
      DisplayLabel = 'Data de~Retorno'
      DisplayWidth = 13
      FieldName = 'DATAVOLTA'
      Origin = 'BASEDADOS.EVENTOSPREV.DATAVOLTA'
    end
    object qryEventosPrevSITPARTNOVO: TStringField
      DisplayLabel = 'Nova Situação~na Fundação'
      DisplayWidth = 30
      FieldName = 'SITPARTNOVO'
      Origin = 'BASEDADOS.SITPART.DESCRICAO'
      Size = 50
    end
    object qryEventosPrevSITFUNCNOVO: TStringField
      DisplayLabel = 'Nova Situação~na Patrocinadora'
      DisplayWidth = 30
      FieldName = 'SITFUNCNOVO'
      Origin = 'BASEDADOS.SITFUNC.DESCRICAO'
      Size = 60
    end
    object qryEventosPrevSITPLANONOVO: TStringField
      DisplayLabel = 'Nova Situação~no Plano'
      DisplayWidth = 30
      FieldName = 'SITPLANONOVO'
      Origin = 'BASEDADOS.SITPLANOPREV.DESCRICAO'
      Size = 50
    end
    object qryEventosPrevSITPARTATUAL: TStringField
      DisplayLabel = 'Situação Fundação ~Antes do Evento'
      DisplayWidth = 30
      FieldName = 'SITPARTATUAL'
      Origin = 'BASEDADOS.SITPART.DESCRICAO'
      Size = 50
    end
    object qryEventosPrevSITFUNCATUAL: TStringField
      DisplayLabel = 'Situação Patrocinadora ~Antes do Evento'
      DisplayWidth = 30
      FieldName = 'SITFUNCATUAL'
      Origin = 'BASEDADOS.SITFUNC.DESCRICAO'
      Size = 60
    end
    object qryEventosPrevSITPLANOATUAL: TStringField
      DisplayLabel = 'Situação Plano ~Antes do Evento'
      DisplayWidth = 30
      FieldName = 'SITPLANOATUAL'
      Origin = 'BASEDADOS.SITPLANOPREV.DESCRICAO'
      Size = 50
    end
    object qryEventosPrevPLANO: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 40
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.PLANPREV.NOME'
      Size = 50
    end
    object qryEventosPrevPATRO: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 40
      FieldName = 'PATRO'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryEventosPrevIDEVENTOSPREV: TFloatField
      FieldName = 'IDEVENTOSPREV'
      Origin = 'BASEDADOS.EVENTOSPREV.IDEVENTOSPREV'
      Visible = False
    end
    object qryEventosPrevIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryEventosPrevIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
  end
  object dsHstContF: TwwDataSource
    AutoEdit = False
    DataSet = qryHstContF
    Left = 19
    Top = 265
  end
  object qryHstContF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   HST.FLGASSOCIADA,'
      '         C.NOME AS CONTRIBUICAOF'
      'FROM     HSTCONTEVENTOSPR HST,'
      '         CONTRIBUICAO C'
      'WHERE    (HST.IDEVENTOSPREV =:IdEventosPrev)'
      'AND      (HST.IDCONTRIBUICAOF = C.IDCONTRIBUICAO)'
      'ORDER BY HST.FLGASSOCIADA,'
      '         HST.IDCONTRIBUICAOF'
      ''
      '')
    ValidateWithMask = True
    Left = 18
    Top = 267
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IdEventosPrev'
        ParamType = ptUnknown
      end>
    object qryHstContFFLGASSOCIADA: TFloatField
      FieldName = 'FLGASSOCIADA'
      Origin = '"CM.HSTCONTEVENTOSPR".FLGASSOCIADA'
    end
    object qryHstContFCONTRIBUICAOF: TStringField
      FieldName = 'CONTRIBUICAOF'
      Origin = '"CM.CONTRIBUICAO".NOME'
      Size = 60
    end
  end
  object qryRubs: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   R.IDRUBS,'
      '   DECODE(R.FLGSTATUS,'#39'1'#39','#39'Gerado'#39', '
      '   DECODE(R.FLGSTATUS,'#39'2'#39','#39'Emitido'#39', '
      '   DECODE(R.FLGSTATUS,'#39'3'#39','#39'Regerado'#39', '
      '   DECODE(R.FLGSTATUS,'#39'4'#39','#39'Reemitido'#39', '
      '   DECODE(R.FLGSTATUS,'#39'5'#39','#39'Cancelado'#39','
      '   DECODE(R.FLGSTATUS,'#39'6'#39','#39'Carta Enviada'#39','
      '   '#39'Recebido'#39')))))) AS STATUS,'
      ''
      '   R.FLGSTATUS,'
      '   R.FLGSTATUS AS FLGOLDSTATUS,'
      '   R.IDCANCELAMENTO,'
      '   R.IDHISTBAIXA,'
      '   R.IDHISTLANCTO,'
      '   HL.DATAMOV'
      'FROM'
      '   RUBXBENEFICIO RB, RUBS R, HISTMOVRUBS HL,'
      '   TPCANCELAMENTO TP'
      'WHERE'
      ''
      '   (RB.IDPESSOA = :IDTITULAR)  AND'
      '   (R.IDRUBS = RB.IDRUBS) AND'
      '   (R.IDRUBS = HL.IDRUBS(+)) AND'
      '   (R.IDCANCELAMENTO = TP.IDCANCELAMENTO(+))'
      ''
      'UNION'
      ''
      'SELECT DISTINCT'
      '   R.IDRUBS,'
      ''
      '   DECODE(R.FLGSTATUS,'#39'1'#39','#39'Gerado'#39','
      '   DECODE(R.FLGSTATUS,'#39'2'#39','#39'Emitido'#39','
      '   DECODE(R.FLGSTATUS,'#39'3'#39','#39'Regerado'#39','
      '   DECODE(R.FLGSTATUS,'#39'4'#39','#39'Reemitido'#39','
      '   DECODE(R.FLGSTATUS,'#39'5'#39','#39'Cancelado'#39','
      '   DECODE(R.FLGSTATUS,'#39'6'#39','#39'Carta Enviada'#39','
      '   '#39'Recebido'#39')))))) AS STATUS,'
      ''
      '   R.FLGSTATUS,'
      '   R.FLGSTATUS AS FLGOLDSTATUS,'
      '   R.IDCANCELAMENTO,'
      '   R.IDHISTBAIXA,'
      '   R.IDHISTLANCTO,'
      '   HL.DATAMOV'
      'FROM'
      '   RUBXBENEFICIO RB, RUBS R, HISTMOVRUBS HL,'
      '   TPCANCELAMENTO TP'
      'WHERE'
      '   (rb.idpessjur is null) AND'
      '   (rb.idplanoprev is null) AND'
      '   (RB.IDPESSOA = :IDTITULAR)        AND'
      '   (R.IDRUBS = RB.IDRUBS) AND'
      '   (R.IDRUBS = HL.IDRUBS(+)) AND'
      '   (R.IDCANCELAMENTO = TP.IDCANCELAMENTO(+))'
      ''
      'ORDER BY IDRUBS'
      '')
    ValidateWithMask = True
    Left = 545
    Top = 156
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
    object qryRubsIDRUBS: TFloatField
      DisplayLabel = 'Num Rubs'
      DisplayWidth = 10
      FieldName = 'IDRUBS'
    end
    object qryRubsSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 13
      FieldName = 'STATUS'
      Size = 13
    end
    object qryRubsDATAMOV: TDateTimeField
      DisplayLabel = 'Data de Movimentação'
      DisplayWidth = 19
      FieldName = 'DATAMOV'
    end
    object qryRubsFLGSTATUS: TStringField
      DisplayWidth = 1
      FieldName = 'FLGSTATUS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryRubsFLGOLDSTATUS: TStringField
      DisplayWidth = 1
      FieldName = 'FLGOLDSTATUS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryRubsIDCANCELAMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCANCELAMENTO'
      Visible = False
    end
    object qryRubsIDHISTBAIXA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHISTBAIXA'
      Visible = False
    end
    object qryRubsIDHISTLANCTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHISTLANCTO'
      Visible = False
    end
  end
  object DsRubs: TwwDataSource
    AutoEdit = False
    DataSet = qryRubs
    Left = 544
    Top = 158
  end
  object qryTipoDocXRub: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsRubs
    SQL.Strings = (
      'SELECT DISTINCT'
      '    TD.IDDOCUMENTO,'
      '    TD.NOMEDOCUMENTO,'
      '    TP.FLGRECEBIDO,'
      '    TP.DATARECEB,'
      '    TP.IDTIPODOCXRUB,'
      '     TP.OBS'
      'FROM'
      '    TIPODOCXRUB TP, DOCUMENTOS TD, RUBXBENEFICIO RX'
      'WHERE'
      '    TP.IDDOCUMENTO = TD.IDDOCUMENTO AND'
      '    TP.IDRUBXBENEFICIO =  RX.IDRUBXBENEFICIO AND'
      '    RX.IDRUBS = :IDRUBS'
      'ORDER BY'
      '    TD.NOMEDOCUMENTO'
      '')
    ControlType.Strings = (
      'FLGRECEBIDO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 336
    Top = 370
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end>
    object qryTipoDocXRubFLGRECEBIDO: TStringField
      DisplayLabel = 'Recebido'
      DisplayWidth = 2
      FieldName = 'FLGRECEBIDO'
      Size = 1
    end
    object qryTipoDocXRubDATARECEB: TDateTimeField
      DisplayLabel = 'Data Recebimento'
      DisplayWidth = 13
      FieldName = 'DATARECEB'
    end
    object qryTipoDocXRubNOMEDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 100
      FieldName = 'NOMEDOCUMENTO'
      Size = 100
    end
    object qryTipoDocXRubIDDOCUMENTO: TFloatField
      DisplayLabel = 'Documento'
      DisplayWidth = 10
      FieldName = 'IDDOCUMENTO'
      Visible = False
    end
    object qryTipoDocXRubIDTIPODOCXRUB: TFloatField
      FieldName = 'IDTIPODOCXRUB'
      Visible = False
    end
    object qryTipoDocXRubOBS: TStringField
      FieldName = 'OBS'
      Origin = 'BASEDADOS.TIPODOCXRUB.OBS'
      Size = 60
    end
  end
  object dsTipoDocXRub: TwwDataSource
    AutoEdit = False
    DataSet = qryTipoDocXRub
    Left = 338
    Top = 369
  end
  object qryHistRubs: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsRubs
    SQL.Strings = (
      'SELECT'
      '   IDRUBS, HISTORICO, TRGDTINCLUSAO, IDHISTMOVRUBS,'
      '   DECODE(FLGSTATUS,'#39'1'#39','#39'Gerada'#39','
      '   DECODE(FLGSTATUS,'#39'2'#39','#39'Emitida'#39','
      '   DECODE(FLGSTATUS,'#39'3'#39','#39'Regerada'#39','
      '   DECODE(FLGSTATUS,'#39'4'#39','#39'Reemitida'#39','
      '   DECODE(FLGSTATUS,'#39'5'#39','#39'Cancelada'#39','
      '   DECODE(FLGSTATUS,'#39'6'#39','#39'Emissão de Carta'#39','
      '   '#39'Encerrada'#39')))))) AS STATUS'
      'FROM'
      '  HISTMOVRUBS'
      'WHERE'
      '  IDRUBS = :IDRUBS'
      'ORDER BY IDHISTMOVRUBS'
      ' ')
    ValidateWithMask = True
    Left = 148
    Top = 206
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end>
    object qryHistRubsHISTORICO: TMemoField
      DisplayLabel = 'Histórico'
      DisplayWidth = 35
      FieldName = 'HISTORICO'
      Origin = '"CM.HISTMOVRUBS".HISTORICO'
      BlobType = ftMemo
      Size = 1000
    end
    object qryHistRubsSTATUS: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'STATUS'
      Size = 16
    end
    object qryHistRubsTRGDTINCLUSAO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'TRGDTINCLUSAO'
      Origin = '"CM.HISTMOVRUBS".TRGDTINCLUSAO'
    end
    object qryHistRubsIDRUBS: TFloatField
      DisplayLabel = 'Num RUBS'
      DisplayWidth = 8
      FieldName = 'IDRUBS'
      Origin = '"CM.HISTMOVRUBS".IDRUBS'
      Visible = False
    end
    object qryHistRubsIDHISTMOVRUBS: TFloatField
      FieldName = 'IDHISTMOVRUBS'
      Visible = False
    end
  end
  object DsHistRubs: TwwDataSource
    AutoEdit = False
    DataSet = qryHistRubs
    Left = 149
    Top = 485
  end
  object qryRUBpendentes: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   R.IDRUBS,'
      '   DECODE(R.FLGSTATUS,'#39'1'#39','#39'Gerado'#39','
      '   DECODE(R.FLGSTATUS,'#39'2'#39','#39'Emitido'#39','
      '   DECODE(R.FLGSTATUS,'#39'3'#39','#39'Regerado'#39','
      '   DECODE(R.FLGSTATUS,'#39'4'#39','#39'Reemitido'#39','
      '   '#39'Carta Enviada'#39')))) AS STATUS,'
      '   R.FLGSTATUS,'
      '   R.FLGSTATUS AS FLGOLDSTATUS,'
      '   R.IDCANCELAMENTO,'
      '   R.IDHISTBAIXA,'
      '   R.IDHISTLANCTO,'
      '   HL.DATAMOV'
      'FROM'
      '   RUBXBENEFICIO RB,'
      '   RUBS R,'
      '   HISTMOVRUBS HL'
      'WHERE'
      '   (R.FLGSTATUS NOT IN ('#39'1'#39','#39'7'#39','#39'5'#39') OR R.FLGSTATUS IS NULL) AND'
      '   (R.IDRUBS = RB.IDRUBS) AND'
      '   RB.IDPESSJUR = :IDPESSJUR AND'
      '   RB.IDPESSOA = :IDTITULAR AND'
      '   RB.IDPLANOPREV = :IDPLANOPREV AND'
      '   (R.IDHISTLANCTO = HL.IDHISTMOVRUBS(+))'
      ''
      'UNION'
      ''
      'SELECT DISTINCT'
      '   R.IDRUBS,'
      '   DECODE(R.FLGSTATUS,'#39'1'#39','#39'Gerado'#39','
      '   DECODE(R.FLGSTATUS,'#39'2'#39','#39'Emitido'#39','
      '   DECODE(R.FLGSTATUS,'#39'3'#39','#39'Regerado'#39','
      '   DECODE(R.FLGSTATUS,'#39'4'#39','#39'Reemitido'#39','
      '   '#39'Carta Enviada'#39')))) AS STATUS,'
      '   R.FLGSTATUS,'
      '   R.FLGSTATUS AS FLGOLDSTATUS,'
      '   R.IDCANCELAMENTO,'
      '   R.IDHISTBAIXA,'
      '   R.IDHISTLANCTO,'
      '   HL.DATAMOV'
      'FROM'
      '   RUBXBENEFICIO RB,'
      '   RUBS R,'
      '   HISTMOVRUBS HL'
      'WHERE'
      '   (R.FLGSTATUS NOT IN ('#39'1'#39','#39'7'#39','#39'5'#39') OR R.FLGSTATUS IS NULL) AND'
      '   (R.IDRUBS = RB.IDRUBS) AND'
      '   RB.IDPESSJUR IS NULL AND'
      '   RB.IDPESSOA = :IDTITULAR AND'
      '   RB.IDPLANOPREV IS NULL AND'
      '   (R.IDRUBS = HL.IDRUBS(+))'
      ''
      '')
    ValidateWithMask = True
    Left = 375
    Top = 263
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
    object qryRUBpendentesIDRUBS: TFloatField
      DisplayLabel = 'Num RUBS'
      DisplayWidth = 9
      FieldName = 'IDRUBS'
    end
    object qryRUBpendentesSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 12
      FieldName = 'STATUS'
      Size = 13
    end
    object qryRUBpendentesDATAMOV: TDateTimeField
      DisplayLabel = 'Data Geração'
      DisplayWidth = 13
      FieldName = 'DATAMOV'
    end
    object qryRUBpendentesFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Visible = False
      Size = 1
    end
    object qryRUBpendentesFLGOLDSTATUS: TStringField
      FieldName = 'FLGOLDSTATUS'
      Visible = False
      Size = 1
    end
    object qryRUBpendentesIDCANCELAMENTO: TFloatField
      FieldName = 'IDCANCELAMENTO'
      Visible = False
    end
    object qryRUBpendentesIDHISTBAIXA: TFloatField
      FieldName = 'IDHISTBAIXA'
      Visible = False
    end
    object qryRUBpendentesIDHISTLANCTO: TFloatField
      FieldName = 'IDHISTLANCTO'
      Visible = False
    end
  end
  object dsRUBpendentes: TwwDataSource
    AutoEdit = False
    DataSet = qryRUBpendentes
    Left = 376
    Top = 263
  end
  object qryTipoDocRubPendentes: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    DataSource = dsRUBpendentes
    SQL.Strings = (
      'SELECT DISTINCT'
      '   TD.NOMEDOCUMENTO,'
      '   TD.IDDOCUMENTO,'
      '   TP.FLGRECEBIDO,'
      '   TP.DATARECEB,'
      '   TP.IDTIPODOCXRUB,'
      '   R.IDRUBS'
      'FROM'
      '   TIPODOCXRUB TP,'
      '   DOCUMENTOS TD,'
      '   RUBS R,'
      '   RUBXBENEFICIO RX'
      'WHERE'
      '   (TP.IDDOCUMENTO = TD.IDDOCUMENTO) AND'
      '   (R.FLGSTATUS NOT IN ('#39'7'#39','#39'5'#39') OR R.FLGSTATUS IS NULL) AND'
      '   (R.IDRUBS = :IDRUBS) AND'
      '   (R.IDRUBS = RX.IDRUBS) AND'
      '   (RX.IDRUBXBENEFICIO = TP.IDRUBXBENEFICIO)'
      'ORDER BY'
      '   TP.FLGRECEBIDO, TD.NOMEDOCUMENTO'
      '')
    ControlType.Strings = (
      'FLGRECEBIDO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 304
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end>
    object qryTipoDocRubPendentesFLGRECEBIDO: TStringField
      DisplayLabel = 'Ok'
      DisplayWidth = 2
      FieldName = 'FLGRECEBIDO'
      Size = 1
    end
    object qryTipoDocRubPendentesDATARECEB: TDateTimeField
      DisplayLabel = 'Data Recebimento'
      DisplayWidth = 13
      FieldName = 'DATARECEB'
    end
    object qryTipoDocRubPendentesNOMEDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 100
      FieldName = 'NOMEDOCUMENTO'
      Origin = 'TIPODOCPESSOA.NOMEDOCUMENTO'
      Size = 100
    end
    object qryTipoDocRubPendentesIDDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDDOCUMENTO'
      Origin = 'TIPODOCPESSOA.IDDOCUMENTO'
      Visible = False
    end
    object qryTipoDocRubPendentesIDTIPODOCXRUB: TFloatField
      FieldName = 'IDTIPODOCXRUB'
      Visible = False
    end
    object qryTipoDocRubPendentesIDRUBS: TFloatField
      FieldName = 'IDRUBS'
      Visible = False
    end
  end
  object dsTipoDocRubPendentes: TwwDataSource
    AutoEdit = False
    DataSet = qryTipoDocRubPendentes
    Left = 304
    Top = 59
  end
  object qryContribuicoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '       CO.NOME, DECODE(CP.FLGCOBRA, 1,'#39'COBRA'#39','#39'NÃO COBRA'#39'),'
      '        C.NOMEVALORBASE1, CP.VALORBASE1,'
      '        C.NOMEVALORBASE2, CP.VALORBASE2,'
      '        C.NOMEVALORBASE3, CP.VALORBASE3'
      'FROM'
      '  CONTRIBPREVPARTP CP,'
      '  CONTPREV C,'
      '  CONTRIBUICAO CO'
      'WHERE'
      '    CP.IDPESSJUR   = :IDPESSJUR'
      'AND CP.IDPLANOPREV = :IDPLANOPREV'
      'AND CP.IDPESSOA    = :IDTITULAR'
      'AND CP.SEQPROPOSTA = :SEQPROPOSTA'
      'AND CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO'
      'AND CP.IDPLANOPREV    = C.IDPLANOPREV'
      'AND CO.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      '')
    PictureMasks.Strings = (
      
        'VALORRESULT'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]' +
        '#[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[' +
        '#][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#' +
        '[#][#]]]}'#9'T'#9'T'
      
        'VALORRESERVA'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#' +
        '[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#' +
        ']]]}'#9'T'#9'T'
      'VALORBASE1'#9'###,###,###,##0.00'#9'T'#9'T'
      'VALORBASE2'#9'###,###,###,##0.00'#9'T'#9'T'
      'VALORBASE3'#9'###,###,###,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 191
    Top = 313
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
    object qryContribuicoesNOME: TStringField
      DisplayLabel = 'Contribuição'
      DisplayWidth = 30
      FieldName = 'NOME'
      Size = 60
    end
    object qryContribuicoesDECODECPFLGCOBRA1COBRAN: TStringField
      DisplayLabel = 'Cobra'
      DisplayWidth = 12
      FieldName = 'DECODE(CP.FLGCOBRA,1,'#39'COBRA'#39','#39'N'
      Size = 9
    end
    object qryContribuicoesNOMEVALORBASE1: TStringField
      DisplayLabel = 'Opção1'
      DisplayWidth = 20
      FieldName = 'NOMEVALORBASE1'
      Size = 60
    end
    object qryContribuicoesVALORBASE1: TFloatField
      DisplayLabel = 'ValorOp1'
      DisplayWidth = 10
      FieldName = 'VALORBASE1'
      DisplayFormat = '####0.########'
    end
    object qryContribuicoesNOMEVALORBASE2: TStringField
      DisplayLabel = 'Opção2'
      DisplayWidth = 20
      FieldName = 'NOMEVALORBASE2'
      Size = 60
    end
    object qryContribuicoesVALORBASE2: TFloatField
      DisplayLabel = 'ValorOp2'
      DisplayWidth = 10
      FieldName = 'VALORBASE2'
      DisplayFormat = '####0.########'
    end
    object qryContribuicoesNOMEVALORBASE3: TStringField
      DisplayLabel = 'Opção3'
      DisplayWidth = 20
      FieldName = 'NOMEVALORBASE3'
      Size = 60
    end
    object qryContribuicoesVALORBASE3: TFloatField
      DisplayLabel = 'ValorOp3'
      DisplayWidth = 10
      FieldName = 'VALORBASE3'
      DisplayFormat = '####0.########'
    end
  end
  object DsContribuicoes: TwwDataSource
    AutoEdit = False
    DataSet = qryContribuicoes
    Left = 193
    Top = 316
  end
  object qryHistReserva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  H.IDTIPORESERVA,'
      '  MAXDATA.DATAMAX,'
      '  CO.COTVALOR,'
      
        '  H.MESREFERENCIA,   H.VLRCOTAS, H.VLRREAL, H.SALDOCOTAS, H.SALD' +
        'OREAL,'
      
        '  DECODE(H.FLGENTRADA,1,'#39'E'#39','#39'S'#39') AS FLGENTRADA,H.DATAALIMENTACAO' +
        ', H.DATAMOV,'
      
        '  H.IDCONTRIBUICAO, H.IDBENEFICIO, C.NOME AS NOMECONTRIB, B.NOME' +
        ' AS NOMEBENEF,'
      
        '  H.VALORINDICE,  H.OBSERVACAO,   TP.NOME,    tp.FLGCOLETIVA , t' +
        'p.FLGCONTROLE, tp.FLGTITULARCOLET,'
      '  TP.INDICEREAJUSTE,     ANALITICOSINTETI,'
      '  M.MOESIGLA,   TP.CODHIERARQUIA AS CODIGO,'
      '  P.NOME AS PATRO'
      
        'FROM  HISTMOVRESERVA H,      RESERVAXPLANO TP,      MOEDA M,    ' +
        ' CONTRIBUICAO C,'
      '      BENEFICIO B, COTACAOMOEDA CO, PESSOA P,'
      
        '      (SELECT TP1.INDICEREAJUSTE INDICERE,MAX(COTDATA) AS DATAMA' +
        'X'
      '       FROM RESERVAPART RP1, RESERVAXPLANO TP1,COTACAOMOEDA CO1'
      
        '       WHERE (:IDPESSJUR IS NULL OR RP1.IDPESSJUR = :IDPESSJUR) ' +
        'AND (RP1.IDPESSOA = :IDTITULAR)'
      
        '       AND   (RP1.IDPLANOPREV = :IDPLANOPREV) AND   (RP1.SEQPROP' +
        'OSTA = :SEQPROPOSTA)'
      
        '       AND   (TP1.IDPLANOPREV = RP1.IDPLANOPREV)  AND (TP1.IDTIP' +
        'ORESERVA = RP1.IDTIPORESERVA)'
      '       AND   (CO1.MOECODIGO = TP1.INDICEREAJUSTE)'
      '       GROUP BY TP1.INDICEREAJUSTE) MAXDATA'
      ''
      ''
      'WHERE (H.IDPESSOA = :IDTITULAR)'
      'AND   (:IDPESSJUR IS NULL OR H.IDPESSJUR = :IDPESSJUR)'
      'AND   (H.IDPLANOPREV = :IDPLANOPREV)'
      'AND   (H.SEQPROPOSTA = :SEQPROPOSTA)'
      'AND   (P.IDPESSOA = H.IDPESSJUR)'
      'AND   (TP.IDPLANOPREV = H.IDPLANOPREV)'
      'AND   (TP.IDTIPORESERVA = H.IDTIPORESERVA)'
      'AND   (TP.ANALITICOSINTETI = '#39'A'#39')'
      'AND   (M.MOECODIGO(+)  = TP.INDICEREAJUSTE)'
      'AND  (H.IDCONTRIBUICAO = C.IDCONTRIBUICAO(+))'
      'AND  (H.IDBENEFICIO = B.IDBENEFICIO(+))'
      ''
      'AND   (TP.INDICEREAJUSTE = MAXDATA.INDICERE(+))'
      'AND   (CO.MOECODIGO(+) = MAXDATA.INDICERE)'
      'AND   (CO.COTDATA(+) = MAXDATA.DATAMAX)'
      ''
      'ORDER BY  H.MESREFERENCIA DESC, CODIGO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGCOLETIVA;CheckBox;1;0')
    PictureMasks.Strings = (
      
        'VALORRESULT'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]' +
        '#[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[' +
        '#][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#' +
        '[#][#]]]}'#9'T'#9'T'
      
        'VALORRESERVA'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#' +
        '[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#' +
        ']]]}'#9'T'#9'T'
      'SALDOCOTAS'#9'###,###,###,##0.00'#9'T'#9'T'
      'VALORINDICE'#9'###,###,###,##0.00'#9'T'#9'T'
      'SALDOREAL'#9'###,###,###,##0.00'#9'T'#9'T'
      'VLRCOTAS'#9'###,###,###,##0.00'#9'T'#9'T'
      'VLRREAL'#9'###,###,###,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 500
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '2'
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = '10240'
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = '33'
      end
      item
        DataType = ftFloat
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
    object qryHistReservaCODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 8
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 8
    end
    object qryHistReservaMESREFERENCIA: TStringField
      DisplayLabel = 'Referência'
      DisplayWidth = 8
      FieldName = 'MESREFERENCIA'
      Size = 7
    end
    object qryHistReservaFLGENTRADA: TStringField
      DisplayLabel = 'E/S'
      DisplayWidth = 3
      FieldName = 'FLGENTRADA'
      Size = 1
    end
    object qryHistReservaSALDOCOTAS: TFloatField
      DisplayLabel = 'Saldo Cotas'
      DisplayWidth = 18
      FieldName = 'SALDOCOTAS'
      DisplayFormat = '###,###,###.######'
    end
    object qryHistReservaVALORINDICE: TFloatField
      DisplayLabel = 'Valor Índice'
      DisplayWidth = 12
      FieldName = 'VALORINDICE'
      DisplayFormat = '###,###.######'
    end
    object qryHistReservaSALDOREAL: TFloatField
      DisplayLabel = 'Saldo Real'
      DisplayWidth = 13
      FieldName = 'SALDOREAL'
      DisplayFormat = '###,###,###.##'
    end
    object qryHistReservaVLRCOTAS: TFloatField
      DisplayLabel = 'Valor Cotas'
      DisplayWidth = 18
      FieldName = 'VLRCOTAS'
      DisplayFormat = '###,###,###.######'
    end
    object qryHistReservaVLRREAL: TFloatField
      DisplayLabel = 'Valor Real'
      DisplayWidth = 14
      FieldName = 'VLRREAL'
      DisplayFormat = '###,###,###.##'
    end
    object qryHistReservaNOME: TStringField
      DisplayLabel = 'Nome da Reserva '
      DisplayWidth = 43
      FieldName = 'NOME'
      FixedChar = True
      Size = 50
    end
    object qryHistReservaDATAALIMENTACAO: TDateTimeField
      DisplayLabel = 'Alimentação'
      DisplayWidth = 10
      FieldName = 'DATAALIMENTACAO'
    end
    object qryHistReservaDATAMOV: TDateTimeField
      DisplayLabel = 'Movimento'
      DisplayWidth = 10
      FieldName = 'DATAMOV'
    end
    object qryHistReservaMOESIGLA: TStringField
      DisplayLabel = 'Índice'
      DisplayWidth = 11
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryHistReservaNOMEBENEF: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 34
      FieldName = 'NOMEBENEF'
      Size = 60
    end
    object qryHistReservaNOMECONTRIB: TStringField
      DisplayLabel = 'Contribuição'
      DisplayWidth = 40
      FieldName = 'NOMECONTRIB'
      Size = 60
    end
    object qryHistReservaIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
      Visible = False
    end
    object qryHistReservaIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Visible = False
    end
    object qryHistReservaFLGCOLETIVA: TFloatField
      FieldName = 'FLGCOLETIVA'
      Visible = False
    end
    object qryHistReservaINDICEREAJUSTE: TFloatField
      FieldName = 'INDICEREAJUSTE'
      Visible = False
    end
    object qryHistReservaANALITICOSINTETI: TStringField
      FieldName = 'ANALITICOSINTETI'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryHistReservaFLGCONTROLE: TFloatField
      FieldName = 'FLGCONTROLE'
    end
    object qryHistReservaFLGTITULARCOLET: TStringField
      FieldName = 'FLGTITULARCOLET'
      FixedChar = True
      Size = 1
    end
    object qryHistReservaIDTIPORESERVA: TFloatField
      FieldName = 'IDTIPORESERVA'
    end
    object qryHistReservaDATAMAX: TDateTimeField
      FieldName = 'DATAMAX'
    end
    object qryHistReservaCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
    end
    object qryHistReservaPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryHistReservaOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 500
    end
  end
  object dsHistReserva: TwwDataSource
    AutoEdit = False
    DataSet = CdsHistReserva
    Left = 511
    Top = 59
  end
  object qryRecebedor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT H.IDRESPONSAVEL, P.NOME'
      'FROM HISTRUBSAL H, PESSOA P'
      'WHERE  H.IDHSTFOLHABENEF = :IDHSTFOLHABENEF AND'
      '               H.IDTITULAR       = :IDTITULAR AND'
      '               H.IDRESPONSAVEL = P.IDPESSOA'
      '')
    PictureMasks.Strings = (
      
        'VALORRESULT'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]' +
        '#[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[' +
        '#][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#' +
        '[#][#]]]}'#9'T'#9'T'
      
        'VALORRESERVA'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#' +
        '[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#' +
        ']]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 312
    Top = 263
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
        Value = 1615
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = 1215012
      end>
    object qryRecebedorIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = 'BASEDADOS.HISTRUBSAL.IDRESPONSAVEL'
    end
    object qryRecebedorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
  object dsRecebedor: TwwDataSource
    AutoEdit = False
    DataSet = qryRecebedor
    Left = 310
    Top = 263
  end
  object qryFiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT F.DESCRICAO, F.DATAINCLUSAO, F.IDRUBS, U.NOMEUSUARIO, F.I' +
        'DGRUPO,'
      '       FA.DESCRICAO AS DESCGRUPO'
      'FROM FIARIO F, USUARIOSISTEMA U, FIARIOASSUNTO FA'
      'WHERE IDTITULAR = :IDTITULAR'
      'AND   F.IDUSUARIO = U.IDUSUARIO'
      'AND   F.IDGRUPO = FA.IDFIARASS(+)'
      'ORDER BY F.DATAINCLUSAO DESC'
      ' ')
    PictureMasks.Strings = (
      
        'VALORRESULT'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]' +
        '#[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[' +
        '#][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#' +
        '[#][#]]]}'#9'T'#9'T'
      
        'VALORRESERVA'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#' +
        '[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#' +
        ']]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 144
    Top = 57
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = 1222524
      end>
    object qryFiarioDATAINCLUSAO: TDateTimeField
      FieldName = 'DATAINCLUSAO'
      Origin = 'BASEDADOS.FIARIO.DATAINCLUSAO'
    end
    object qryFiarioIDRUBS: TFloatField
      FieldName = 'IDRUBS'
      Origin = 'BASEDADOS.FIARIO.IDRUBS'
    end
    object qryFiarioNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      Origin = 'BASEDADOS.USUARIOSISTEMA.NOMEUSUARIO'
      FixedChar = True
    end
    object qryFiarioIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryFiarioDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 100
    end
    object qryFiarioDESCRICAO2: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
  end
  object dsFiario: TwwDataSource
    AutoEdit = False
    DataSet = qryFiario
    Left = 187
    Top = 55
  end
  object dsMovBenef: TwwDataSource
    AutoEdit = False
    DataSet = qryMovBenef
    Left = 343
    Top = 313
  end
  object qryMovBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TMP2.TIPOMOV,'
      '       --TMP2.MOVDESFEITO,'
      
        '       --DECODE(TMP2.TIPOMOV,10,'#39'DESFAZER '#39'||TMP2.MOVDESFEITO,TM' +
        'P2.DSCMOV) AS DESCMOV,'
      '       TMP2.DSCMOV AS DESCMOV,'
      '       TMP2.IDDESFAZER,'
      '       --TMP2.PROXIMOTPMPV,'
      '       TMP2.DESFEITO as DESFEZCONCESSAO,'
      '       TMP2.DATAMOV,'
      
        '       (select mre.ds_motivo                                    ' +
        '                               '
      '        from motivore mre'
      
        '        where mre.id_motivo = TMP2.motretenc)  AS MOTIVO_RETENCA' +
        'O,'
      '        TMP2.IDBENEFICIO,'
      '        TMP2.DATAINICIO, '
      '        TMP2.DATAFINAL, '
      '        TMP2.DATAINICIOANT, '
      '        TMP2.DATAFINALANT,'
      '        TMP2.VALORATUAL,'
      '        P.NOME, '
      '        TMP2.NUMEROPROCESSO,'
      '        DECODE(TMP2.FLGEMPRESTIMO , 0, '#39'QUITADO'#39','
      '                                    1, '#39'NÃO QUITADO'#39','
      
        '                                    2, '#39'NÃO PARAMETRIZADO'#39', '#39#39') ' +
        'AS DESCEMPRESTIMO,'
      '        TMP2.VALORTOTAL,'
      '        TMP2.VALORTOTALANT,'
      '        TMP2.VALORATUALANT,'
      '        TMP2.VALORSRB,               '
      '        TMP2.VALORSRBANT,'
      '        '
      '        (SELECT S.DESCRICAO'
      '                   FROM SITBENEFICIO S'
      
        '                  WHERE TMP2.IDSITANTERIOR = S.IDSITBENEFICIO) A' +
        'S IDSITANTERIOR,'
      '                '
      '      --Inicio - Helio - SOL Nº 270869 PPM Nº 1340102'
      '    --Início - William Santana - SIG 30590'
      '     -- NVL((SELECT U.NOMEUSUARIO'
      '      --     FROM USUARIOSISTEMA U'
      
        '      --    WHERE U.IDUSUARIO = SUBSTR(TMP2.TRGUSERINCLUSAO, 3, ' +
        '10)),SUBSTR(TMP2.TRGUSERINCLUSAO, 3, 10)) AS TRGUSERINCLUSAO,'
      '      --Fim - Helio - SOL Nº 270869 PPM Nº 1340102'
      '     CASE'
      '         WHEN SUBSTR(TMP2.TRGUSERINCLUSAO, 1, 2) = '#39'CM'#39' THEN'
      '           --Início - Paulo Nobre - WO23998'
      '           NVL((SELECT CASE'
      
        '                     WHEN SUBSTR(U.NOMEUSUARIO,1,1) = '#39'F'#39' THEN P' +
        '.NOME'
      '                     ELSE TRIM(U.NOMEUSUARIO)'
      '                   END'
      '                FROM USUARIOSISTEMA U, PESSOA P'
      
        '                WHERE U.IDUSUARIO = SUBSTR(TMP2.TRGUSERINCLUSAO,' +
        ' 3, 10)'
      '                      AND U.IDUSUARIO = P.IDPESSOA),'
      '           --Fim - Paulo Nobre - WO23998'
      '             SUBSTR(TMP2.TRGUSERINCLUSAO, 3, 10))'
      '         ELSE'
      '          TMP2.TRGUSERINCLUSAO'
      '       END AS TRGUSERINCLUSAO,'
      '       --Término - William Santana - SIG 30590'
      '          '
      '        BF.VLRBSATUAL AS VLRBSATUALANT,'
      '        BF.VLRBSTOTAL AS VLRBSTOTALANT,'
      '        BF.VLRBSATUAL AS VLRBSATUALNOVO,'
      '        BF.VLRBSTOTAL AS VLRBSTOTALNOVO,'
      '        BF.VLRFABATUAL AS VLRFABATUALANT,'
      '        BF.VLRFABTOTAL AS VLRFABTOTALANT,'
      '        BF.VLRFABATUAL AS VLRFABATUALNOVO,'
      '        BF.VLRFABTOTAL AS VLRFABTOTALNOVO,'
      '        '
      '        BPP.FLGAPRESENTABSFAB, '
      '        BPP.FLGAPRESENTADEFICIT'
      '        '
      '       FROM ('
      'SELECT TMP.TIPOMOV,'
      
        '       (SELECT T.DSCMOV FROM TIPOMOVBENEF T WHERE T.IDTIPOMOV = ' +
        'TMP.PROXIMOTPMPV ) AS MOVDESFEITO,'
      '       TMP.DSCMOV,'
      '       TMP.IDDESFAZER,'
      '       TMP.PROXIMOTPMPV,'
      '       TMP.DESFEITO,'
      '       TMP.DATAMOV,'
      '       TMP.motretenc,'
      '       TMP.IDBENEFICIO,'
      '       TMP.DATAINICIO, '
      '       TMP.DATAFINAL, '
      '       TMP.DATAINICIOANT, '
      '       TMP.DATAFINALANT,'
      '       TMP.VALORATUAL,'
      '       TMP.NUMEROPROCESSO,'
      '       TMP.FLGEMPRESTIMO,'
      '       TMP.VALORTOTAL,'
      '       TMP.VALORTOTALANT,'
      '       TMP.VALORATUALANT,'
      '       TMP.VALORSRB,               '
      '       TMP.VALORSRBANT,'
      '       TMP.IDSITANTERIOR,'
      '       TMP.TRGUSERINCLUSAO,'
      '       TMP.IDPESSOA,'
      '       TMP.IDPLANOPREV,'
      '       TMP.SEQPROPOSTA,'
      '       TMP.IDPLANOORIGEM,'
      '       TMP.IDTITULAR,'
      '       TMP.IDPESSJUR'
      'FROM ('
      ''
      'SELECT M.TIPOMOV,'
      '       '
      '       CASE WHEN M.TIPOMOV <> 10 THEN TM.DSCMOV ELSE'
      
        '            '#39'DESFAZER '#39'||(SELECT DSCMOV FROM TIPOMOVBENEF INNER ' +
        'JOIN MOVBENEF ON TIPOMOVBENEF.IDTIPOMOV = MOVBENEF.TIPOMOV WHERE' +
        ' MOVBENEF.IDDESFAZER = M.IDMOVBENEF) END'
      '       AS DSCMOV,'
      '       '
      '       M.IDDESFAZER,'
      
        '       LEAD(M.TIPOMOV) OVER(ORDER BY M.IDMOVBENEF DESC) AS PROXI' +
        'MOTPMPV,'
      '       DECODE(M.IDDESFAZER, NULL, '#39'Não'#39', '#39'Sim'#39') AS DESFEITO,'
      '       M.DATAMOV,'
      '       M.motretenc,'
      '       M.IDBENEFICIO,'
      '       M.DATAINICIO, '
      '       M.DATAFINAL,'
      '       M.DATAINICIOANT, '
      '       M.DATAFINALANT,'
      '       M.VALORATUAL,'
      '       M.IDPESSOA,'
      '       M.NUMEROPROCESSO,'
      '       M.FLGEMPRESTIMO,'
      '       M.VALORTOTAL,'
      '       M.VALORTOTALANT,'
      '       M.VALORATUALANT,'
      '       M.VALORSRB,               '
      '       M.VALORSRBANT,'
      '       M.IDSITANTERIOR,'
      '       M.TRGUSERINCLUSAO,'
      '       M.IDPLANOPREV,'
      '       M.SEQPROPOSTA,'
      '       M.IDPLANOORIGEM,'
      '       M.IDTITULAR,'
      '       M.IDPESSJUR'
      '/*,'
      '       M.**/'
      '  FROM MOVBENEF M'
      ' INNER JOIN TIPOMOVBENEF TM'
      '    ON (TM.IDTIPOMOV = M.TIPOMOV)'
      ''
      ' WHERE M.IDPESSOA = :IDPESSOA'
      '   AND M.IDTITULAR =  :IDTITULAR'
      
        '      --AND M.TIPOMOV       <> 10 --Helio - SOL Nº 253577/18154 ' +
        'PPM Nº 1320388'
      '   AND M.NUMEROPROCESSO = :NUMEROPROCESSO'
      ' ORDER BY M.IDMOVBENEF DESC) TMP ) TMP2,'
      ' PESSOA P, BENEFBFCIARIO BF, BENEFPLANPREV BPP'
      ' WHERE'
      '     TMP2.IDPESSOA = P.IDPESSOA'
      '     AND TMP2.IDPLANOPREV    = BF.IDPLANOPREV   '
      '     AND TMP2.IDBENEFICIO    = BF.IDBENEFICIO   '
      '     AND TMP2.NUMEROPROCESSO = BF.NUMEROPROCESSO'
      '     AND TMP2.IDPESSJUR      = BF.IDPESSJUR     '
      '     AND TMP2.IDTITULAR      = BF.IDTITULAR     '
      '     AND TMP2.IDPLANOORIGEM  = BF.IDPLANOORIGEM '
      '     AND TMP2.IDPESSOA       = BF.IDPESSOA      '
      '     AND TMP2.SEQPROPOSTA    = BF.SEQPROPOSTA'
      '     AND TMP2.IDBENEFICIO    = BPP.IDBENEFICIO'
      '     AND TMP2.IDPLANOPREV    = BPP.IDPLANOPREV '
      '     AND TMP2.IDPESSOA = :IDPESSOA'
      '     AND TMP2.IDTITULAR = :IDTITULAR'
      '     AND TMP2.NUMEROPROCESSO = :NUMEROPROCESSO'
      ' '
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      
        'VALORRESULT'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]' +
        '#[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[' +
        '#][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#' +
        '[#][#]]]}'#9'T'#9'T'
      
        'VALORRESERVA'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#' +
        '[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#' +
        ']]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 343
    Top = 310
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
    object qryMovBenefNOME: TStringField
      DisplayLabel = 'Beneficiário'
      DisplayWidth = 30
      FieldName = 'NOME'
      Size = 60
    end
    object qryMovBenefDESCMOV: TStringField
      DisplayLabel = 'Movimento'
      DisplayWidth = 17
      FieldName = 'DESCMOV'
      Size = 23
    end
    object qryMovBenefDESFEZCONCESSAO: TStringField
      DisplayLabel = 'Desfeito'
      DisplayWidth = 3
      FieldName = 'DESFEZCONCESSAO'
      Size = 3
    end
    object qryMovBenefDATAFINAL: TDateTimeField
      DisplayLabel = 'Final'
      DisplayWidth = 10
      FieldName = 'DATAFINAL'
    end
    object qryMovBenefDATAFINALANT: TDateTimeField
      DisplayLabel = 'Final~Anterior'
      DisplayWidth = 12
      FieldName = 'DATAFINALANT'
    end
    object qryMovBenefDATAMOV: TDateTimeField
      DisplayLabel = 'Data~Movimentação'
      DisplayWidth = 12
      FieldName = 'DATAMOV'
    end
    object qryMovBenefMOTIVO_RETENCAO: TStringField
      DisplayLabel = 'Motivo Retenção'
      DisplayWidth = 30
      FieldName = 'MOTIVO_RETENCAO'
      Size = 29
    end
    object qryMovBenefDESCEMPRESTIMO: TStringField
      DisplayLabel = 'Posição do Emprestimo'
      DisplayWidth = 20
      FieldName = 'DESCEMPRESTIMO'
      Size = 17
    end
    object qryMovBenefVALORTOTAL: TFloatField
      DisplayLabel = 'Valor Total do Benefício'
      DisplayWidth = 15
      FieldName = 'VALORTOTAL'
    end
    object qryMovBenefVALORTOTALANT: TFloatField
      DisplayLabel = 'Valor Total Anterior do Benefício'
      DisplayWidth = 15
      FieldName = 'VALORTOTALANT'
    end
    object qryMovBenefVALORATUAL: TFloatField
      DisplayLabel = 'Valor Atual do Benefício'
      DisplayWidth = 15
      FieldName = 'VALORATUAL'
    end
    object qryMovBenefVALORATUALANT: TFloatField
      DisplayLabel = 'Valor Atual Anterior do Benefício'
      DisplayWidth = 15
      FieldName = 'VALORATUALANT'
    end
    object qryMovBenefVALORSRB: TFloatField
      DisplayLabel = 'Valor SRB'
      DisplayWidth = 15
      FieldName = 'VALORSRB'
    end
    object qryMovBenefVALORSRBANT: TFloatField
      DisplayLabel = 'Valor SRB Anterior'
      DisplayWidth = 15
      FieldName = 'VALORSRBANT'
    end
    object qryMovBenefDATAINICIO: TDateTimeField
      DisplayLabel = 'Data Início'
      DisplayWidth = 12
      FieldName = 'DATAINICIO'
    end
    object qryMovBenefDATAINICIOANT: TDateTimeField
      DisplayLabel = 'Data Início Anterior'
      DisplayWidth = 12
      FieldName = 'DATAINICIOANT'
    end
    object qryMovBenefIDSITANTERIOR: TStringField
      DisplayLabel = 'Situação do Benefício Anterior'
      DisplayWidth = 20
      FieldName = 'IDSITANTERIOR'
      Size = 40
    end
    object qryMovBenefTRGUSERINCLUSAO: TStringField
      DisplayLabel = 'Triguer do Usuário de Inclusão'
      DisplayWidth = 20
      FieldName = 'TRGUSERINCLUSAO'
      FixedChar = True
    end
    object qryMovBenefVLRBSATUALANT: TFloatField
      DisplayLabel = 'Vlr BS Atual Ant'
      DisplayWidth = 10
      FieldName = 'VLRBSATUALANT'
    end
    object qryMovBenefVLRBSTOTALANT: TFloatField
      DisplayLabel = 'Vlr BS Total Ant'
      DisplayWidth = 10
      FieldName = 'VLRBSTOTALANT'
    end
    object qryMovBenefVLRBSATUALNOVO: TFloatField
      DisplayLabel = 'Vlr BS Atual Novo'
      DisplayWidth = 10
      FieldName = 'VLRBSATUALNOVO'
    end
    object qryMovBenefVLRBSTOTALNOVO: TFloatField
      DisplayLabel = 'Vlr BS Total Novo'
      DisplayWidth = 10
      FieldName = 'VLRBSTOTALNOVO'
    end
    object qryMovBenefVLRFABATUALANT: TFloatField
      DisplayLabel = 'Vlr FAB Atual Ant'
      DisplayWidth = 10
      FieldName = 'VLRFABATUALANT'
    end
    object qryMovBenefVLRFABTOTALANT: TFloatField
      DisplayLabel = 'Vlr FAB Total Ant'
      DisplayWidth = 10
      FieldName = 'VLRFABTOTALANT'
    end
    object qryMovBenefVLRFABATUALNOVO: TFloatField
      DisplayLabel = 'Vlr FAB Atual Novo'
      DisplayWidth = 10
      FieldName = 'VLRFABATUALNOVO'
    end
    object qryMovBenefVLRFABTOTALNOVO: TFloatField
      DisplayLabel = 'Vlr FAB Total Novo'
      DisplayWidth = 10
      FieldName = 'VLRFABTOTALNOVO'
    end
    object qryMovBenefIDBENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEFICIO'
      Visible = False
    end
    object qryMovBenefNUMEROPROCESSO: TFloatField
      FieldName = 'NUMEROPROCESSO'
      Visible = False
    end
    object qryMovBenefFLGAPRESENTABSFAB: TFloatField
      FieldName = 'FLGAPRESENTABSFAB'
      Visible = False
    end
    object qryMovBenefFLGAPRESENTADEFICIT: TFloatField
      FieldName = 'FLGAPRESENTADEFICIT'
      Visible = False
    end
    object qryMovBenefIDDESFAZER: TFloatField
      FieldName = 'IDDESFAZER'
      Visible = False
    end
  end
  object qryRubIndiv: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select /*+RULE*/'
      '       r.idrubrica,'
      '       decode(p.flgdesconto,0,'#39'P'#39','#39'D'#39') as provdesc,'
      '       p.descricao,'
      
        '       DECODE(PRM.FLGUSACODRUBEXT,0,P.IDPROVENTO,P.CODPROVDESC) ' +
        'AS CODIGORUBRICA,'
      
        '       DECODE(PRM.FLGUSACODRUBEXT,0,P.DESCRICAO,P.DESCRPROVDESC)' +
        ' AS DESCRUBRICA,'
      '       r.valorrubrica,'
      '       r.idregracalculo,'
      '       rg.nomeregra,'
      '       pfav.nome as nomefav,'
      '       palim.nome as nomealim,'
      '       r.rubricaproventopa,'
      
        '       DECODE(PRM.FLGUSACODRUBEXT,0,rubpa.descricao,rubpa.descrp' +
        'rovdesc) as descpa,'
      
        '       DECODE(PRM.FLGUSACODRUBEXT,0,rubpa.idprovento,rubpa.codpr' +
        'ovdesc) as rubricapa,'
      '       decode(rubpa.flgdesconto,0,'#39'P'#39','#39'D'#39') as provdescpa,'
      '       r.numocorrencias,'
      '       decode(flgpermanente,1,'#39'Sim'#39','#39'Não'#39') as tipopermanente,'
      '       r.flgpercent,'
      '       r.datainicio,'
      '       r.datafinal,'
      '       r.anomesref,'
      '       r.flgbasepa,'
      '       r.flgusaabono,'
      '       r.flgpermanente,'
      '       r.seqrubricaindiv,'
      '       r.flgdesativado,'
      '       r.flgusado,'
      '       pben.nome as nomebenef,'
      '       r.parcelas,'
      '       pfav.numdocumento as docfav,'
      '       palim.numdocumento as docalim,'
      '       e.logradouro,'
      '       e.numero,'
      '       e.bairro,'
      '       e.cep,'
      '       cd.nome,'
      '       uf.nomeestado,'
      '       t.ddd,'
      '       t.numero as numerotel,'
      '       t.tipo,'
      '       c.contacorrente,'
      '       c.idagencia,'
      '       c.tipoconta,'
      '       c.flgcontaconjunta,'
      '       pa.nome as nomeagencia,'
      '       pb.nome as nomebanco,'
      '       a.numagencia,'
      '       a.idbanco,'
      '       b.numbanco,'
      '       decode(c.flgcontapref,1,'#39'Sim'#39','#39'Não'#39') as contapref,'
      
        '       decode(c.tipoconta,1,'#39'Corrente'#39',2,'#39'Salário'#39',3,'#39'Poupança'#39')' +
        ' as tpConta'
      
        'from   rubricaindiv r, provdesc p, provdesc rubpa, pessoa pben, ' +
        'pessoa pfav,'
      
        '       pessoa palim, regra rg, endpess e, telendpess t, cidades ' +
        'cd, estado uf,'
      
        '       pessoa pa, pessoa pb, agenciabancaria a, banco b, contaba' +
        'ncaria c, paramaprev prm'
      ''
      
        ' where -- r.idtitular        = idpessoa           and  -- andre ' +
        'tavares pendência 16699'
      
        '       r.idpessoa        =       :idpessoa         and  -- andre' +
        ' tavares pendencia 16699'
      '       r.idrubrica         = p.idprovento        and'
      '       r.rubricaproventopa = rubpa.idprovento(+) and'
      '       r.idpessoa          = pben.idpessoa(+)    and'
      '       r.idfavorecido      = pfav.idpessoa(+)    and'
      '       r.idalimentado      = palim.idpessoa(+)   and'
      '       r.idregracalculo    = rg.idregra(+)       and'
      '       pfav.idpessoa       = e.idpessoa(+)       and'
      '       e.idendereco        = t.idendereco(+)     and'
      '       e.idcidades         = cd.idcidades(+)     and'
      '       cd.idestado         = uf.idestado(+)      and'
      '       r.idfavorecido      = c.idpessoa(+)       and'
      '       c.idagencia         = pa.idpessoa(+)      and'
      '       c.idagencia         = a.idpessoa(+)       and'
      '       a.idbanco           = pb.idpessoa(+)      and'
      '       a.idbanco           = b.idpessoa(+)    '
      
        '       and c.FLGCONTAPREF(+) = 1 -- andre tavares - pendencia 16' +
        '690'
      ''
      'order by r.idrubrica'
      ''
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGBASEPA;CheckBox;1;0'
      'FLGUSAABONO;CheckBox;1;0'
      'FLGPERMANENTE;CheckBox;1;0'
      'FLGDESATIVADO;CheckBox;1;0'
      'FLGUSADO;CheckBox;1;0')
    PictureMasks.Strings = (
      
        'VALORRESULT'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]' +
        '#[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[' +
        '#][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#' +
        '[#][#]]]}'#9'T'#9'T'
      
        'VALORRESERVA'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#' +
        '[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#' +
        ']]]}'#9'T'#9'T'
      'VALORATUAL'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 269
    Top = 204
    ParamData = <
      item
        DataType = ftString
        Name = 'idpessoa'
        ParamType = ptUnknown
        Value = 1262094
      end>
    object qryRubIndivDATAINICIO: TDateTimeField
      DisplayLabel = 'Data de Início'
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
    end
    object qryRubIndivDATAFINAL: TDateTimeField
      DisplayLabel = 'Data Final'
      DisplayWidth = 10
      FieldName = 'DATAFINAL'
    end
    object qryRubIndivANOMESREF: TStringField
      DisplayLabel = 'Mês de Referência'
      DisplayWidth = 7
      FieldName = 'ANOMESREF'
      Size = 7
    end
    object qryRubIndivVALORRUBRICA: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALORRUBRICA'
    end
    object qryRubIndivNOMEFAV: TStringField
      DisplayLabel = 'Favorecido'
      DisplayWidth = 40
      FieldName = 'NOMEFAV'
      Size = 60
    end
    object qryRubIndivDOCFAV: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 18
      FieldName = 'DOCFAV'
      FixedChar = True
      Size = 18
    end
    object qryRubIndivFLGBASEPA: TFloatField
      DisplayLabel = 'Forma Base de Outras PA´s'
      DisplayWidth = 12
      FieldName = 'FLGBASEPA'
    end
    object qryRubIndivFLGUSAABONO: TFloatField
      DisplayLabel = 'Incide sobre o Abono Anual'
      DisplayWidth = 10
      FieldName = 'FLGUSAABONO'
    end
    object qryRubIndivFLGPERMANENTE: TFloatField
      DisplayLabel = 'Permanente'
      DisplayWidth = 10
      FieldName = 'FLGPERMANENTE'
    end
    object qryRubIndivPARCELAS: TFloatField
      DisplayLabel = 'Total de Parcelas'
      DisplayWidth = 10
      FieldName = 'PARCELAS'
    end
    object qryRubIndivNUMOCORRENCIAS: TFloatField
      DisplayLabel = 'Parcelas Processadas'
      DisplayWidth = 10
      FieldName = 'NUMOCORRENCIAS'
    end
    object qryRubIndivSEQRUBRICAINDIV: TFloatField
      DisplayLabel = 'Sequencial'
      DisplayWidth = 10
      FieldName = 'SEQRUBRICAINDIV'
    end
    object qryRubIndivCODIGORUBRICA: TFloatField
      DisplayLabel = 'Codigo da Rubrica'
      DisplayWidth = 10
      FieldName = 'CODIGORUBRICA'
    end
    object qryRubIndivDESCRUBRICA: TStringField
      DisplayLabel = 'Descrição da Rubrica'
      DisplayWidth = 60
      FieldName = 'DESCRUBRICA'
      Size = 130
    end
    object qryRubIndivPROVDESC: TStringField
      DisplayLabel = 'P/D'
      DisplayWidth = 3
      FieldName = 'PROVDESC'
      Size = 1
    end
    object qryRubIndivRUBRICAPA: TFloatField
      DisplayLabel = 'Cód. Rubrica Provento PA'
      DisplayWidth = 10
      FieldName = 'RUBRICAPA'
    end
    object qryRubIndivDESCPA: TStringField
      DisplayLabel = 'Desc. Rubrica Provento PA'
      DisplayWidth = 60
      FieldName = 'DESCPA'
      Size = 130
    end
    object qryRubIndivPROVDESCPA: TStringField
      DisplayLabel = 'P/D'
      DisplayWidth = 1
      FieldName = 'PROVDESCPA'
      Size = 1
    end
    object qryRubIndivFLGDESATIVADO: TFloatField
      DisplayLabel = 'Desativada'
      DisplayWidth = 10
      FieldName = 'FLGDESATIVADO'
    end
    object qryRubIndivFLGUSADO: TFloatField
      DisplayLabel = 'Já Processada'
      DisplayWidth = 10
      FieldName = 'FLGUSADO'
    end
    object qryRubIndivNOMEREGRA: TStringField
      DisplayLabel = 'Descrição da Regra'
      DisplayWidth = 30
      FieldName = 'NOMEREGRA'
      Size = 60
    end
    object qryRubIndivIDRUBRICA: TFloatField
      DisplayLabel = 'Rubrica'
      DisplayWidth = 10
      FieldName = 'IDRUBRICA'
      Visible = False
    end
    object qryRubIndivDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 92
      FieldName = 'DESCRICAO'
      Visible = False
      Size = 130
    end
    object qryRubIndivIDREGRACALCULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRACALCULO'
      Visible = False
    end
    object qryRubIndivNOMEALIM: TStringField
      DisplayWidth = 60
      FieldName = 'NOMEALIM'
      Visible = False
      Size = 60
    end
    object qryRubIndivRUBRICAPROVENTOPA: TFloatField
      DisplayWidth = 10
      FieldName = 'RUBRICAPROVENTOPA'
      Visible = False
    end
    object qryRubIndivTIPOPERMANENTE: TStringField
      DisplayWidth = 3
      FieldName = 'TIPOPERMANENTE'
      Visible = False
      Size = 3
    end
    object qryRubIndivFLGPERCENT: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGPERCENT'
      Visible = False
    end
    object qryRubIndivNOMEBENEF: TStringField
      DisplayWidth = 60
      FieldName = 'NOMEBENEF'
      Visible = False
      Size = 60
    end
    object qryRubIndivDOCALIM: TStringField
      DisplayWidth = 18
      FieldName = 'DOCALIM'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qryRubIndivLOGRADOURO: TStringField
      DisplayWidth = 60
      FieldName = 'LOGRADOURO'
      Visible = False
      Size = 60
    end
    object qryRubIndivNUMERO: TStringField
      DisplayWidth = 8
      FieldName = 'NUMERO'
      Visible = False
      Size = 8
    end
    object qryRubIndivBAIRRO: TStringField
      DisplayWidth = 20
      FieldName = 'BAIRRO'
      Visible = False
    end
    object qryRubIndivCEP: TStringField
      DisplayWidth = 8
      FieldName = 'CEP'
      Visible = False
      Size = 8
    end
    object qryRubIndivNOME: TStringField
      DisplayWidth = 50
      FieldName = 'NOME'
      Visible = False
      Size = 50
    end
    object qryRubIndivNOMEESTADO: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEESTADO'
      Visible = False
      Size = 30
    end
    object qryRubIndivDDD: TStringField
      DisplayWidth = 5
      FieldName = 'DDD'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object qryRubIndivNUMEROTEL: TStringField
      DisplayWidth = 20
      FieldName = 'NUMEROTEL'
      Visible = False
    end
    object qryRubIndivTIPO: TStringField
      DisplayWidth = 5
      FieldName = 'TIPO'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object qryRubIndivCONTACORRENTE: TStringField
      DisplayWidth = 15
      FieldName = 'CONTACORRENTE'
      Visible = False
      Size = 15
    end
    object qryRubIndivIDAGENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDAGENCIA'
      Visible = False
    end
    object qryRubIndivTIPOCONTA: TStringField
      DisplayWidth = 1
      FieldName = 'TIPOCONTA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryRubIndivFLGCONTACONJUNTA: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCONTACONJUNTA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryRubIndivNOMEAGENCIA: TStringField
      DisplayWidth = 60
      FieldName = 'NOMEAGENCIA'
      Visible = False
      Size = 60
    end
    object qryRubIndivNOMEBANCO: TStringField
      DisplayWidth = 60
      FieldName = 'NOMEBANCO'
      Visible = False
      Size = 60
    end
    object qryRubIndivNUMAGENCIA: TStringField
      DisplayWidth = 15
      FieldName = 'NUMAGENCIA'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object qryRubIndivIDBANCO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBANCO'
      Visible = False
    end
    object qryRubIndivNUMBANCO: TStringField
      DisplayWidth = 10
      FieldName = 'NUMBANCO'
      Visible = False
      Size = 10
    end
    object qryRubIndivCONTAPREF: TStringField
      DisplayWidth = 3
      FieldName = 'CONTAPREF'
      Visible = False
      Size = 3
    end
    object qryRubIndivTPCONTA: TStringField
      DisplayWidth = 8
      FieldName = 'TPCONTA'
      Visible = False
      Size = 8
    end
  end
  object dsRubIndiv: TwwDataSource
    AutoEdit = False
    DataSet = qryRubIndiv
    Left = 267
    Top = 205
  end
  object qryEmprestimos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT C.IDCONTRATOEMPTMO, TCE.TCEDESCRICAO,    TCE.IDTIPOEMPTMO' +
        ', TE.DESCTIPOEMPTMO, C.IDPATRO,      C.IDPLANOPREV,'
      
        '       C.IDBENEF,          C.FLGFORMAREC,       C.FLGFORMAPAG,  ' +
        '  C.PORTFORMAREC,    C.PORTFORMAPAG, C.CODFORMAPAG,'
      
        '       PREC.DESCRICAO      AS DESCREC,          PPAG.DESCRICAO A' +
        'S DESCPAG, F.DESCRICAO AS DESCFORMA,'
      
        '       DECODE(C.FLGSITUACAO,'#39'A'#39','#39'Ativo'#39',       '#39'E'#39','#39'Encerrado'#39','#39 +
        'K'#39','#39'Em quitação'#39','#39'Q'#39','#39'Quitado'#39','
      
        '                            '#39'C'#39','#39'Cancelado'#39',   '#39'S'#39','#39'Suspenso'#39', '#39 +
        'P'#39','#39'Pendente'#39') AS DESCSITUACAO,'
      
        '       C.DATAASSINATURA,   C.DATACANC,          C.VLRCONTRATO,  ' +
        '  C.VLRPARCELA,      C.TXJUROS,      C.DATACREDITO,'
      
        '       C.DATAPRIMPARC,     HME.HMEDATAATUALIZA, HME.HMESALDODEV,' +
        '  C.NUMPARCELAS,     HME.HMEPARCELA,'
      
        '       DECODE(C.FLGSITUACAO,'#39'C'#39',0,HME.PARCELAS_RESTANTES) AS PAR' +
        'CELASRESTANTES,      HME.HMENUMPARCELAS'
      
        'FROM CONTRATOEMPTMO C, TIPOCONTREMPTMO TCE, TIPOEMPTMO TE, PORTA' +
        'DORFORMA PPAG, PORTADORFORMA PREC, FORMARECPAG F,'
      
        '   ( SELECT HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,  HME.HMEP' +
        'ARCELA, HME.HMENUMPARCELAS,'
      
        '            HME.HMENUMPARCELAS   AS PARCELAS_RESTANTES, HME.HMED' +
        'ATA,    HME.HMEDATAATUALIZA,'
      '            HME.HMESALDODEV'
      '     FROM HISTMOVEMPTMO HME, CONTRATOEMPTMO CON'
      '     WHERE HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO'
      '       AND HME.HMETIPOMOV       <> 5'
      '       AND CON.IDPESSOA          = :IDTITULAR'
      '       AND CON.IDBENEF           = :IDPESSOA'
      '     ORDER BY HMEDATA DESC ) HME,'
      
        '   ( SELECT CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHIST' +
        'MOVEMPTMO'
      
        '     FROM HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, ITEMXTIPOCONTR ' +
        'ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE'
      '     WHERE (CON.IDPESSOA            = :IDTITULAR)'
      '       AND (CON.IDBENEF             = :IDPESSOA)'
      '       AND HME.HMETIPOMOV          <> 5'
      '       AND ( ITC.ITCTRATASALDODEV  <> 0 )'
      '       AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      '       AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '       AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )'
      '       AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '       AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO )'
      '       AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '       AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '     GROUP BY CON.IDCONTRATOEMPTMO ) MAX'
      'WHERE (C.IDPESSOA          = :IDTITULAR)'
      '  AND (C.IDBENEF           = :IDPESSOA)'
      '  AND (C.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO )'
      '  AND (C.IDCONTRATOEMPTMO  = MAX.IDCONTRATOEMPTMO )'
      '  AND (HME.IDHISTMOVEMPTMO = MAX.IDHISTMOVEMPTMO )'
      '  AND (C.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO)'
      '  AND (TCE.IDTIPOEMPTMO    = TE.IDTIPOEMPTMO)'
      
        '  AND ((C.PORTFORMAPAG     = PPAG.CODPORTFORMA(+)) AND (C.FLGFOR' +
        'MAPAG = PPAG.RECPAG(+)))'
      
        '  AND ((C.PORTFORMAREC     = PREC.CODPORTFORMA(+)) AND (C.FLGFOR' +
        'MAREC = PREC.RECPAG(+)))'
      '  AND (C.CODFORMAPAG       = F.CODFORMA(+))'
      ''
      ' '
      ' ')
    PictureMasks.Strings = (
      
        'VALORRESULT'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]' +
        '#[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[' +
        '#][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#' +
        '[#][#]]]}'#9'T'#9'T'
      
        'VALORRESERVA'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#' +
        '[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#' +
        ']]]}'#9'T'#9'T'
      'VALORATUAL'#9'999,999,999.99'#9'T'#9'T'
      'VLRCONTRATO'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 381
    Top = 207
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptInput
        Value = 8
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    object qryEmprestimosTCEDESCRICAO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 29
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryEmprestimosDESCSITUACAO: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 7
      FieldName = 'DESCSITUACAO'
      Size = 11
    end
    object qryEmprestimosVLRCONTRATO: TFloatField
      DisplayLabel = 'Valor Contrato'
      DisplayWidth = 11
      FieldName = 'VLRCONTRATO'
    end
    object qryEmprestimosVLRPARCELA: TFloatField
      DisplayLabel = 'Valor Parcelas'
      DisplayWidth = 11
      FieldName = 'VLRPARCELA'
    end
    object qryEmprestimosNUMPARCELAS: TFloatField
      DisplayLabel = 'No Parcelas'
      DisplayWidth = 10
      FieldName = 'NUMPARCELAS'
    end
    object qryEmprestimosPARCELASRESTANTES: TFloatField
      DisplayLabel = 'Restantes'
      DisplayWidth = 8
      FieldName = 'PARCELASRESTANTES'
    end
    object qryEmprestimosHMESALDODEV: TFloatField
      DisplayLabel = 'Saldo Devedor'
      DisplayWidth = 12
      FieldName = 'HMESALDODEV'
    end
    object qryEmprestimosDATAASSINATURA: TDateTimeField
      DisplayLabel = 'Assinatura'
      DisplayWidth = 18
      FieldName = 'DATAASSINATURA'
    end
    object qryEmprestimosDATACANC: TDateTimeField
      DisplayLabel = 'Cancelamento'
      DisplayWidth = 18
      FieldName = 'DATACANC'
    end
    object qryEmprestimosTXJUROS: TFloatField
      DisplayLabel = 'Tx Juros'
      DisplayWidth = 10
      FieldName = 'TXJUROS'
    end
    object qryEmprestimosDATACREDITO: TDateTimeField
      DisplayLabel = 'Crédito'
      DisplayWidth = 18
      FieldName = 'DATACREDITO'
    end
    object qryEmprestimosDATAPRIMPARC: TDateTimeField
      DisplayLabel = '1a Parcela'
      DisplayWidth = 18
      FieldName = 'DATAPRIMPARC'
    end
    object qryEmprestimosHMEDATAATUALIZA: TDateTimeField
      DisplayLabel = 'Atualização'
      DisplayWidth = 18
      FieldName = 'HMEDATAATUALIZA'
    end
    object qryEmprestimosDESCREC: TStringField
      DisplayLabel = 'Contas/Caixas Recbto'
      DisplayWidth = 50
      FieldName = 'DESCREC'
      Size = 50
    end
    object qryEmprestimosDESCPAG: TStringField
      DisplayLabel = 'Contas/Caixas Pagto'
      DisplayWidth = 50
      FieldName = 'DESCPAG'
      Size = 50
    end
    object qryEmprestimosDESCFORMA: TStringField
      DisplayLabel = 'Forma Pagto'
      DisplayWidth = 30
      FieldName = 'DESCFORMA'
      Size = 30
    end
    object qryEmprestimosIDCONTRATOEMPTMO: TFloatField
      DisplayLabel = 'Nº Contrato'
      DisplayWidth = 18
      FieldName = 'IDCONTRATOEMPTMO'
      Visible = False
    end
    object qryEmprestimosIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Visible = False
    end
    object qryEmprestimosDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Visible = False
      Size = 60
    end
    object qryEmprestimosIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Visible = False
    end
    object qryEmprestimosIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryEmprestimosIDBENEF: TFloatField
      FieldName = 'IDBENEF'
      Visible = False
    end
    object qryEmprestimosFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryEmprestimosFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryEmprestimosPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
      Visible = False
    end
    object qryEmprestimosPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
      Visible = False
    end
    object qryEmprestimosCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
      Visible = False
    end
    object qryEmprestimosHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
      Visible = False
    end
    object qryEmprestimosHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
      Visible = False
    end
  end
  object dsEmprestimo: TwwDataSource
    AutoEdit = False
    DataSet = qryEmprestimos
    Left = 363
    Top = 196
  end
  object qryhstEmprestimo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    DataSource = dsEmprestimo
    SQL.Strings = (
      'SELECT'
      
        '   H.IDCONTRATOEMPTMO, H.IDITEMEMPTMO, H.ITEDESCRICAO, H.HMEPARC' +
        'ELA,'
      '   H.DESC_EVENTO AS HMETIPOMOV,'
      
        '   H.HMEDATA, H.HMEDATAPREVISTA, H.HMEDATAEFETIVA, H.HMEDATAATUA' +
        'LIZA,'
      
        '   (H.HMEANOCOMPETENCIA||'#39'/'#39'|| H.HMEMESCOMPETENCIA) AS ANOMESCOM' +
        'PETENCIA,'
      
        '   (H.HMEANOCOBRANCA ||'#39'/'#39'|| H.HMEMESCOBRANCA) AS ANOMESCOBRANCA' +
        ','
      '   H.HMEVLRPREVISTO, H.HMEVLREFETIVO, H.HMESALDODEV,'
      '   DECODE(H.FLGBAIXADO,0,'#39'Em aberto'#39','#39'Baixado'#39') AS DESCBAIXADO,'
      '   H.IDHISTMOVEMPTMO'
      'FROM  VW_MOVEP H'
      'WHERE (H.IDCONTRATOEMPTMO = :idContratoEmptmo)'
      '      AND (H.FLGESTORNADO IS NULL OR H.FLGESTORNADO = 0)'
      'ORDER BY H.IDHISTMOVEMPTMO DESC ')
    PictureMasks.Strings = (
      
        'VALORRESULT'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]' +
        '#[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[' +
        '#][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#' +
        '[#][#]]]}'#9'T'#9'T'
      
        'VALORRESERVA'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#' +
        '[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#' +
        ']]]}'#9'T'#9'T'
      'VALORATUAL'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 85
    Top = 265
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idContratoEmptmo'
        ParamType = ptInput
        Value = 364725
      end>
    object qryhstEmprestimoITEDESCRICAO: TStringField
      DisplayLabel = 'Ítem'
      DisplayWidth = 40
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryhstEmprestimoHMEPARCELA: TFloatField
      DisplayLabel = 'Parcela'
      DisplayWidth = 10
      FieldName = 'HMEPARCELA'
    end
    object qryhstEmprestimoHMETIPOMOV: TStringField
      DisplayLabel = 'Movimentação'
      DisplayWidth = 18
      FieldName = 'HMETIPOMOV'
      Size = 18
    end
    object qryhstEmprestimoHMEDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 18
      FieldName = 'HMEDATA'
    end
    object qryhstEmprestimoHMEDATAPREVISTA: TDateTimeField
      DisplayLabel = 'Data Prevista'
      DisplayWidth = 18
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryhstEmprestimoHMEDATAEFETIVA: TDateTimeField
      DisplayLabel = 'Data Efetiva'
      DisplayWidth = 18
      FieldName = 'HMEDATAEFETIVA'
    end
    object qryhstEmprestimoHMEDATAATUALIZA: TDateTimeField
      DisplayLabel = 'Data Atualização'
      DisplayWidth = 18
      FieldName = 'HMEDATAATUALIZA'
    end
    object qryhstEmprestimoHMEVLRPREVISTO: TFloatField
      DisplayLabel = 'Valor Previsto'
      DisplayWidth = 11
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryhstEmprestimoHMEVLREFETIVO: TFloatField
      DisplayLabel = 'Valor Efetivo'
      DisplayWidth = 10
      FieldName = 'HMEVLREFETIVO'
    end
    object qryhstEmprestimoHMESALDODEV: TFloatField
      DisplayLabel = 'Saldo Devedor'
      DisplayWidth = 12
      FieldName = 'HMESALDODEV'
    end
    object qryhstEmprestimoDESCBAIXADO: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 8
      FieldName = 'DESCBAIXADO'
      Size = 9
    end
    object qryhstEmprestimoANOMESCOMPETENCIA: TStringField
      DisplayLabel = 'Competência'
      DisplayWidth = 12
      FieldName = 'ANOMESCOMPETENCIA'
      Size = 81
    end
    object qryhstEmprestimoANOMESCOBRANCA: TStringField
      DisplayLabel = 'Cobrança'
      DisplayWidth = 12
      FieldName = 'ANOMESCOBRANCA'
      Size = 81
    end
    object qryhstEmprestimoIDCONTRATOEMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOEMPTMO'
      Visible = False
    end
    object qryhstEmprestimoIDITEMEMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDITEMEMPTMO'
      Visible = False
    end
    object qryhstEmprestimoIDHISTMOVEMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHISTMOVEMPTMO'
      Visible = False
    end
  end
  object dsHstEmprestimo: TwwDataSource
    AutoEdit = False
    DataSet = qryhstEmprestimo
    Left = 83
    Top = 265
  end
  object DsRubXBeneficio: TwwDataSource
    DataSet = qryRubXBeneficio
    Left = 213
    Top = 106
  end
  object qryRubXBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsRubs
    SQL.Strings = (
      'SELECT'
      '   se.NOME'
      'FROM'
      '   RUBXBENEFICIO RB, servico se'
      'WHERE'
      '   (RB.IDRUBS = :idrubs) AND'
      '   (RB.IDBENEFICIO = se.idservicos)'
      ''
      'union'
      ''
      'SELECT'
      '   be.NOME'
      'FROM'
      '   RUBXBENEFICIO RB, beneficio be'
      'WHERE'
      '   (RB.IDRUBS = :idrubs) AND'
      '   (RB.IDBENEFICIO = be.idbeneficio)')
    ValidateWithMask = True
    Left = 212
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'idrubs'
        ParamType = ptUnknown
      end>
    object qryRubXBeneficioNOME: TStringField
      DisplayLabel = 'Benefício\Serviço'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = '"CM.BENEFICIO".NOME'
      Size = 60
    end
  end
  object qryDataServidor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SYSDATE as DATASERVIDOR FROM DUAL')
    ValidateWithMask = True
    Left = 328
    Top = 204
    object qryDataServidorDATASERVIDOR: TDateTimeField
      FieldName = 'DATASERVIDOR'
    end
  end
  object qryPessoaFisica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select '
      '  FLGBLOQUEIO'
      'from PessoaFisica'
      'where IdPessoa = :IdPessoa'
      '')
    ValidateWithMask = True
    Left = 680
    Top = 170
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IdPessoa'
        ParamType = ptInput
      end>
    object qryPessoaFisicaFLGBLOQUEIO: TFloatField
      FieldName = 'FLGBLOQUEIO'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGBLOQUEIO'
    end
  end
  object qryDocPessoa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select '
      '  numdocumento '
      'from pessoa '
      'where'
      '    (idpessoa  = :idpessoa)')
    ValidateWithMask = True
    Left = 85
    Top = 207
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptInput
      end>
    object qryDocPessoaNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'BASEDADOS.DOCPESSOA.NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
  end
  object qryMesRubrica: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  DISTINCT'
      '  HR.MESCOBRANCA, hr.idmodulo'
      'FROM HISTRUBSAL HR'
      'WHERE HR.IDPESSOA = :idpessoa '
      'ORDER BY HR.MESCOBRANCA DESC')
    ValidateWithMask = True
    Left = 498
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
  end
  object DsHstRubricas: TwwDataSource
    DataSet = qryHstRubricas
    Left = 487
    Top = 265
  end
  object qryHstRubricas: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '              H.IDPESSOA,'
      '              H.IDPESSJUR,'
      '              H.IDMOTIVO,'
      '              H.IDPATRO,'
      '              H.MES,'
      '              H.MESCOBRANCA,'
      '              H.REFERENCIA,'
      '              H.IDRUBRICA,'
      '              H.CODPROVDESC,'
      '              H.VALORPROVENTO,'
      '              H.VALORINTEGRAL,'
      '              SUMPROVDESC.SUMDESCONTO,'
      '              SUMPROVDESC.SUMPROVENTO,'
      
        '              SUMPROVDESC.SUMPROVENTO - SUMPROVDESC.SUMDESCONTO ' +
        'AS SUMLIQ,'
      '              H.FLGCOMPOESALPART,'
      '              H.FLGCOMPOESALBENEF,'
      '              H.FLGCOMPOEREMTOTAL,'
      '              H.FLGIRRF,'
      '              H.SEQRUBRICA,'
      '              C.DESCRICAO,'
      
        '              DECODE(C.FLGDESCONTO, 0, '#39'PROVENTO'#39', 1, '#39'DESCONTO'#39 +
        ', 2, '#39'ESPECIAL'#39') AS PROVENTODESC,'
      '              H.FLGSRB,'
      '              DECODE(H.FLGSRB,  1, '#39'ATIVO OU MANTIDO TOTAL'#39','
      '                                2, '#39'AUX. DOENçA'#39','
      '                                3, '#39'INSS'#39','
      '                                4, '#39'SAL. VIRTUAL'#39','
      '                                5, '#39'MANTIDO PARCIAL'#39','
      '                                0, '#39'OUTROS'#39') AS DESCFLGSRB'
      ' FROM HISTRUBSAL H, PROVDESC C,'
      
        '(SELECT H1.IDPESSOA, H1.MESCOBRANCA, SUM(DECODE(P1.FLGDESCONTO,1' +
        ',VALORPROVENTO,0)) AS SUMDESCONTO,'
      '    SUM(DECODE(P1.FLGDESCONTO,0,VALORPROVENTO,0)) AS SUMPROVENTO'
      '    FROM  HISTRUBSAL H1, PROVDESC P1'
      '    WHERE (H1.IDPESSOA = :idpessoa)      AND'
      
        ' ((H1.IDMODULO <> 18) OR ((H1.IDMODULO = 18) AND (H1.IDHSTFOLHAB' +
        'ENEF IS NULL))) AND'
      '          (H1.IDRUBRICA = P1.IDPROVENTO) AND'
      '          (P1.FLGDESCONTO <> 2)          AND'
      '          (H1.MESCOBRANCA = :mescobranca)'
      'GROUP BY H1.IDPESSOA, H1.MESCOBRANCA'
      ') SUMPROVDESC'
      ''
      ' WHERE  (H.IDPESSOA = :idpessoa)'
      ' AND    (H.IDRUBRICA = C.IDPROVENTO)'
      ' AND    (H.MESCOBRANCA =  :mescobranca)'
      
        ' AND ((H.IDMODULO <> 18) OR ((H.IDMODULO = 18) AND (H.IDHSTFOLHA' +
        'BENEF IS NULL)))'
      ' AND   SUMPROVDESC.IDPESSOA = H.IDPESSOA'
      ' AND   SUMPROVDESC.MESCOBRANCA = H.MESCOBRANCA'
      ''
      ' ORDER BY C.FLGDESCONTO, MES DESC , CODPROVDESC'
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ControlType.Strings = (
      'FLGCOMPOESALPART;CheckBox;1;0'
      'FLGCOMPOESALBENEF;CheckBox;1;0'
      'FLGSRB;CheckBox;1;0'
      'FLGCOMPOEREMTOTAL;CheckBox;1;0')
    PictureMasks.Strings = (
      'VALORPROVENTO'#9'###.###.###.##0,00'#9'T'#9'T'
      'SUMPROVENTO'#9'999,999,999,999.99'#9'T'#9'F'
      'SUMDESCONTO'#9'999,999,999,999.99'#9'T'#9'F'
      'SUMLIQ'#9'999,999,999,999.99'#9'T'#9'F')
    ValidateWithMask = True
    Left = 484
    Top = 263
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
        Value = '424453'
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
        Value = '2003/08'
      end
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptInput
      end>
    object qryHstRubricasMES: TStringField
      DisplayLabel = 'Mês de ~Referência'
      DisplayWidth = 9
      FieldName = 'MES'
      FixedChar = True
      Size = 7
    end
    object qryHstRubricasCODPROVDESC: TStringField
      DisplayLabel = 'Código na~Patrocinadora'
      DisplayWidth = 13
      FieldName = 'CODPROVDESC'
      Size = 15
    end
    object qryHstRubricasPROVENTODESC: TStringField
      DisplayLabel = 'Tipo de ~Rubrica'
      DisplayWidth = 10
      FieldName = 'PROVENTODESC'
      Size = 8
    end
    object qryHstRubricasVALORPROVENTO: TFloatField
      DisplayLabel = 'Valor (R$)'
      DisplayWidth = 11
      FieldName = 'VALORPROVENTO'
    end
    object qryHstRubricasDESCRICAO: TStringField
      DisplayLabel = 'Rubrica'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Size = 130
    end
    object qryHstRubricasFLGCOMPOESALBENEF: TFloatField
      DisplayLabel = 'Compõe ~Sal. Benf.'
      DisplayWidth = 8
      FieldName = 'FLGCOMPOESALBENEF'
    end
    object qryHstRubricasFLGCOMPOESALPART: TFloatField
      DisplayLabel = 'Compõe ~Sal. Part.'
      DisplayWidth = 8
      FieldName = 'FLGCOMPOESALPART'
    end
    object qryHstRubricasFLGCOMPOEREMTOTAL: TFloatField
      DisplayLabel = 'Compõe ~Sal. Rem. Total'
      DisplayWidth = 12
      FieldName = 'FLGCOMPOEREMTOTAL'
    end
    object qryHstRubricasDESCFLGSRB: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 42
      FieldName = 'DESCFLGSRB'
      Size = 22
    end
    object qryHstRubricasFLGSRB: TFloatField
      DisplayLabel = 'SRB'
      DisplayWidth = 4
      FieldName = 'FLGSRB'
    end
    object qryHstRubricasIDRUBRICA: TFloatField
      DisplayLabel = 'Código~Interno'
      DisplayWidth = 7
      FieldName = 'IDRUBRICA'
    end
    object qryHstRubricasSUMDESCONTO: TFloatField
      DisplayWidth = 10
      FieldName = 'SUMDESCONTO'
      Visible = False
    end
    object qryHstRubricasSUMPROVENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'SUMPROVENTO'
      Visible = False
    end
    object qryHstRubricasSUMLIQ: TFloatField
      DisplayWidth = 10
      FieldName = 'SUMLIQ'
      Visible = False
    end
    object qryHstRubricasMESCOBRANCA: TStringField
      DisplayLabel = 'Mês de ~Cob./Pag.'
      DisplayWidth = 9
      FieldName = 'MESCOBRANCA'
      Visible = False
      FixedChar = True
      Size = 7
    end
    object qryHstRubricasIDPESSJUR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryHstRubricasIDPATRO: TFloatField
      DisplayLabel = 'Cód. Patro.'
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Visible = False
    end
    object qryHstRubricasIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryHstRubricasIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Visible = False
    end
    object qryHstRubricasREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Visible = False
      Size = 10
    end
    object qryHstRubricasVALORINTEGRAL: TFloatField
      FieldName = 'VALORINTEGRAL'
      Visible = False
    end
    object qryHstRubricasFLGIRRF: TFloatField
      FieldName = 'FLGIRRF'
      Visible = False
    end
    object qryHstRubricasSEQRUBRICA: TFloatField
      FieldName = 'SEQRUBRICA'
      Visible = False
    end
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 520
    Top = 106
  end
  object regraAPrev: TRegra
    QueryIn = qryRegra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 454
    Top = 370
  end
  object UpdDepenTit: TUpdateSQL
    Left = 192
    Top = 216
  end
  object qryHistFunc: TwwQuery
    CachedUpdates = True
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     H.IDPESSOA,'
      '     H.SEQHISTFUNC,'
      '     H.IDDOCUMENTO,'
      '     H.CODTPINSALUBRI,'
      '     H.DATAINICIO,'
      '     H.DATAFINAL,'
      '     H.EMPRESA,'
      '     H.FLGCONTATS,'
      '     H.NUMDOCUMENTO,'
      '     H.TEMPOCALC,'
      '     H.MATRICULA,'
      '     EL.TEMPOSERVANTERIOR,'
      '     EL.TEMPOSERVCALC,'
      '     EL.TEMPOSITESPECIAL,'
      '     EL.TEMPOSIMPLES AS TEMPOSEMCONVERSAO,'
      '     EL.TEMPONAOCREDITADO,'
      '     P.NOME,'
      '     P.NUMDOCUMENTO AS CPF,'
      '     TI.DESCRICAO INSALUBRI,'
      
        '     '#39'90 ANO(S), 90 MES(ES) E 30 DIA(S)'#39' AS TEMPOPOREMPRESAEXTEN' +
        'SO,'
      '     '#39'90 ANO(S), 90 MES(ES) E 30 DIA(S)'#39' AS TEMPOTOTALEXT,'
      
        '     '#39'90 ANO(S), 90 MES(ES) E 30 DIA(S)'#39' AS TEMPOSEMCONVERSAOEXT' +
        ','
      '     '#39'90 ANO(S), 90 MES(ES) E 30 DIA(S)'#39' AS TEMPOINDIVEXT'
      'FROM'
      '     ELEGPATRO EL,'
      '     PESSOA P,'
      '     HISTFUNCPREV H,'
      '     TPINSALUBRI TI'
      'WHERE  (EL.IDPESSJUR = :IDPESSJUR)'
      'AND    (EL.IDPESSOA = :IDTITULAR)'
      'AND    (P.IDPESSOA = EL.IDPESSOA)'
      'AND    (H.IDPESSOA = EL.IDPESSOA)'
      'AND    (H.CODTPINSALUBRI = TI.CODTPINSALUBRI(+))'
      'ORDER BY'
      '    H.DATAINICIO asc,'
      '    H.SEQHISTFUNC asc'
      '')
    UpdateObject = UpdHistFunc
    ControlType.Strings = (
      'FLGCONTATS;CheckBox;1;0')
    ValidateWithMask = True
    Left = 84
    Top = 372
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end>
    object qryHistFuncEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      DisplayWidth = 30
      FieldName = 'EMPRESA'
      Size = 60
    end
    object qryHistFuncMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 13
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryHistFuncDATAINICIO: TDateTimeField
      DisplayLabel = 'Data Inicial'
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
    end
    object qryHistFuncDATAFINAL: TDateTimeField
      DisplayLabel = 'Data Final'
      DisplayWidth = 10
      FieldName = 'DATAFINAL'
    end
    object qryHistFuncTEMPOCALC: TFloatField
      DisplayLabel = 'Dias'
      DisplayWidth = 10
      FieldName = 'TEMPOCALC'
    end
    object qryHistFuncTEMPOPOREMPRESAEXTENSO: TStringField
      DisplayLabel = 'Tempo por empresa'
      DisplayWidth = 49
      FieldName = 'TEMPOPOREMPRESAEXTENSO'
      FixedChar = True
      Size = 33
    end
    object qryHistFuncINSALUBRI: TStringField
      DisplayLabel = 'Insalubridade'
      DisplayWidth = 30
      FieldName = 'INSALUBRI'
      Size = 60
    end
    object qryHistFuncFLGCONTATS: TFloatField
      DisplayLabel = 'Conta como tempo ~de Serviço'
      DisplayWidth = 10
      FieldName = 'FLGCONTATS'
    end
    object qryHistFuncTEMPOSERVANTERIOR: TFloatField
      DisplayLabel = 'Tempo de Serviço Anterior ~[em meses]'
      DisplayWidth = 22
      FieldName = 'TEMPOSERVANTERIOR'
    end
    object qryHistFuncTEMPONAOCREDITADO: TFloatField
      DisplayLabel = 'Tempo não Creditado ~[em meses]'
      DisplayWidth = 17
      FieldName = 'TEMPONAOCREDITADO'
    end
    object qryHistFuncTEMPOSEMCONVERSAO: TFloatField
      DisplayLabel = 'Tempo Sem Conversão'
      DisplayWidth = 10
      FieldName = 'TEMPOSEMCONVERSAO'
    end
    object qryHistFuncTEMPOTOTALEXT: TStringField
      DisplayWidth = 33
      FieldName = 'TEMPOTOTALEXT'
      FixedChar = True
      Size = 33
    end
    object qryHistFuncTEMPOSEMCONVERSAOEXT: TStringField
      DisplayWidth = 33
      FieldName = 'TEMPOSEMCONVERSAOEXT'
      FixedChar = True
      Size = 33
    end
    object qryHistFuncTEMPOSERVCALC: TFloatField
      DisplayWidth = 10
      FieldName = 'TEMPOSERVCALC'
      Visible = False
    end
    object qryHistFuncTEMPOSITESPECIAL: TFloatField
      DisplayWidth = 10
      FieldName = 'TEMPOSITESPECIAL'
      Visible = False
    end
    object qryHistFuncNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Visible = False
      Size = 60
    end
    object qryHistFuncCPF: TStringField
      DisplayWidth = 18
      FieldName = 'CPF'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qryHistFuncNUMDOCUMENTO: TStringField
      DisplayWidth = 18
      FieldName = 'NUMDOCUMENTO'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qryHistFuncIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryHistFuncSEQHISTFUNC: TFloatField
      DisplayWidth = 10
      FieldName = 'SEQHISTFUNC'
      Visible = False
    end
    object qryHistFuncIDDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDDOCUMENTO'
      Visible = False
    end
    object qryHistFuncCODTPINSALUBRI: TStringField
      DisplayWidth = 10
      FieldName = 'CODTPINSALUBRI'
      Visible = False
      Size = 10
    end
    object qryHistFuncTEMPOINDIVEXT: TStringField
      FieldName = 'TEMPOINDIVEXT'
      FixedChar = True
      Size = 33
    end
  end
  object DSHistFunc: TwwDataSource
    DataSet = qryHistFunc
    Left = 80
    Top = 372
  end
  object UpdHistFunc: TUpdateSQL
    Left = 80
    Top = 371
  end
  object qryTelefonesCel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select '
      '  tel.ddi, '
      '  tel.ddd, '
      '  tel.numero '
      'from endpess ep, telendpess tel'
      'where ep.idpessoa = :idpessoa and'
      '      tel.idendereco = ep.idendereco and'
      '  tel.tipo = '#39'L'#39)
    ValidateWithMask = True
    Left = 24
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldName = 'DDI'
      Origin = 'BASEDADOS.TELENDPESS.DDI'
      FixedChar = True
      Size = 4
    end
    object StringField2: TStringField
      FieldName = 'DDD'
      Origin = 'BASEDADOS.TELENDPESS.DDD'
      FixedChar = True
      Size = 5
    end
    object StringField3: TStringField
      FieldName = 'NUMERO'
      Origin = 'BASEDADOS.TELENDPESS.NUMERO'
    end
  end
  object DsTelefonesCel: TDataSource
    DataSet = qryTelefonesCel
    Left = 24
    Top = 205
  end
  object qryDataInicioInss: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '      DATAINICIOINSS'
      'FROM  BENEFBFCIARIO'
      'WHERE IDPESSOA = :IDPESSOA'
      'AND   IDSITBENEFICIO IN (1,2)')
    ValidateWithMask = True
    Left = 392
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptInput
      end>
    object qryDataInicioInssDATAINICIOINSS: TDateTimeField
      FieldName = 'DATAINICIOINSS'
      Origin = 'BASEDADOS.BENEFBFCIARIO.DATAINICIOINSS'
    end
  end
  object DsDataInicioInss: TwwDataSource
    DataSet = qryDataInicioInss
    Left = 388
    Top = 312
  end
  object qryTelefoneComercial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select '
      '  tel.ddi, '
      '  tel.ddd, '
      '  tel.numero '
      'from endpess ep, telendpess tel'
      'where ep.idpessoa = :idpessoa and'
      '      tel.idendereco = ep.idendereco and'
      '  tel.tipo = '#39'C'#39)
    ValidateWithMask = True
    Left = 368
    Top = 155
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptInput
      end>
    object StringField4: TStringField
      FieldName = 'DDI'
      Origin = 'BASEDADOS.TELENDPESS.DDI'
      FixedChar = True
      Size = 4
    end
    object StringField5: TStringField
      FieldName = 'DDD'
      Origin = 'BASEDADOS.TELENDPESS.DDD'
      FixedChar = True
      Size = 5
    end
    object StringField6: TStringField
      FieldName = 'NUMERO'
      Origin = 'BASEDADOS.TELENDPESS.NUMERO'
    end
  end
  object DsTelefoneComercial: TwwDataSource
    DataSet = qryTelefoneComercial
    Left = 368
    Top = 155
  end
  object qryInfPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  PPP.INSCRICAONUMERO, '
      '  PPP.INSCRICAODATA,'
      
        '  DECODE(PPP.FLGDESATIVADO, NULL, '#39'ATIVO'#39', 0, '#39'ATIVO'#39', 1, '#39'DESAT' +
        'IVADO'#39') AS SITUACAO,'
      '  PP.NOME AS PLANO'
      'FROM PARTPREVPLAN PPP, PLANPREV PP'
      'WHERE PPP.IDPESSOA = :idpessoa AND'
      '      PPP.IDPESSJUR = :idpessjur AND'
      '      PPP.IDPLANOPREV = :idplanoprev AND'
      '      PP.IDPLANOPREV = PPP.IDPLANOPREV'
      '  ')
    ValidateWithMask = True
    Left = 504
    Top = 313
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'idpessjur'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'idplanoprev'
        ParamType = ptInput
      end>
  end
  object dsInfPlano: TwwDataSource
    DataSet = qryInfPlano
    Left = 500
    Top = 312
  end
  object qryTelefones: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TEL.DDI,'
      '  TEL.DDD,'
      '  TEL.NUMERO,'
      '  TEL.TIPO,'
      '  '#39'0'#39' AS FLGCOM,'
      '  '#39'0'#39' AS FLPART,'
      '  '#39'0'#39' AS FLGFAX,'
      '  '#39'0'#39' AS FLGCEL,'
      '  '#39'0'#39' AS FLGREC,'
      '  '#39'0'#39' AS FLGMODEM'
      
        '  , to_date(TEL.TRGDTINCLUSAO, '#39'DD/MM/RRRR'#39') AS DTINCLUSAO -- si' +
        'g21866'
      'FROM ENDPESS EP, TELENDPESS TEL'
      'WHERE EP.IDPESSOA = :idpessoa AND'
      
        '    (  TEL.IDENDERECO = EP.IDENDERECO OR TEL.IDPESSOA= :idpessoa' +
        ')'
      'ORDER BY  TEL.TRGDTINCLUSAO desc -- sig21866 ')
    UpdateObject = UPDTelefones
    ValidateWithMask = True
    Left = 292
    Top = 314
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptInput
      end>
    object qryTelefonesDDI: TStringField
      DisplayWidth = 4
      FieldName = 'DDI'
      FixedChar = True
      Size = 4
    end
    object qryTelefonesDDD: TStringField
      DisplayWidth = 5
      FieldName = 'DDD'
      FixedChar = True
      Size = 5
    end
    object qryTelefonesNUMERO: TStringField
      DisplayLabel = 'Número'
      DisplayWidth = 20
      FieldName = 'NUMERO'
    end
    object qryTelefonesTIPO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 30
      FieldName = 'TIPO'
      Size = 11
    end
    object qryTelefonesFLGCOM: TStringField
      FieldName = 'FLGCOM'
      FixedChar = True
      Size = 1
    end
    object qryTelefonesFLPART: TStringField
      FieldName = 'FLPART'
      FixedChar = True
      Size = 1
    end
    object qryTelefonesFLGFAX: TStringField
      FieldName = 'FLGFAX'
      FixedChar = True
      Size = 1
    end
    object qryTelefonesFLGCEL: TStringField
      FieldName = 'FLGCEL'
      FixedChar = True
      Size = 1
    end
    object qryTelefonesFLGREC: TStringField
      FieldName = 'FLGREC'
      FixedChar = True
      Size = 1
    end
    object qryTelefonesFLGMODEM: TStringField
      FieldName = 'FLGMODEM'
      FixedChar = True
      Size = 1
    end
    object dtmfldTelefonesDTINCLUSAO: TDateTimeField
      FieldName = 'DTINCLUSAO'
    end
  end
  object DsTelefones: TwwDataSource
    DataSet = qryTelefones
    Left = 292
    Top = 314
  end
  object qryFuncoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT F.IDPESSJUR, F.IDCARGOEXT, F.CODIGO, F.TITULO'
      'FROM   CARGOEXT F'
      'WHERE  F.IDPESSJUR = :IDPESSJUR'
      'AND    F.TIPO = '#39'F'#39
      'ORDER BY F.CODIGO')
    ValidateWithMask = True
    Left = 484
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryProvDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RP.IDRUBRICA,RP.CODPROVDESC,RP.DESCRPROVDESC,'
      '       P.FLGCOMPOESALPART,  P.FLGCOMPOESALBENEF, P.FLGIRRF,'
      '       P.FLGCOMPOEREMTOTAL,  '
      
        '       P.FLGSALBENEFRETRO,  P.FLGSALPARTATUARIA, P.FLGSALPARTRET' +
        'RO'
      'FROM   RUBRICAXPESS RP, PROVDESC P'
      'WHERE  RP.IDPESSOA    = :IDPESSJUR'
      'AND    RP.IDRUBRICA   = P.IDPROVENTO'
      'AND    P.FLGTPRUBRICA LIKE '#39'%P%'#39
      'ORDER  BY RP.DESCRPROVDESC'
      ' ')
    ValidateWithMask = True
    Left = 447
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryVigenciaNivel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDNIVEL, IDPESSJUR,IDCARGOEXT, DATAVIGENCIA'
      'FROM   CARGOXNIVEL'
      'WHERE  IDPESSJUR   = :IDPESSJUR'
      'AND    IDCARGOEXT  = :IDCARGOEXT'
      'AND    DATAVIGENCIA <= :DATAINICIO'
      'AND    ( (DATAFIM >= :DATAINICIO) OR (DATAFIM IS NULL))'
      '')
    ValidateWithMask = True
    Left = 410
    Top = 13
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARGOEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAINICIO'
        ParamType = ptUnknown
      end>
  end
  object qryAdicCompens: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.IDPESSJUR,       E.IDPESSOA,       E.SEQHISTFUNC,'
      '       E.IDPESSJURCG,     E.IDCARGOEXT,'
      '       E.IDPESSJURFG,     E.IDFUNCAO,'
      '       E.DATAINICIO,      E.DATAFINAL,'
      '       E.PERC1AC,         E.PERC2AC,'
      '       E.PERCATS,         E.PERCINSALUB,'
      '       E.PERCPERICUL,     E.PERCFUNCAO,'
      '       E.MODOFUNCAO,'
      '       E.ORIGEM,'
      '       E.FLGSITPART,'
      '       DECODE(E.ORIGEM, '#39'I'#39', '#39'Interface'#39','
      '                        '#39'C'#39', '#39'Cadastrado'#39','
      '                        '#39'E'#39', '#39'Evento de Manutenção'#39','
      '                        '#39'R'#39', '#39'Retroativo'#39') AS DESCORIGEM,'
      '       DECODE(E.MODOFUNCAO, '#39'EF'#39', '#39'EFETIVA'#39','
      '                            '#39'AS'#39', '#39'ASSEGURADA'#39','
      '                            '#39'ES'#39', '#39'EVENTUAL/SUBSTITUIÇÃO'#39','
      '                            '#39'DP'#39', '#39'DESIGNAÇÃO POR PRAZO'#39','
      
        '                            '#39'FA'#39', '#39'FACULTATIVA'#39', '#39'NÃO INFORMADO'#39 +
        ') AS DESCMODO,'
      '       DECODE(E.FLGSITPART,'#39'AS'#39', '#39'Assistido'#39','
      '                           '#39'AT'#39', '#39'Ativo'#39','
      '                                 '#39'Outros'#39') AS DESCSITCADASTRADA,'
      '       F.CODIGO,'
      '       F.TITULO AS FUNCAO,'
      '       GF.CODIGO GRUPO,'
      '       0  AS VALORADICCOMP'
      'FROM   CARGOEXT F, EVOLFUNCPREV E,'
      '       GRUPOCARGOEXT GCE, GRUPOFUNC GF'
      'WHERE  E.IDPESSJUR      = :IDPESSJUR'
      'AND    E.IDPESSOA       = :IDPESSOA'
      'AND    E.IDPESSJURFG    = F.IDPESSJUR(+)'
      'AND    E.IDFUNCAO       = F.IDCARGOEXT(+)'
      'AND    GCE.IDCARGOEXT(+)   = E.IDFUNCAO'
      'AND    GF.IDGRUPOFUNC(+)   = GCE.IDGRUPOFUNC'
      'AND    E.PERC1AC IS NOT NULL'
      'AND    E.PERC1AC > 0'
      'AND    E.IDPESSJURFG IS NOT NULL'
      'AND    E.IDFUNCAO IS NOT NULL'
      
        'AND GCE.DATAVIGENCIA = (SELECT MAX(G.DATAVIGENCIA) FROM GRUPOCAR' +
        'GOEXT G'
      
        '                        WHERE G.IDPESSJUR = E.IDPESSJUR AND G.ID' +
        'CARGOEXT = E.IDFUNCAO)'
      ''
      'ORDER BY E.DATAINICIO DESC'
      ''
      ''
      ''
      ''
      ''
      '')
    UpdateObject = updAdicConpens
    ControlType.Strings = (
      'FLGSITPART;CustomEdit;dbcSituacao')
    ValidateWithMask = True
    Left = 376
    Top = 13
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 76644
      end>
  end
  object qryAdicInsalub: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.IDPESSJUR,       E.IDPESSOA,       E.SEQHISTFUNC,'
      '       E.IDPESSJURCG,     E.IDCARGOEXT,'
      '       E.IDPESSJURFG,     E.IDFUNCAO,'
      '       E.DATAINICIO,      E.DATAFINAL,'
      '       E.PERC1AC,         E.PERC2AC,'
      '       E.PERCATS,         E.PERCINSALUB,'
      '       E.PERCPERICUL,     E.PERCFUNCAO,'
      '       E.MODOFUNCAO,'
      '       E.ORIGEM,'
      '       E.FLGSITPART,'
      '       DECODE(E.ORIGEM, '#39'I'#39', '#39'Interface'#39','
      '                        '#39'C'#39', '#39'Cadastrado'#39','
      '                        '#39'E'#39', '#39'Evento de Manutenção'#39','
      '                        '#39'R'#39', '#39'Retroativo'#39') AS DESCORIGEM,'
      '       DECODE(E.FLGSITPART,'#39'AS'#39', '#39'Assistido'#39','
      '                           '#39'AT'#39', '#39'Ativo'#39','
      '                                 '#39'Outros'#39') AS DESCSITCADASTRADA'
      ''
      'FROM   EVOLFUNCPREV E'
      'WHERE  E.IDPESSJUR      = :IDPESSJUR'
      'AND    E.IDPESSOA       = :IDPESSOA'
      'AND    PERCINSALUB IS NOT NULL'
      'AND    PERCINSALUB > 0'
      'ORDER BY E.DATAINICIO DESC'
      ''
      ''
      ''
      ''
      '')
    ControlType.Strings = (
      'FLGSITPART;CustomEdit;dbcSituacao')
    ValidateWithMask = True
    Left = 333
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 76644
      end>
  end
  object qryAdicPericul: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.IDPESSJUR,       E.IDPESSOA,       E.SEQHISTFUNC,'
      '       E.IDPESSJURCG,     E.IDCARGOEXT,'
      '       E.IDPESSJURFG,     E.IDFUNCAO,'
      '       E.DATAINICIO,      E.DATAFINAL,'
      '       E.PERC1AC,         E.PERC2AC,'
      '       E.PERCATS,         E.PERCINSALUB,'
      '       E.PERCPERICUL,     E.PERCFUNCAO,'
      '       E.MODOFUNCAO,'
      '       E.ORIGEM,'
      '       E.FLGSITPART,'
      '       DECODE(E.ORIGEM, '#39'I'#39', '#39'Interface'#39','
      '                        '#39'C'#39', '#39'Cadastrado'#39','
      '                        '#39'E'#39', '#39'Evento de Manutenção'#39','
      '                        '#39'R'#39', '#39'Retroativo'#39') AS DESCORIGEM,'
      '       DECODE(E.FLGSITPART,'#39'AS'#39', '#39'Assistido'#39','
      '                           '#39'AT'#39', '#39'Ativo'#39','
      '                                 '#39'Outros'#39') AS DESCSITCADASTRADA'
      'FROM   EVOLFUNCPREV E'
      'WHERE  E.IDPESSJUR      = :IDPESSJUR'
      'AND    E.IDPESSOA       = :IDPESSOA'
      'AND    PERCPERICUL IS NOT NULL'
      'AND    PERCPERICUL > 0'
      'ORDER BY E.DATAINICIO DESC'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGSITPART;CustomEdit;dbcSituacao')
    PictureMasks.Strings = (
      'FLGSITPART'#9'#,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 286
    Top = 22
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 76644
      end>
  end
  object qryCargoxNivel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT C.CODIGO AS CODCARGO, CN.IDCARGOEXT, CN.IDNIVEL,' +
        ' CN.IDPESSJUR, C.TITULO, N.CODIGO'
      'FROM   CARGOEXT C, NIVEL N, CARGOXNIVEL CN'
      'WHERE  C.IDPESSJUR   = :IDPESSJUR'
      'AND    CN.IDPESSJUR  = C.IDPESSJUR'
      'AND    CN.IDCARGOEXT = C.IDCARGOEXT'
      'AND    CN.IDPESSJUR  = N.IDPESSJUR'
      'AND    CN.IDNIVEL    = N.IDNIVEL'
      'ORDER BY C.CODIGO, C.TITULO, N.CODIGO')
    ValidateWithMask = True
    Left = 237
    Top = 13
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryModoCargo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'EF'#39' AS CODIGO, '#39'EFETIVO'#39' AS DESCRICAO'
      'FROM DUAL'
      'UNION'
      'SELECT '#39'BC'#39' AS CODIGO, '#39'BOLSA DE CARGO'#39' AS DESCRICAO'
      'FROM DUAL '
      ''
      ' ')
    ValidateWithMask = True
    Left = 26
    Top = 13
  end
  object qryFuncao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.IDPESSJUR,       E.IDPESSOA,       E.SEQHISTFUNC,'
      '       E.IDPESSJURCG,     E.IDCARGOEXT,'
      '       E.IDPESSJURFG,     E.IDFUNCAO,'
      '       E.DATAINICIO,      E.DATAFINAL,'
      '       E.PERC1AC,         E.PERC2AC,'
      '       E.PERCATS,         E.PERCINSALUB,'
      '       E.PERCPERICUL,     E.PERCFUNCAO,'
      '       E.MODOFUNCAO,'
      '       E.ORIGEM,'
      '       E.FLGSITPART,'
      '       DECODE(E.ORIGEM, '#39'I'#39', '#39'Interface'#39','
      '                        '#39'C'#39', '#39'Cadastrado'#39','
      '                        '#39'E'#39', '#39'Evento de Manutenção'#39','
      '                        '#39'R'#39', '#39'Retroativo'#39') AS DESCORIGEM,'
      '       DECODE(E.MODOFUNCAO, '#39'EF'#39', '#39'EFETIVA'#39','
      '                            '#39'AS'#39', '#39'ASSEGURADA'#39','
      '                            '#39'ES'#39', '#39'EVENTUAL/SUBSTITUIÇÃO'#39','
      '                            '#39'DP'#39', '#39'DESIGNAÇÃO POR PRAZO'#39','
      '                            '#39'FA'#39', '#39'FACULTATIVA'#39','
      '                            '#39'BF'#39', '#39' BOLSA DE FUNDO'#39','
      '                           '#39'ET'#39', '#39'ESTRATÉGICA'#39','
      '                           '#39'DJ'#39','#39'DECISÃO JUDICIAL'#39','
      '                            '#39'ET'#39', '#39'ESTRATÉGICA'#39','
      '                            '#39'NE'#39', '#39'NÃO EFETIVA'#39','
      '                             '#39'NÃO INFORMADO'#39') AS DESCMODO,'
      '       DECODE(E.FLGSITPART,'#39'AS'#39', '#39'Assistido'#39','
      '                           '#39'AT'#39', '#39'Ativo'#39','
      '                                 '#39'Outros'#39') AS DESCSITCADASTRADA,'
      ''
      '       F.CODIGO AS CODIGO,'
      '       GF.CODIGO GRUPO,'
      '       F.TITULO AS FUNCAO,'
      '       0 AS VALORFUNCAO'
      'FROM   CARGOEXT F, EVOLFUNCPREV E,'
      '       GRUPOCARGOEXT GCE, GRUPOFUNC GF,'
      '       PARTPREVPLAN PP, SITPART SIT'
      ''
      'WHERE  E.IDPESSJUR      = :IDPESSJUR'
      'AND    E.IDPESSOA       = :IDPESSOA'
      'AND    PP.IDPLANOPREV(+)= :IDPLANOPREV'
      'AND    E.IDPESSJURFG    = F.IDPESSJUR'
      'AND    E.IDFUNCAO       = F.IDCARGOEXT'
      'AND    GCE.IDCARGOEXT   = E.IDFUNCAO'
      'AND    GF.IDGRUPOFUNC   = GCE.IDGRUPOFUNC'
      'AND    PP.IDPESSOA(+)      = E.IDPESSOA'
      'AND    PP.IDPESSJUR(+)      = E.IDPESSJUR'
      'AND    SIT.IDSITPART(+)    = PP.IDSITPART'
      'AND    E.IDFUNCAO IS NOT NULL'
      'AND    E.PERC1AC  IS NULL'
      'ORDER BY E.DATAINICIO DESC'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    UpdateObject = updFuncao
    ControlType.Strings = (
      'FLGSITPART;CustomEdit;dbcSituacao')
    ValidateWithMask = True
    Left = 358
    Top = 55
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 76644
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryModoFuncao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT 1 AS ORDEM, '#39'EF'#39' AS CODIGO, '#39'EFETIVA'#39'                AS D' +
        'ESCRICAO FROM DUAL UNION'
      
        'SELECT 2 AS ORDEM, '#39'AS'#39' AS CODIGO, '#39'ASSEGURADA'#39'             AS D' +
        'ESCRICAO FROM DUAL UNION'
      
        'SELECT 3 AS ORDEM, '#39'ES'#39' AS CODIGO, '#39'EVENTUAL/SUBSTITUIÇÃO'#39'  AS D' +
        'ESCRICAO FROM DUAL UNION'
      
        'SELECT 4 AS ORDEM, '#39'DP'#39' AS CODIGO, '#39'DESIGNAÇÃO POR PRAZO'#39'   AS D' +
        'ESCRICAO FROM DUAL UNION'
      
        'SELECT 5 AS ORDEM, '#39'FA'#39' AS CODIGO, '#39'FACULTATIVA'#39'            AS D' +
        'ESCRICAO FROM DUAL UNION'
      
        'SELECT 6 AS ORDEM, '#39'BF'#39' AS CODIGO, '#39'BOLSA DE FUNÇÃO'#39'        AS D' +
        'ESCRICAO FROM DUAL UNION'
      
        'SELECT 7 AS ORDEM, '#39'ET'#39' AS CODIGO, '#39'ESTRATÉGICA'#39'            AS D' +
        'ESCRICAO FROM DUAL '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 90
    Top = 13
  end
  object qryRubSalarial: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.CODPROVDESC, H.FLGCOMPOEREMTOTAL, H.FLGCOMPOESALBENEF, ' +
        'H.FLGCOMPOESALPART,'
      
        '       H.FLGCONCESSAO, H.FLGIRRF, H.FLGPREVIA, H.FLGSALBENEFRETR' +
        'O, H.FLGSALPARTATUARIA,'
      
        '       H.FLGSALPARTRETRO, H.FLGSRB, H.IDMODULO, H.IDMOTIVO, H.ID' +
        'PATRO, H.IDPESSJUR,'
      
        '       H.IDPESSOA, H.IDREGRACALCULO, H.IDRUBRICA, H.MES, H.MESCO' +
        'BRANCA, H.REFERENCIA,'
      
        '       H.SEQRUBRICA, H.VALORPROVENTO, H.VALORNADIB, H.PERCENTUAL' +
        'NADIB, H.FLGEQUIPARACAO,'
      '       H.TIPOITEMPCS,'
      
        '       DECODE(H.IDMODULO, 16, '#39'AdmPREV'#39', 32, '#39'CCP'#39', 21, '#39'Folha d' +
        'e Pagamento CM'#39', '#39'Outros'#39') AS MODULO,'
      '       R.DESCRPROVDESC'
      'FROM   RUBRICAXPESS R, HISTRUBSAL H'
      'WHERE  H.IDPESSJUR = :IDPESSJUR'
      'AND    H.IDPESSOA  = :IDPESSOA'
      'AND    H.FLGEQUIPARACAO = 1'
      'AND    H.IDPESSJUR  = R.IDPESSOA'
      'AND    H.IDRUBRICA  = R.IDRUBRICA'
      'ORDER BY H.MES DESC, H.MESCOBRANCA DESC'
      ''
      ' ')
    PictureMasks.Strings = (
      'MES'#9'####/##'#9'T'#9'F')
    ValidateWithMask = True
    Left = 127
    Top = 13
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 76644
      end>
  end
  object qryVigenciaFuncao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT F.IDGRUPOFUNC, F.IDFAIXASALEXT, F.DATAEFETIVACAO, F.IDPES' +
        'SJUR'
      'FROM   FAIXAGRUPO F, GRUPOCARGOEXT GC'
      'WHERE  GC.IDPESSJUR   = :IDPESSJUR'
      'AND    GC.IDCARGOEXT  = :IDCARGOEXT'
      'AND    F.IDPESSJUR    = GC.IDPESSJUR'
      'AND    F.IDGRUPOFUNC  = GC.IDGRUPOFUNC'
      'AND    GC.DATAVIGENCIA <= :DATAINICIO'
      'AND    ( (GC.DATAFIM >= :DATAINICIO) OR (GC.DATAFIM IS NULL))'
      'AND    F.DATAEFETIVACAO <= :DATAINICIO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 164
    Top = 13
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARGOEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAINICIO'
        ParamType = ptUnknown
      end>
  end
  object qryAdicNoturno: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.IDPESSJUR,       E.IDPESSOA,       E.SEQHISTFUNC,'
      '       E.IDPESSJURCG,     E.IDCARGOEXT,'
      '       E.IDPESSJURFG,     E.IDFUNCAO,'
      '       E.DATAINICIO,      E.DATAFINAL,'
      '       E.PERC1AC,         E.PERC2AC,'
      '       E.PERCATS,         E.PERCINSALUB,'
      '       E.PERCPERICUL,     E.PERCFUNCAO,'
      '       E.PERCADNOT,       E.QTDEMINUTOS,'
      '       E.MODOFUNCAO,'
      '       E.ORIGEM,'
      '       E.FLGSITPART,'
      '       DECODE(E.ORIGEM, '#39'I'#39', '#39'Interface'#39','
      '                        '#39'C'#39', '#39'Cadastrado'#39','
      '                        '#39'E'#39', '#39'Evento de Manutenção'#39','
      '                        '#39'R'#39', '#39'Retroativo'#39') AS DESCORIGEM,'
      '       DECODE(E.FLGSITPART,'#39'AS'#39', '#39'Assistido'#39','
      '                           '#39'AT'#39', '#39'Ativo'#39','
      '                                 '#39'Outros'#39') AS DESCSITCADASTRADA'
      'FROM   EVOLFUNCPREV E'
      'WHERE  E.IDPESSJUR      = :IDPESSJUR'
      'AND    E.IDPESSOA       = :IDPESSOA'
      
        'AND    ( ( (PERCADNOT IS NOT NULL) AND      (PERCADNOT > 0) )  O' +
        'R'
      
        '         ( (QTDEMINUTOS  IS NOT NULL) AND    (QTDEMINUTOS  > 0) ' +
        ')'
      '       )'
      'ORDER BY E.DATAINICIO DESC '
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGSITPART;CustomEdit;dbcSituacao')
    ValidateWithMask = True
    Left = 199
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 76644
      end>
  end
  object dsRubSalarial: TwwDataSource
    AutoEdit = False
    DataSet = qryRubSalarial
    Left = 130
    Top = 12
  end
  object dsAdicPericul: TwwDataSource
    AutoEdit = False
    DataSet = qryAdicPericul
    Left = 289
    Top = 8
  end
  object dsAdicInsalub: TwwDataSource
    AutoEdit = False
    DataSet = qryAdicInsalub
    Left = 336
    Top = 11
  end
  object dsFuncao: TwwDataSource
    AutoEdit = False
    DataSet = qryFuncao
    Left = 361
    Top = 56
  end
  object dsAdicNoturno: TwwDataSource
    AutoEdit = False
    DataSet = qryAdicNoturno
    Left = 202
    Top = 15
  end
  object dsAdicCompens: TwwDataSource
    AutoEdit = False
    DataSet = qryAdicCompens
    Left = 371
    Top = 13
  end
  object dsATS: TwwDataSource
    AutoEdit = False
    DataSet = qryATS
    Left = 58
    Top = 52
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      ''
      '       E.IDPESSJUR,       E.IDPESSOA,'
      '       E.IDPESSJURCG,     E.IDCARGOEXT,'
      '       E.IDPESSJURFG,     E.IDFUNCAO,'
      '       E.DATAINICIO,      E.DATAFINAL,'
      '       E.PERC1AC,         E.PERC2AC,'
      '       E.PERCATS,         E.PERCINSALUB,'
      '       E.PERCPERICUL,     E.PERCFUNCAO,'
      '       E.MODOFUNCAO,'
      '       E.ORIGEM, CE.CODIGO,'
      '       DECODE(E.ORIGEM, '#39'I'#39', '#39'Interface'#39','
      '                        '#39'C'#39', '#39'Cadastrado'#39','
      '                        '#39'E'#39', '#39'Evento de Manutenção'#39','
      '                        '#39'R'#39', '#39'Retroativo'#39') AS DESCORIGEM,'
      '       DECODE(E.MODOFUNCAO, '#39'EF'#39', '#39'EFETIVO'#39','
      '                          '#39'BC'#39' , '#39'BOLSA DE CARGO'#39' ) AS DESCMODO,'
      '       DECODE(E.FLGSITPART,'#39'AS'#39', '#39'Assistido'#39','
      '                           '#39'AT'#39', '#39'Ativo'#39','
      '                                 '#39'Outros'#39') AS DESCSITCADASTRADA,'
      '       CE.TITULO AS CARGO,'
      '       E.FLGSITPART'
      'FROM EVOLFUNCPREV E, CARGOEXT CE, CARGOXNIVEL CN, NIVEL N'
      'WHERE E.IDPESSOA     = :IDPESSOA'
      '  AND E.IDPESSJUR    = :IDPESSJUR'
      '  AND CE.IDCARGOEXT  = E.IDCARGOEXT'
      '  AND CE.IDPESSJUR   = E.IDPESSJUR'
      '  AND CN.IDPESSJUR   = CE.IDPESSJUR'
      '  AND CN.IDCARGOEXT  = CE.IDCARGOEXT'
      '  AND N.IDNIVEL      = CN.IDNIVEL'
      '  AND N.IDPESSJUR    = CN.IDPESSJUR'
      '  AND CN.DATAVIGENCIA = (SELECT MAX(DATAVIGENCIA)'
      '                          FROM CARGOXNIVEL'
      '                          WHERE IDPESSJUR = CN.IDPESSJUR AND'
      '                                IDCARGOEXT = CN.IDCARGOEXT AND'
      '                                DATAFIM IS NULL)'
      'ORDER BY E.DATAINICIO DESC'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'CODIGO;CustomEdit;dbcSituacao'
      'FLGSITPART;CustomEdit;dbcSituacao')
    ValidateWithMask = True
    Left = 389
    Top = 106
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 76644
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    DataSet = qryDet
    Left = 127
    Top = 418
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT 1 TITULAR, EL.IDPESSOA, EL.IDPESSJUR, PP.IDPLANOPREV, PP.' +
        'SEQPROPOSTA, P.NOME, EL.MATRICULA,'
      '       PAT.NOME AS NOMEPATRO, PL.NOME AS NOMEPLANO,'
      
        '       PP.INSCRICAONUMERO, PF.VLRENQUADRAMENTO, SP.FLGINTERNO AS' +
        ' FLGSITPART,'
      '       DECODE(FLGINTERNO, '#39'AT'#39', '#39'Ativo'#39','
      '                          '#39'AE'#39', '#39'Ativo Especial'#39','
      '                          '#39'MA'#39', '#39'Mantido'#39','
      '                          '#39'MP'#39', '#39'Mantido Parcial'#39','
      '                          '#39'AS'#39', '#39'Assistido'#39','
      '                          '#39'MS'#39', '#39'Manutenção de Saldo de Conta'#39','
      '                          '#39'CA'#39', '#39'Cancelado'#39','
      '                          '#39'PE'#39', '#39'Pendente'#39') AS SITUACAO'
      'FROM   PESSOA P, PESSOA PAT, PESSOAFISICA PF,'
      '       PLANPREV PL, ELEGPATRO EL, PARTPREVPLAN PP, SITPART SP'
      'WHERE  EL.IDPESSJUR        = :IDPESSJUR'
      'AND    EL.IDPESSOA         = :IDPESSOA'
      'AND    PP.IDPESSJUR(+)     = EL.IDPESSJUR'
      'AND    PP.IDPESSOA(+)      = EL.IDPESSOA'
      'AND    PP.FLGDESATIVADO(+) = 0'
      'AND    P.IDPESSOA          = EL.IDPESSOA'
      'AND    PAT.IDPESSOA        = EL.IDPESSJUR'
      'AND    PF.IDPESSOA         = EL.IDPESSOA'
      'AND    PL.IDPLANOPREV(+)   = PP.IDPLANOPREV'
      'AND    PP.IDSITPART        = SP.IDSITPART'
      'UNION ALL'
      
        'SELECT 0 TITULAR,  DP.IDPESSOA, EL.IDPESSJUR, PP.IDPLANOPREV, PP' +
        '.SEQPROPOSTA, P.NOME, DP.MATRICULA,'
      '       PAT.NOME AS NOMEPATRO, PL.NOME AS NOMEPLANO,'
      
        '       PP.INSCRICAONUMERO, PF.VLRENQUADRAMENTO, '#39'PS'#39' AS FLGSITPA' +
        'RT,'
      '       '#39'Pensionista'#39' AS SITUACAO'
      'FROM   PESSOA P, PESSOA PAT, PESSOAFISICA PF,'
      '       PLANPREV PL, ELEGPATRO EL, PARTPREVPLAN PP, DEPENTIT DP'
      'WHERE  EL.IDPESSJUR        = :IDPESSJUR'
      'AND    EL.IDPESSOA         = PP.IDPESSOA'
      'AND    PP.IDPESSJUR(+)     = EL.IDPESSJUR'
      'AND    PP.IDPESSOA(+)      = EL.IDPESSOA'
      'AND    PP.FLGDESATIVADO(+) = 0'
      'AND    P.IDPESSOA          = DP.IDPESSOA'
      'AND    PAT.IDPESSOA        = EL.IDPESSJUR'
      'AND    PF.IDPESSOA         = DP.IDPESSOA'
      'AND    PL.IDPLANOPREV(+)   = PP.IDPLANOPREV'
      'AND    DP.IDTITULAR        = EL.IDPESSOA'
      'AND    DP.IDPESSOA         = :IDPESSOA'
      ' ')
    ValidateWithMask = True
    Left = 354
    Top = 114
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 3010
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 320
    Top = 114
  end
  object qryElegivel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPESSOA'
      'FROM ELEGIVEL'
      'WHERE IDPESSOA = :IDPESSOA')
    ValidateWithMask = True
    Left = 104
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
  end
  object qryRubricaIndiv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDFAVORECIDO,'
      '  IDALIMENTADO,'
      '  FLGPENSAOALIM'
      'FROM RUBRICAINDIV'
      'WHERE IDFAVORECIDO = :IDPESSOA'
      ''
      '  ')
    ValidateWithMask = True
    Left = 130
    Top = 64
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    object qryRubricaIndivIDFAVORECIDO: TFloatField
      FieldName = 'IDFAVORECIDO'
      Origin = 'BASEDADOS.RUBRICAINDIV.IDFAVORECIDO'
    end
    object qryRubricaIndivIDALIMENTADO: TFloatField
      FieldName = 'IDALIMENTADO'
      Origin = 'BASEDADOS.RUBRICAINDIV.IDALIMENTADO'
    end
    object qryRubricaIndivFLGPENSAOALIM: TFloatField
      FieldName = 'FLGPENSAOALIM'
      Origin = 'BASEDADOS.RUBRICAINDIV.FLGPENSAOALIM'
    end
  end
  object qryClassifica: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 251
    Top = 56
  end
  object qryRespNaoElegivel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       DP.MATRICULA,'
      '       P.NOME,'
      '       P.NUMDOCUMENTO,'
      '       PF.NOMEPAI,'
      '       PF.NOMEMAE,'
      '       PF.DATANASC,'
      
        '       DECODE(PF.SEXO,'#39'M'#39', '#39'Masculino'#39', '#39'F'#39', '#39'Feminino'#39') AS SEXO' +
        ','
      '       DECODE(PF.ESTCIVIL,'
      '        '#39'S'#39', '#39'Solteiro(a)'#39','
      '        '#39'C'#39', '#39'Casado(a) ou Equiparado(a)'#39','
      '        '#39'D'#39', '#39'Divorciado(a)'#39','
      '        '#39'E'#39', '#39'Desquitado(a)'#39','
      '        '#39'J'#39', '#39'Separado(a) Judicial'#39','
      '        '#39'V'#39', '#39'Viúvo(a)'#39','
      '        '#39'M'#39', '#39'Marital'#39','
      '        '#39'P'#39', '#39'Separado(a)'#39','
      '        '#39'O'#39', '#39'Outros'#39')  AS ESTADOCIVIL,'
      '       P.EMAIL,'
      '       '#39'  '#39' AS SALTOTAL,'
      '       '#39'  '#39' AS DATAADMISSAO,'
      '       '#39'  '#39' AS DATADEMISSAO,'
      '       '#39'  '#39' AS NIVEL,'
      '       '#39'  '#39' AS FLGDIRETOR,'
      ''
      '       '#39'  '#39' AS TIPOFLGDIRETOR,'
      ''
      '       '#39'  '#39' AS SITPART,'
      '       '#39'  '#39' AS NOMECARGO,'
      '       '#39'  '#39' AS FUNCAO,'
      '       '#39'  '#39' AS VINCULO,'
      '       PF.DATAMORTE,'
      '       '#39'  '#39' AS  FILIAL,'
      '       '#39'  '#39' AS NOMEVALORBASE1,'
      '       0  AS VALORBASE1,'
      '       '#39'  '#39' AS NOMEVALORBASE2,'
      '       '#39'  '#39' AS VALORBASE2,'
      '       '#39'  '#39' AS NOMEVALORBASE3,'
      '       '#39'  '#39' AS VALORBASE3,'
      
        '       DECODE (PF.FLGMOLESTIAGRAVE, 1, '#39'Sim'#39', '#39'Não'#39') AS FLGMOLES' +
        'TIAGRAVE,'
      '       PF.DATAMOLESTIAGRAVE, PF.DATAFIMMOLESTIA,'
      
        '       DECODE(PF.FLGISENTOIRRF, 1,'#39'Isento'#39','#39'Recolhe'#39') AS SITIRRF' +
        ','
      '       PF.FLGBLOQUEIO,'
      '       PA.NOMENACIONALIDADE,'
      '       PF.CODESTADO,'
      '       CID.NOME AS CIDADE,'
      '       PF.NUMDEPIRRF,'
      '       PF.NUMDEPSALF,'
      '       PF.NUMDEPTOT,'
      '       PF.TIPOSANG,'
      '       '#39'     '#39' AS SITPLANOPREV,'
      
        '       DECODE (PF.CORPESSOA, 2, '#39'Branca'#39', 4, '#39'Negra'#39', 6, '#39'Amarel' +
        'o'#39', 8, '#39'Parda'#39', 0, '#39'Indígena'#39' ) AS CORPESSOA,'
      
        '       DECODE (PF.FLGDEFICIENTE, 1, '#39'Sim'#39', '#39'Não'#39') AS FLGDEFICIEN' +
        'TE,'
      '       PF.INICIOINVALIDEZ,'
      '       PF.FIMINVALIDEZ,'
      '       GR.DESCRICAO AS GRAUINSTRUCAO,'
      '       IM.IMAGEM,'
      '       '#39'  '#39' AS SITUACAONAPATRO,'
      '       '#39'  '#39' AS PATRO,'
      '       0 AS IDPESSJUR,'
      '       0 AS IDPLANOPREV,'
      '       '#39'  '#39' AS PLANO,'
      '       '#39'  '#39' AS SEQPROPOSTA,'
      '       0 AS INSCRICAONUMERO,'
      '       '#39' '#39'  AS INSCRICAODATA,'
      '       0 AS IDRGELEGBENEF,'
      '       '#39' '#39' AS DATACANCELAMENTO,'
      '       '#39'RESPONSÁVEL NÃO ELEGÍVEL'#39' AS DESCRICAO'
      ',TO_DATE(NULL,'#39'DD/MM/YYYY'#39') AS DTNOMEACAO '
      ',TO_DATE(NULL,'#39'DD/MM/YYYY'#39') AS DTEXONERACAO,'
      
        '       DECODE(PF.FLGISENTOIRRF,0,'#39'Não'#39','#39'1'#39','#39'Sim'#39') AS FLGISENTOIR' +
        'RF , '
      
        '       DECODE(PF.FLGSOMAIRSUPINSS,0,'#39'Não'#39','#39'1'#39','#39'Sim'#39') AS FLGSOMAI' +
        'RSUPINSS'
      '       ,PF.EMAILFUNCEF      '
      '      --SIG 21868 -INICIO'
      '       , '#39'  '#39' AS TPDEFICIENCIA  '
      '       , '#39'  '#39' AS IDRESPONSAVEL'
      '       ,'#39'  '#39'  AS CODTIPORESPONSAVEL'
      '     --SIG 21868  -FIM'
      'FROM'
      '      PESSOA P,'
      '      PESSOAFISICA PF,'
      '      PAIS PA,'
      '      IMAGENS IM,'
      '      DEPENTIT DP,'
      '      RESPONSAVEL R,'
      '      BFCIARIOTITPLAN B,'
      '      GRINSTR GR,'
      '      CIDADES CID'
      'WHERE'
      '      (P.IDPESSOA      = :IDPESSOA)'
      'AND   (P.IDPESSOA      = P.IDPESSOA)'
      'AND   (R.IDRESPONSAVEL = P.IDPESSOA)'
      'AND   (B.IDRESPONSAVEL = R.IDRESPONSAVEL)'
      'AND   (DP.IDPESSOA(+)  = P.IDPESSOA)'
      'AND   (P.IDPESSOA      = PF.IDPESSOA)'
      'AND   (PA.IDPAIS(+)    = PF.IDPAIS)'
      'AND   (PF.IDCIDADES    = CID.IDCIDADES(+))'
      'AND   (P.IDIMAGEM      = IM.IDIMAGEM(+))'
      'AND   (PF.IDGRINSTR    = GR.IDGRINSTR(+))'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 179
    Top = 522
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    object qryRespNaoElegivelMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryRespNaoElegivelNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryRespNaoElegivelNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryRespNaoElegivelNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      Size = 50
    end
    object qryRespNaoElegivelNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      Size = 50
    end
    object qryRespNaoElegivelDATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
    object qryRespNaoElegivelSEXO: TStringField
      FieldName = 'SEXO'
      Size = 9
    end
    object qryRespNaoElegivelESTADOCIVIL: TStringField
      FieldName = 'ESTADOCIVIL'
      Size = 26
    end
    object qryRespNaoElegivelEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object qryRespNaoElegivelSALTOTAL: TStringField
      FieldName = 'SALTOTAL'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelDATAADMISSAO: TStringField
      FieldName = 'DATAADMISSAO'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelDATADEMISSAO: TStringField
      FieldName = 'DATADEMISSAO'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelNIVEL: TStringField
      FieldName = 'NIVEL'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelSITPART: TStringField
      FieldName = 'SITPART'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelFUNCAO: TStringField
      FieldName = 'FUNCAO'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelNOMECARGO: TStringField
      FieldName = 'NOMECARGO'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelVINCULO: TStringField
      FieldName = 'VINCULO'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelDATAMORTE: TDateTimeField
      FieldName = 'DATAMORTE'
    end
    object qryRespNaoElegivelFILIAL: TStringField
      FieldName = 'FILIAL'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelNOMEVALORBASE1: TStringField
      FieldName = 'NOMEVALORBASE1'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
    end
    object qryRespNaoElegivelNOMEVALORBASE2: TStringField
      FieldName = 'NOMEVALORBASE2'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelVALORBASE2: TStringField
      FieldName = 'VALORBASE2'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelNOMEVALORBASE3: TStringField
      FieldName = 'NOMEVALORBASE3'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelVALORBASE3: TStringField
      FieldName = 'VALORBASE3'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelFLGMOLESTIAGRAVE: TStringField
      FieldName = 'FLGMOLESTIAGRAVE'
      Size = 3
    end
    object qryRespNaoElegivelDATAMOLESTIAGRAVE: TDateTimeField
      FieldName = 'DATAMOLESTIAGRAVE'
    end
    object qryRespNaoElegivelSITIRRF: TStringField
      FieldName = 'SITIRRF'
      Size = 7
    end
    object qryRespNaoElegivelFLGBLOQUEIO: TFloatField
      FieldName = 'FLGBLOQUEIO'
    end
    object qryRespNaoElegivelNOMENACIONALIDADE: TStringField
      FieldName = 'NOMENACIONALIDADE'
      Size = 30
    end
    object qryRespNaoElegivelCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryRespNaoElegivelNUMDEPIRRF: TFloatField
      FieldName = 'NUMDEPIRRF'
    end
    object qryRespNaoElegivelNUMDEPSALF: TFloatField
      FieldName = 'NUMDEPSALF'
    end
    object qryRespNaoElegivelNUMDEPTOT: TFloatField
      FieldName = 'NUMDEPTOT'
    end
    object qryRespNaoElegivelTIPOSANG: TStringField
      FieldName = 'TIPOSANG'
      Size = 3
    end
    object qryRespNaoElegivelSITPLANOPREV: TStringField
      FieldName = 'SITPLANOPREV'
      FixedChar = True
      Size = 5
    end
    object qryRespNaoElegivelCORPESSOA: TStringField
      FieldName = 'CORPESSOA'
      Size = 8
    end
    object qryRespNaoElegivelFLGDEFICIENTE: TStringField
      FieldName = 'FLGDEFICIENTE'
      Size = 3
    end
    object qryRespNaoElegivelINICIOINVALIDEZ: TDateTimeField
      FieldName = 'INICIOINVALIDEZ'
    end
    object qryRespNaoElegivelFIMINVALIDEZ: TDateTimeField
      FieldName = 'FIMINVALIDEZ'
    end
    object qryRespNaoElegivelGRAUINSTRUCAO: TStringField
      FieldName = 'GRAUINSTRUCAO'
      Size = 30
    end
    object qryRespNaoElegivelIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryRespNaoElegivelSITUACAONAPATRO: TStringField
      FieldName = 'SITUACAONAPATRO'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelPATRO: TStringField
      FieldName = 'PATRO'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryRespNaoElegivelIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryRespNaoElegivelPLANO: TStringField
      FieldName = 'PLANO'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelSEQPROPOSTA: TStringField
      FieldName = 'SEQPROPOSTA'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryRespNaoElegivelINSCRICAODATA: TStringField
      FieldName = 'INSCRICAODATA'
      FixedChar = True
      Size = 1
    end
    object qryRespNaoElegivelIDRGELEGBENEF: TFloatField
      FieldName = 'IDRGELEGBENEF'
    end
    object qryRespNaoElegivelFLGDIRETOR: TStringField
      FieldName = 'FLGDIRETOR'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryRespNaoElegivelDATACANCELAMENTO: TStringField
      FieldName = 'DATACANCELAMENTO'
      FixedChar = True
      Size = 1
    end
    object qryRespNaoElegivelDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 11
    end
    object qryRespNaoElegivelTIPOFLGDIRETOR: TStringField
      FieldName = 'TIPOFLGDIRETOR'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelDTNOMEACAO: TDateField
      FieldKind = fkCalculated
      FieldName = 'DTNOMEACAO'
      Calculated = True
    end
    object qryRespNaoElegivelDTEXONERACAO: TDateField
      FieldName = 'DTEXONERACAO'
    end
    object qryRespNaoElegivelFLGISENTOIRRF: TStringField
      FieldName = 'FLGISENTOIRRF'
      Size = 3
    end
    object qryRespNaoElegivelFLGSOMAIRSUPINSS: TStringField
      FieldName = 'FLGSOMAIRSUPINSS'
      Size = 3
    end
    object dtmfldRespNaoElegivelDATAFIMMOLESTIA: TDateTimeField
      FieldName = 'DATAFIMMOLESTIA'
    end
    object qryRespNaoElegivelEMAILFUNCEF: TStringField
      FieldName = 'EMAILFUNCEF'
      Size = 100
    end
    object qryRespNaoElegivelTPDEFICIENCIA: TStringField
      FieldName = 'TPDEFICIENCIA'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelIDRESPONSAVEL: TStringField
      FieldName = 'IDRESPONSAVEL'
      FixedChar = True
      Size = 2
    end
    object qryRespNaoElegivelCODTIPORESPONSAVEL: TStringField
      FieldName = 'CODTIPORESPONSAVEL'
      FixedChar = True
      Size = 2
    end
  end
  object qryDependente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       DP.MATRICULA,'
      '       P.NOME,'
      '       P.NUMDOCUMENTO,'
      '       PF.NOMEPAI,'
      '       PF.NOMEMAE,'
      '       PF.DATANASC,'
      '       DECODE(PF.SEXO,'#39'M'#39', '#39'Masculino'#39','#39'F'#39','#39'Feminino'#39') AS SEXO,'
      '       DECODE(PF.ESTCIVIL,'
      '        '#39'S'#39', '#39'Solteiro(a)'#39','
      '        '#39'C'#39', '#39'Casado(a) ou Equiparado(a)'#39','
      '        '#39'D'#39', '#39'Divorciado(a)'#39','
      '        '#39'E'#39', '#39'Desquitado(a)'#39','
      '        '#39'J'#39', '#39'Separado(a) Judicial'#39','
      '        '#39'V'#39', '#39'Viúvo(a)'#39','
      '        '#39'M'#39', '#39'Marital'#39','
      '        '#39'P'#39', '#39'Separado(a)'#39','
      '        '#39'O'#39', '#39'Outros'#39')  AS ESTADOCIVIL,'
      '       P.EMAIL,'
      '       '#39'  '#39' AS SALTOTAL,'
      '       '#39'  '#39' AS DATAADMISSAO,'
      '       '#39'  '#39' AS DATADEMISSAO,'
      '       '#39'  '#39' AS NIVEL,'
      '       '#39'  '#39' AS FLGDIRETOR,'
      ''
      '       '#39'  '#39' AS TIPOFLGDIRETOR,'
      ''
      '       '#39'  '#39' AS SITPART,'
      '       '#39'  '#39' AS NOMECARGO,'
      '       '#39'  '#39' AS FUNCAO,'
      '       '#39'  '#39' AS VINCULO,'
      '       PF.DATAMORTE,'
      '       '#39'  '#39' AS  FILIAL,'
      '       '#39'  '#39' AS LOTACAOFISICA,'
      '       '#39'  '#39' AS NOMEVALORBASE1,'
      '       0  AS VALORBASE1,'
      '       '#39'  '#39' AS NOMEVALORBASE2,'
      '       '#39'  '#39' AS VALORBASE2,'
      '       '#39'  '#39' AS NOMEVALORBASE3,'
      '       '#39'  '#39' AS VALORBASE3,'
      
        '       DECODE (PF.FLGMOLESTIAGRAVE, 1, '#39'Sim'#39', '#39'Não'#39') AS FLGMOLES' +
        'TIAGRAVE,'
      '       PF.DATAMOLESTIAGRAVE, PF.DATAFIMMOLESTIA,'
      
        '       DECODE(PF.FLGISENTOIRRF, 1,'#39'Isento'#39','#39'Recolhe'#39') AS SITIRRF' +
        ','
      '       PF.FLGBLOQUEIO,'
      '       PA.NOMENACIONALIDADE,'
      '       PF.CODESTADO,'
      '       CID.NOME AS CIDADE,'
      '       PF.NUMDEPIRRF,'
      '       PF.NUMDEPSALF,'
      '       PF.NUMDEPTOT,'
      '       PF.TIPOSANG,'
      '       '#39'     '#39' AS SITPLANOPREV,'
      
        '       DECODE (PF.CORPESSOA, 2, '#39'Branca'#39', 4, '#39'Negra'#39', 6, '#39'Amarel' +
        'o'#39', 8, '#39'Parda'#39', 0, '#39'Indígena'#39' ) AS CORPESSOA,'
      
        '       DECODE (PF.FLGDEFICIENTE, 1, '#39'Sim'#39', '#39'Não'#39') AS FLGDEFICIEN' +
        'TE,'
      '       PF.INICIOINVALIDEZ,'
      '       PF.FIMINVALIDEZ,'
      '       GR.DESCRICAO AS GRAUINSTRUCAO,'
      '       IM.IMAGEM,'
      '       '#39'  '#39' AS SITUACAONAPATRO,'
      '       pt.nome AS PATRO,'
      '       ppp.IDPESSJUR,'
      '       ppp.IDPLANOPREV,'
      '       pp.nome AS PLANO,'
      '       ppp.SEQPROPOSTA,'
      '       ppp.INSCRICAONUMERO,'
      '       ppp.INSCRICAODATA,'
      '       0 as IDRGELEGBENEF,'
      '       ppp.DATACANCELAMENTO,'
      '       NVL(DN.DESCRICAO, '#39'PRÓPRIO'#39') AS DESCRICAO'
      '      ,TO_DATE(NULL,'#39'DD/MM/YYYY'#39') AS DTNOMEACAO'
      '       ,TO_DATE(NULL,'#39'DD/MM/YYYY'#39') AS DTEXONERACAO,'
      
        '       DECODE(PF.FLGISENTOIRRF,0,'#39'Não'#39','#39'1'#39','#39'Sim'#39') AS FLGISENTOIR' +
        'RF ,'
      
        '       DECODE(PF.FLGSOMAIRSUPINSS,0,'#39'Não'#39','#39'1'#39','#39'Sim'#39') AS FLGSOMAI' +
        'RSUPINSS'
      '       , PF.EMAILFUNCEF,'
      '       DP.Trgdtinclusao AS Trgdtinclusao ,'
      '      --SIG 21868 -INICIO'
      '       -- DP.Trguserinclusao,'
      
        '       (SELECT NOMEUSUARIO FROM USUARIOSISTEMA US WHERE  US.IDUS' +
        'UARIO= regexp_substr(DP.TRGUSERINCLUSAO, '#39'[[:digit:]]+'#39'))AS Trgu' +
        'serinclusao,'
      
        '       (SELECT NOME FROM PESSOA WHERE IDPESSOA = HR.IDRESPONSAVE' +
        'L) AS IDRESPONSAVEL,'
      '       TR.DESCRICAO AS CODTIPORESPONSAVEL,'
      '       '#39'  '#39' AS TPDEFICIENCIA  ,'
      '       --SIG 21868 -FIM'
      '       LG.Trgdtalteracao AS Trgdtalteracao,'
      ''
      '       --SIG97640 Inicio'
      '       --PLN.DATACANCEL AS DATACANCEL,'
      '       (SELECT DATACANCEL FROM PLANODEPENDENTE'
      '        WHERE IDPESSOA = P.IDPESSOA'
      '          AND IDPLANOPREV = PPP.IDPLANOPREV'
      '          AND ROWNUM = 1) AS DATACANCEL,'
      '       --SIG97640 Fim'
      ''
      '       DD.Idsitdependente AS Idsitdependente ,'
      '       DECODE(TRIM(DD.IDSITDEPENDENTE),'#39'0'#39','#39'Normal'#39','
      '                                       '#39'1'#39','#39'Normal'#39','
      '                                       '#39'NULL'#39','#39'Normal'#39','
      '                                       '#39'120'#39','#39'Inválido'#39','
      
        '                                       '#39'2'#39','#39'Decisão Judicial'#39') A' +
        'S SITUACAO,'
      '      DP.DATACANCELA,'
      
        '      DECODE (DP.FLGCONTAIMPOSTOR, 1, '#39'Sim'#39', '#39'Não'#39') AS FLGCONTAI' +
        'MPOSTOR'
      'FROM'
      '      PESSOA P,'
      '      PESSOAFISICA PF,'
      '      PAIS PA,'
      '      IMAGENS IM,'
      '      DEPENTIT DP,'
      '      GRINSTR GR,'
      '      CIDADES CID,'
      '      partprevplan ppp,'
      '      pessoa pt,'
      '      planprev pp,'
      '      DEPEN DN,'
      '      --PLANODEPENDENTE PLN, --SIG97640'
      '      DEPENDENTE DD'
      '     ,HSTREPRLEGAL HR --SIG 21868'
      '     ,TIPORECEBEDOR TR --SIG 21868'
      '     , (SELECT IDPESSOA, MAX(TRGDTINCLUSAO) AS Trgdtalteracao'
      '          FROM LOGALTDEPENDENTES'
      '         GROUP BY IDPESSOA) LG'
      ''
      'WHERE'
      '      (P.IDPESSOA     = :idpessoa)'
      'AND   (DP.IDPESSOA    = :idpessoa)'
      'AND (HR.IDPESSOA(+) = P.IDPESSOA) --SIG 21868'
      'AND TR.CODTIPORECEBEDOR(+) = HR.CODTIPORESPONSAVEL --SIG 21868'
      'AND   (DP.IDDEPENDENCIA <> '#39'PRP'#39')'
      'AND   (P.IDPESSOA      = PF.IDPESSOA)'
      'AND   (DP.IDTITULAR    = DP.IDTITULAR)'
      'AND   (DP.IDPESSOA     = DP.IDPESSOA)'
      'AND   (PA.IDPAIS(+)    = PF.IDPAIS)'
      'AND   (PF.IDCIDADES    = CID.IDCIDADES(+))'
      'AND   (P.IDIMAGEM      = IM.IDIMAGEM(+))'
      'AND   (PF.IDGRINSTR    = GR.IDGRINSTR(+))'
      'and   (ppp.idpessoa     = dp.idtitular)'
      'and   (ppp.idpessjur    = pt.idpessoa)'
      'and   (ppp.idplanoprev  = pp.idplanoprev)'
      'AND   (DP.IDDEPENDENCIA = DN.IDDEPENDENCIA(+))'
      'AND (DD.Idpessoa (+) = P.IDPESSOA)'
      '--AND (PLN.IDPESSOA(+) = P.IDPESSOA) --SIG97640'
      'AND (LG.IDPESSOA(+) = DP.IDPESSOA)'
      
        '--AND (PLN.IDPLANOPREV = PPP.idplanoprev(+)) --SIG21868 --SIG973' +
        '68 --SIG97640'
      ''
      '')
    ValidateWithMask = True
    Left = 84
    Top = 495
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptInput
      end>
    object qryDependenteMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryDependenteNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryDependenteNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryDependenteNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      Size = 50
    end
    object qryDependenteNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      Size = 50
    end
    object qryDependenteDATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
    object qryDependenteSEXO: TStringField
      FieldName = 'SEXO'
      Size = 9
    end
    object qryDependenteESTADOCIVIL: TStringField
      FieldName = 'ESTADOCIVIL'
      Size = 26
    end
    object qryDependenteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object qryDependenteSALTOTAL: TStringField
      FieldName = 'SALTOTAL'
      FixedChar = True
      Size = 2
    end
    object qryDependenteDATAADMISSAO: TStringField
      FieldName = 'DATAADMISSAO'
      FixedChar = True
      Size = 2
    end
    object qryDependenteDATADEMISSAO: TStringField
      FieldName = 'DATADEMISSAO'
      FixedChar = True
      Size = 2
    end
    object qryDependenteNIVEL: TStringField
      FieldName = 'NIVEL'
      FixedChar = True
      Size = 2
    end
    object qryDependenteFLGDIRETOR: TStringField
      FieldName = 'FLGDIRETOR'
      FixedChar = True
      Size = 2
    end
    object qryDependenteTIPOFLGDIRETOR: TStringField
      FieldName = 'TIPOFLGDIRETOR'
      FixedChar = True
      Size = 2
    end
    object qryDependenteSITPART: TStringField
      FieldName = 'SITPART'
      FixedChar = True
      Size = 2
    end
    object qryDependenteNOMECARGO: TStringField
      FieldName = 'NOMECARGO'
      FixedChar = True
      Size = 2
    end
    object qryDependenteFUNCAO: TStringField
      FieldName = 'FUNCAO'
      FixedChar = True
      Size = 2
    end
    object qryDependenteVINCULO: TStringField
      FieldName = 'VINCULO'
      FixedChar = True
      Size = 2
    end
    object qryDependenteDATAMORTE: TDateTimeField
      FieldName = 'DATAMORTE'
    end
    object qryDependenteFILIAL: TStringField
      FieldName = 'FILIAL'
      FixedChar = True
      Size = 2
    end
    object qryDependenteLOTACAOFISICA: TStringField
      FieldName = 'LOTACAOFISICA'
      FixedChar = True
      Size = 2
    end
    object qryDependenteNOMEVALORBASE1: TStringField
      FieldName = 'NOMEVALORBASE1'
      FixedChar = True
      Size = 2
    end
    object qryDependenteVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
    end
    object qryDependenteNOMEVALORBASE2: TStringField
      FieldName = 'NOMEVALORBASE2'
      FixedChar = True
      Size = 2
    end
    object qryDependenteVALORBASE2: TStringField
      FieldName = 'VALORBASE2'
      FixedChar = True
      Size = 2
    end
    object qryDependenteNOMEVALORBASE3: TStringField
      FieldName = 'NOMEVALORBASE3'
      FixedChar = True
      Size = 2
    end
    object qryDependenteVALORBASE3: TStringField
      FieldName = 'VALORBASE3'
      FixedChar = True
      Size = 2
    end
    object qryDependenteFLGMOLESTIAGRAVE: TStringField
      FieldName = 'FLGMOLESTIAGRAVE'
      Size = 3
    end
    object qryDependenteDATAMOLESTIAGRAVE: TDateTimeField
      FieldName = 'DATAMOLESTIAGRAVE'
    end
    object qryDependenteDATAFIMMOLESTIA: TDateTimeField
      FieldName = 'DATAFIMMOLESTIA'
    end
    object qryDependenteSITIRRF: TStringField
      FieldName = 'SITIRRF'
      Size = 7
    end
    object qryDependenteFLGBLOQUEIO: TFloatField
      FieldName = 'FLGBLOQUEIO'
    end
    object qryDependenteNOMENACIONALIDADE: TStringField
      FieldName = 'NOMENACIONALIDADE'
      Size = 30
    end
    object qryDependenteCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryDependenteCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryDependenteNUMDEPIRRF: TFloatField
      FieldName = 'NUMDEPIRRF'
    end
    object qryDependenteNUMDEPSALF: TFloatField
      FieldName = 'NUMDEPSALF'
    end
    object qryDependenteNUMDEPTOT: TFloatField
      FieldName = 'NUMDEPTOT'
    end
    object qryDependenteTIPOSANG: TStringField
      FieldName = 'TIPOSANG'
      Size = 3
    end
    object qryDependenteSITPLANOPREV: TStringField
      FieldName = 'SITPLANOPREV'
      FixedChar = True
      Size = 5
    end
    object qryDependenteCORPESSOA: TStringField
      FieldName = 'CORPESSOA'
      Size = 8
    end
    object qryDependenteFLGDEFICIENTE: TStringField
      FieldName = 'FLGDEFICIENTE'
      Size = 3
    end
    object qryDependenteINICIOINVALIDEZ: TDateTimeField
      FieldName = 'INICIOINVALIDEZ'
    end
    object qryDependenteFIMINVALIDEZ: TDateTimeField
      FieldName = 'FIMINVALIDEZ'
    end
    object qryDependenteGRAUINSTRUCAO: TStringField
      FieldName = 'GRAUINSTRUCAO'
      Size = 30
    end
    object qryDependenteIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryDependenteSITUACAONAPATRO: TStringField
      FieldName = 'SITUACAONAPATRO'
      FixedChar = True
      Size = 2
    end
    object qryDependentePATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryDependenteIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryDependenteIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryDependentePLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object qryDependenteSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qryDependenteINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryDependenteINSCRICAODATA: TDateTimeField
      FieldName = 'INSCRICAODATA'
    end
    object qryDependenteIDRGELEGBENEF: TFloatField
      FieldName = 'IDRGELEGBENEF'
    end
    object qryDependenteDATACANCELAMENTO: TDateTimeField
      FieldName = 'DATACANCELAMENTO'
    end
    object qryDependenteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object qryDependenteDTNOMEACAO: TDateTimeField
      FieldName = 'DTNOMEACAO'
    end
    object qryDependenteDTEXONERACAO: TDateTimeField
      FieldName = 'DTEXONERACAO'
    end
    object qryDependenteFLGISENTOIRRF: TStringField
      FieldName = 'FLGISENTOIRRF'
      Size = 3
    end
    object qryDependenteFLGSOMAIRSUPINSS: TStringField
      FieldName = 'FLGSOMAIRSUPINSS'
      Size = 3
    end
    object qryDependenteEMAILFUNCEF: TStringField
      FieldName = 'EMAILFUNCEF'
      Size = 100
    end
    object qryDependenteTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object qryDependenteTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object qryDependenteTRGDTALTERACAO: TDateTimeField
      FieldName = 'TRGDTALTERACAO'
    end
    object qryDependenteDATACANCEL: TDateTimeField
      FieldName = 'DATACANCEL'
    end
    object qryDependenteIDSITDEPENDENTE: TStringField
      FieldName = 'IDSITDEPENDENTE'
      FixedChar = True
      Size = 4
    end
    object qryDependenteSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 16
    end
    object qryDependenteDATACANCELA: TDateTimeField
      FieldName = 'DATACANCELA'
    end
    object qryDependenteFLGCONTAIMPOSTOR: TStringField
      FieldName = 'FLGCONTAIMPOSTOR'
      Size = 3
    end
    object qryDependenteTPDEFICIENCIA: TStringField
      FieldName = 'TPDEFICIENCIA'
      FixedChar = True
      Size = 1
    end
    object qryDependenteIDRESPONSAVEL: TStringField
      FieldName = 'IDRESPONSAVEL'
      Size = 60
    end
    object qryDependenteCODTIPORESPONSAVEL: TStringField
      FieldName = 'CODTIPORESPONSAVEL'
      Size = 5
    end
  end
  object qryPlanos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'TITULAR'#39' TESTE,'
      '       PA.IDPLANOPREV, '
      '       TO_CHAR(PA.SEQPROPOSTA) SEQPROPOSTA, '
      '       TO_CHAR(PA.IDPESSJUR) IDPESSJUR, '
      '       PL.NOME, '
      
        '       DECODE (PA.FLGDESATIVADO, 1, '#39'DESATIVADO'#39', 0, '#39'ATIVO'#39', NU' +
        'LL, '#39'ATIVO'#39') AS STATUS, '
      '       TO_CHAR(SIT.DESCRICAO) AS SIT, '
      '       PL.IDRGELEGBENEF, '
      '       TO_CHAR(SITPP.DESCRICAO) AS SITPLANO, '
      '       PA.INSCRICAODATA, '
      '       PA.INSCRICAONUMERO, '
      '       PA.DATACANCELAMENTO, '
      '       TO_CHAR(EVENT.DATAMIGRACAO) DATAMIGRACAO,'
      '       PA.FLGDESATIVADO'
      'FROM PARTPREVPLAN PA, '
      '     PLANPREV PL, '
      '     SITPART SIT, '
      '     SITPLANOPREV SITPP, '
      '    (SELECT EP.IDPESSOA,'
      '            EP.IDPLANOPREV,'
      '            EP.IDPESSJUR, '
      
        '            TO_CHAR(EP.DATAEVENTO, '#39'DD/MM/YYYY'#39') AS DATAMIGRACAO' +
        ','
      '            PP.FLGDESATIVADO'
      '     FROM EVENTOGERADOR EG,'
      '          EVENTOSPREV EP,'
      '          PARTPREVPLAN PP '
      '     WHERE EG.IDEVENTOGERADOR = EP.IDEVENTOGERADOR'
      '           AND EG.FLGINTERNO = '#39'TP'#39
      '           AND PP.IDPESSOA = :IDPESSOA '
      '           AND PP.IDPESSOA = EP.IDPESSOA'
      '           AND PP.IDPLANOPREV = EP.IDPLANOPREV'
      '           AND PP.IDPESSJUR = EP.IDPESSJUR) EVENT,'
      '     ELEGPATRO EL '
      ''
      'WHERE (EL.IDPESSOA = :IDPESSOA ) '
      '      AND (EL.IDPESSOA = PA.IDPESSOA(+)) '
      '      AND (EL.IDPESSJUR = PA.IDPESSJUR(+)) '
      '      AND (PL.IDPLANOPREV = PA.IDPLANOPREV) '
      '      AND (PA.IDSITPART = SIT.IDSITPART(+)) '
      '      --AND (PA.IDPESSJUR = NULL)'
      '      AND (PA.IDSITPLANOPREV = SITPP.IDSITPLANOPREV) '
      '      AND (EVENT.IDPESSOA(+) = PA.IDPESSOA) '
      '      AND (EVENT.IDPLANOPREV(+) = PA.IDPLANOPREV) '
      '      AND (PA.DATACANCELAMENTO = EVENT.DATAMIGRACAO(+)) '
      ''
      '--------------------------------------------------------'
      ''
      'UNION'
      ''
      'SELECT DISTINCT '#39'BENEFICIÁRIO'#39' TESTE,'
      '       BF.IDPLANOPREV,'
      '       '#39#39' SEQPROPOSTA,'
      '       '#39#39' IDPESSJUR,'
      '       PP.NOME AS PLANOPREV,'
      
        '       DECODE (PPP.FLGDESATIVADO, 1, '#39'DESATIVADO'#39', 0, '#39'ATIVO'#39', N' +
        'ULL, '#39'ATIVO'#39') AS STATUS,'
      '       '#39#39' SIT,'
      
        '       --(SELECT BN.NOME FROM BENEFICIO BN WHERE BN.IDBENEFICIO ' +
        '= BF.IDBENEFICIO) SIT,'
      '       PP.IDRGELEGBENEF,'
      '       '#39#39' SITPLANO,'
      '       NULL AS INSCRICAODATA,'
      '       PPP.INSCRICAONUMERO,'
      '       NULL AS DATACANCELAMENTO,'
      '       '#39#39' DATAMIGRACAO,'
      '       0 AS FLGDESATIVADO'
      'FROM BENEFBFCIARIO BF,'
      '     PLANPREV PP, '
      '     PARTPREVPLAN PPP,'
      '    (SELECT M1.IDPESSOA,'
      '            M1.IDTITULAR, '
      '            M1.IDPLANOPREV, '
      '            M1.IDPESSJUR, '
      '            M1.DATAMOV AS DATACANCELAMENTO '
      '     FROM MOVBENEF M1 '
      '     WHERE M1.IDPESSOA IN (SELECT M2.IDPESSOA '
      '                           FROM MOVBENEF M2 '
      '                           WHERE TIPOMOV = 7 '
      '                                 AND M2.DATAMOV = M1.DATAMOV '
      '                                 AND M2.IDPESSOA = M1.IDPESSOA)'
      '           AND M1.TIPOMOV = 4'
      '           AND IDTITULAR <> IDPESSOA) MB,'
      '    (SELECT M1.IDPESSOA,'
      '           M1.IDTITULAR,'
      '            M1.IDPLANOPREV,'
      '            M1.IDPESSJUR,'
      '            M1.DATAMOV AS DATAINSCRICAO '
      '     FROM MOVBENEF M1 '
      '     WHERE M1.TIPOMOV = 7 '
      '           AND IDTITULAR <> IDPESSOA) MBC'
      '    '
      'WHERE BF.IDPESSOA = :IDPESSOA '
      '      AND BF.IDTITULAR <> BF.IDPESSOA'
      '      AND PP.IDPLANOPREV = BF.IDPLANOPREV'
      '      AND BF.IDTITULAR = PPP.IDPESSOA(+)      '
      '      AND BF.IDPLANOPREV = PPP.IDPLANOPREV(+)   '
      '      AND BF.IDPESSJUR = PPP.IDPESSJUR(+)     '
      '      AND BF.SEQPROPOSTA = PPP.SEQPROPOSTA(+)   '
      '      AND BF.IDPESSOA = MB.IDPESSOA(+)    '
      '      AND BF.IDTITULAR = MB.IDTITULAR(+)   '
      '      AND BF.IDPESSJUR = MB.IDPESSJUR(+)   '
      '      AND BF.IDPLANOPREV = MB.IDPLANOPREV(+) '
      '      AND BF.IDPESSOA = MBC.IDPESSOA(+)   '
      '      AND BF.IDTITULAR = MBC.IDTITULAR(+)  '
      '      AND BF.IDPESSJUR = MBC.IDPESSJUR(+)  '
      '      AND BF.IDPLANOPREV = MBC.IDPLANOPREV(+)'
      'ORDER BY FLGDESATIVADO')
    ValidateWithMask = True
    Left = 528
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
  end
  object qryRecebedorPensaoAlim: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       DP.MATRICULA,'
      '       P.NOME,'
      '       P.NUMDOCUMENTO,'
      '       PF.NOMEPAI,'
      '       PF.NOMEMAE,'
      '       PF.DATANASC,'
      '       DECODE(PF.SEXO,'#39'M'#39', '#39'Masculino'#39','#39'F'#39','#39'Feminino'#39') AS SEXO,'
      '       DECODE(PF.ESTCIVIL,'
      '        '#39'S'#39', '#39'Solteiro(a)'#39','
      '        '#39'C'#39', '#39'Casado(a) ou Equiparado(a)'#39','
      '        '#39'D'#39', '#39'Divorciado(a)'#39','
      '        '#39'E'#39', '#39'Desquitado(a)'#39','
      '        '#39'J'#39', '#39'Separado(a) Judicial'#39','
      '        '#39'V'#39', '#39'Viúvo(a)'#39','
      '        '#39'M'#39', '#39'Marital'#39','
      '        '#39'P'#39', '#39'Separado(a)'#39','
      '        '#39'O'#39', '#39'Outros'#39')  AS ESTADOCIVIL,'
      '       P.EMAIL,'
      '       '#39'  '#39' AS SALTOTAL,'
      '       '#39'  '#39' AS DATAADMISSAO,'
      '       '#39'  '#39' AS DATADEMISSAO,'
      '       '#39'  '#39' AS NIVEL,'
      '       '#39'  '#39' AS FLGDIRETOR,'
      ''
      '       '#39'  '#39' AS TIPOFLGDIRETOR,'
      ''
      '       '#39'  '#39' AS SITPART,'
      '       '#39'  '#39' AS NOMECARGO,'
      '       '#39'  '#39' AS FUNCAO,'
      '       '#39'  '#39' AS VINCULO,'
      '       PF.DATAMORTE,'
      '       '#39'  '#39' AS  FILIAL,'
      '       '#39'  '#39' AS NOMEVALORBASE1,'
      '       0  AS VALORBASE1,'
      '       '#39'  '#39' AS NOMEVALORBASE2,'
      '       '#39'  '#39' AS VALORBASE2,'
      '       '#39'  '#39' AS NOMEVALORBASE3,'
      '       '#39'  '#39' AS VALORBASE3,'
      
        '       DECODE (PF.FLGMOLESTIAGRAVE, 1, '#39'Sim'#39', '#39'Não'#39') AS FLGMOLES' +
        'TIAGRAVE,'
      '       PF.DATAMOLESTIAGRAVE, PF.DATAFIMMOLESTIA,'
      
        '       DECODE(PF.FLGISENTOIRRF, 1,'#39'Isento'#39','#39'Recolhe'#39') AS SITIRRF' +
        ','
      '       PF.FLGBLOQUEIO,'
      '       PA.NOMENACIONALIDADE,'
      '       PF.CODESTADO,'
      '       CID.NOME AS CIDADE,'
      '       PF.NUMDEPIRRF,'
      '       PF.NUMDEPSALF,'
      '       PF.NUMDEPTOT,'
      '       PF.TIPOSANG,'
      '       '#39'     '#39' AS SITPLANOPREV,'
      
        '       DECODE (PF.CORPESSOA, 2, '#39'Branca'#39', 4, '#39'Negra'#39', 6, '#39'Amarel' +
        'o'#39', 8, '#39'Parda'#39', 0, '#39'Indígena'#39' ) AS CORPESSOA,'
      
        '       DECODE (PF.FLGDEFICIENTE, 1, '#39'Sim'#39', '#39'Não'#39') AS FLGDEFICIEN' +
        'TE,'
      '       PF.INICIOINVALIDEZ,'
      '       PF.FIMINVALIDEZ,'
      '       GR.DESCRICAO AS GRAUINSTRUCAO,'
      '       IM.IMAGEM,'
      '       '#39'  '#39' AS SITUACAONAPATRO,'
      '       '#39'  '#39' AS PATRO,'
      '       0 AS IDPESSJUR,'
      '       0 AS IDPLANOPREV,'
      '       '#39'  '#39' AS PLANO,'
      '       '#39'  '#39' AS SEQPROPOSTA,'
      '       0 AS INSCRICAONUMERO,'
      '       '#39' '#39'  AS INSCRICAODATA,'
      '       0 AS IDRGELEGBENEF,'
      '       '#39' '#39' AS DATACANCELAMENTO,'
      '       '#39'  '#39' AS DESCRICAO'
      '       --SIG 21868 -INICIO'
      '        ,'#39'  '#39' AS TPDEFICIENCIA  '
      '        ,'#39'  '#39' AS IDRESPONSAVEL'
      '        ,'#39'  '#39' AS CODTIPORESPONSAVEL'
      '       --SIG 21868 -FIM'
      ',TO_DATE(NULL,'#39'DD/MM/YYYY'#39') AS DTNOMEACAO '
      ',TO_DATE(NULL,'#39'DD/MM/YYYY'#39') AS DTEXONERACAO,'
      
        '       DECODE(PF.FLGISENTOIRRF,0,'#39'Não'#39','#39'1'#39','#39'Sim'#39') AS FLGISENTOIR' +
        'RF , '
      
        '       DECODE(PF.FLGSOMAIRSUPINSS,0,'#39'Não'#39','#39'1'#39','#39'Sim'#39') AS FLGSOMAI' +
        'RSUPINSS'
      '       ,PF.EMAILFUNCEF'
      'FROM'
      '      PESSOA P,'
      '      PESSOAFISICA PF,'
      '      PAIS PA,'
      '      IMAGENS IM,'
      '      DEPENTIT DP,'
      '      RUBRICAINDIV R,'
      '      GRINSTR GR,'
      '      CIDADES CID'
      'WHERE'
      '      (P.IDPESSOA      = :IDPESSOA)'
      'AND   (R.IDFAVORECIDO  = :IDPESSOA)'
      'AND   (DP.IDPESSOA(+)  = P.IDPESSOA)'
      'AND   (R.FLGPENSAOALIM = 1)'
      'AND   (P.IDPESSOA      = PF.IDPESSOA)'
      'AND   (PA.IDPAIS(+)    = PF.IDPAIS)'
      'AND   (PF.IDCIDADES    = CID.IDCIDADES(+))'
      'AND   (P.IDIMAGEM      = IM.IDIMAGEM(+))'
      'AND   (PF.IDGRINSTR = GR.IDGRINSTR(+))'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 286
    Top = 520
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    object qryRecebedorPensaoAlimMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryRecebedorPensaoAlimNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryRecebedorPensaoAlimNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryRecebedorPensaoAlimNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      Size = 50
    end
    object qryRecebedorPensaoAlimNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      Size = 50
    end
    object qryRecebedorPensaoAlimDATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
    object qryRecebedorPensaoAlimSEXO: TStringField
      FieldName = 'SEXO'
      Size = 9
    end
    object qryRecebedorPensaoAlimESTADOCIVIL: TStringField
      FieldName = 'ESTADOCIVIL'
      Size = 26
    end
    object qryRecebedorPensaoAlimEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object qryRecebedorPensaoAlimSALTOTAL: TStringField
      FieldName = 'SALTOTAL'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimDATAADMISSAO: TStringField
      FieldName = 'DATAADMISSAO'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimDATADEMISSAO: TStringField
      FieldName = 'DATADEMISSAO'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimNIVEL: TStringField
      FieldName = 'NIVEL'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimFLGDIRETOR: TStringField
      FieldName = 'FLGDIRETOR'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimSITPART: TStringField
      FieldName = 'SITPART'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimNOMECARGO: TStringField
      FieldName = 'NOMECARGO'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimFUNCAO: TStringField
      FieldName = 'FUNCAO'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimVINCULO: TStringField
      FieldName = 'VINCULO'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimDATAMORTE: TDateTimeField
      FieldName = 'DATAMORTE'
    end
    object qryRecebedorPensaoAlimFILIAL: TStringField
      FieldName = 'FILIAL'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimNOMEVALORBASE1: TStringField
      FieldName = 'NOMEVALORBASE1'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
    end
    object qryRecebedorPensaoAlimNOMEVALORBASE2: TStringField
      FieldName = 'NOMEVALORBASE2'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimVALORBASE2: TStringField
      FieldName = 'VALORBASE2'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimNOMEVALORBASE3: TStringField
      FieldName = 'NOMEVALORBASE3'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimVALORBASE3: TStringField
      FieldName = 'VALORBASE3'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimFLGMOLESTIAGRAVE: TStringField
      FieldName = 'FLGMOLESTIAGRAVE'
      Size = 3
    end
    object qryRecebedorPensaoAlimDATAMOLESTIAGRAVE: TDateTimeField
      FieldName = 'DATAMOLESTIAGRAVE'
    end
    object qryRecebedorPensaoAlimSITIRRF: TStringField
      FieldName = 'SITIRRF'
      Size = 7
    end
    object qryRecebedorPensaoAlimFLGBLOQUEIO: TFloatField
      FieldName = 'FLGBLOQUEIO'
    end
    object qryRecebedorPensaoAlimNOMENACIONALIDADE: TStringField
      FieldName = 'NOMENACIONALIDADE'
      Size = 30
    end
    object qryRecebedorPensaoAlimCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryRecebedorPensaoAlimCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryRecebedorPensaoAlimNUMDEPIRRF: TFloatField
      FieldName = 'NUMDEPIRRF'
    end
    object qryRecebedorPensaoAlimNUMDEPSALF: TFloatField
      FieldName = 'NUMDEPSALF'
    end
    object qryRecebedorPensaoAlimNUMDEPTOT: TFloatField
      FieldName = 'NUMDEPTOT'
    end
    object qryRecebedorPensaoAlimTIPOSANG: TStringField
      FieldName = 'TIPOSANG'
      Size = 3
    end
    object qryRecebedorPensaoAlimSITPLANOPREV: TStringField
      FieldName = 'SITPLANOPREV'
      FixedChar = True
      Size = 5
    end
    object qryRecebedorPensaoAlimCORPESSOA: TStringField
      FieldName = 'CORPESSOA'
      Size = 8
    end
    object qryRecebedorPensaoAlimFLGDEFICIENTE: TStringField
      FieldName = 'FLGDEFICIENTE'
      Size = 3
    end
    object qryRecebedorPensaoAlimINICIOINVALIDEZ: TDateTimeField
      FieldName = 'INICIOINVALIDEZ'
    end
    object qryRecebedorPensaoAlimFIMINVALIDEZ: TDateTimeField
      FieldName = 'FIMINVALIDEZ'
    end
    object qryRecebedorPensaoAlimGRAUINSTRUCAO: TStringField
      FieldName = 'GRAUINSTRUCAO'
      Size = 30
    end
    object qryRecebedorPensaoAlimIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryRecebedorPensaoAlimSITUACAONAPATRO: TStringField
      FieldName = 'SITUACAONAPATRO'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimPATRO: TStringField
      FieldName = 'PATRO'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryRecebedorPensaoAlimIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryRecebedorPensaoAlimPLANO: TStringField
      FieldName = 'PLANO'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimSEQPROPOSTA: TStringField
      FieldName = 'SEQPROPOSTA'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryRecebedorPensaoAlimINSCRICAODATA: TStringField
      FieldName = 'INSCRICAODATA'
      FixedChar = True
      Size = 1
    end
    object qryRecebedorPensaoAlimIDRGELEGBENEF: TFloatField
      FieldName = 'IDRGELEGBENEF'
    end
    object qryRecebedorPensaoAlimDATACANCELAMENTO: TStringField
      FieldName = 'DATACANCELAMENTO'
      FixedChar = True
      Size = 1
    end
    object qryRecebedorPensaoAlimDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 31
    end
    object qryRecebedorPensaoAlimTIPOFLGDIRETOR: TStringField
      FieldName = 'TIPOFLGDIRETOR'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimDTNOMEACAO: TDateField
      FieldName = 'DTNOMEACAO'
    end
    object qryRecebedorPensaoAlimDTEXONERACAO: TDateField
      FieldName = 'DTEXONERACAO'
    end
    object qryRecebedorPensaoAlimFLGISENTOIRRF: TStringField
      FieldName = 'FLGISENTOIRRF'
      Size = 3
    end
    object qryRecebedorPensaoAlimFLGSOMAIRSUPINSS: TStringField
      FieldName = 'FLGSOMAIRSUPINSS'
      Size = 3
    end
    object dtmfldRecebedorPensaoAlimDATAFIMMOLESTIA: TDateTimeField
      FieldName = 'DATAFIMMOLESTIA'
    end
    object qryRecebedorPensaoAlimEMAILFUNCEF: TStringField
      FieldName = 'EMAILFUNCEF'
      Size = 100
    end
    object qryRecebedorPensaoAlimTPDEFICIENCIA: TStringField
      FieldName = 'TPDEFICIENCIA'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimIDRESPONSAVEL: TStringField
      FieldName = 'IDRESPONSAVEL'
      FixedChar = True
      Size = 2
    end
    object qryRecebedorPensaoAlimCODTIPORESPONSAVEL: TStringField
      FieldName = 'CODTIPORESPONSAVEL'
      FixedChar = True
      Size = 2
    end
  end
  object qryProcessosBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  B.IDPLANOPREV,'
      '  B.IDPESSJUR,'
      '  B.NUMEROPROCESSO,'
      '  B.NUMPROCINSS,'
      '  BN.NOME AS BENEFICIO,'
      '  SB.DESCRICAO AS SITPROCESSO,'
      '  EG.NOME AS EVENTOGER,'
      '  P.DTEVENTO,'
      '  P.DTREGISTRO,'
      '  B.DATAINICIOFUND AS DATAINICIOBENEF,'
      '  B.DATAFINAL,'
      '  B.DATAINICIO  AS DATAINICIOPAG,'
      '  B.VALORATUAL,'
      '  B.VALORCALCULADO,'
      '  B.VALORCOTAS,'
      '  B.PERCENTUAL'
      
        'FROM BENEFBFCIARIO B, PROCESSOBENEF P, BENEFICIO BN, EVENTOGERAD' +
        'OR EG, SITBENEFICIO SB'
      'WHERE'
      '      B.NUMEROPROCESSO  = P.NUMEROPROCESSO '
      '  AND B.IDBENEFICIO     = BN.IDBENEFICIO'
      '  AND P.IDEVENTOGERADOR = EG.IDEVENTOGERADOR'
      '  AND P.IDSITPROCESSO   = SB.IDSITBENEFICIO'
      '  AND B.IDPESSOA        = :IDPESSOA'
      '  and b.idtitular       = :idtitular'
      'ORDER BY DATAINICIOPAG ASC'
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 272
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'idtitular'
        ParamType = ptInput
      end>
    object qryProcessosBenefNUMEROPROCESSO: TFloatField
      DisplayLabel = 'Núm.~Processo CM'
      DisplayWidth = 10
      FieldName = 'NUMEROPROCESSO'
      Origin = 'BASEDADOS.BENEFBFCIARIO.NUMEROPROCESSO'
    end
    object qryProcessosBenefNUMPROCINSS: TStringField
      DisplayLabel = 'Núm.~Processo INSS'
      DisplayWidth = 15
      FieldName = 'NUMPROCINSS'
      Origin = 'BASEDADOS.BENEFBFCIARIO.NUMPROCINSS'
      Size = 15
    end
    object qryProcessosBenefBENEFICIO: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 40
      FieldName = 'BENEFICIO'
      Origin = 'BASEDADOS.BENEFICIO.NOME'
      Size = 60
    end
    object qryProcessosBenefSITPROCESSO: TStringField
      DisplayLabel = 'Situação do Processo'
      DisplayWidth = 35
      FieldName = 'SITPROCESSO'
      Origin = 'BASEDADOS.SITBENEFICIO.DESCRICAO'
      Size = 40
    end
    object qryProcessosBenefEVENTOGER: TStringField
      DisplayLabel = 'Evento Gerador'
      DisplayWidth = 40
      FieldName = 'EVENTOGER'
      Origin = 'BASEDADOS.EVENTOGERADOR.NOME'
      Size = 60
    end
    object qryProcessosBenefDTEVENTO: TDateTimeField
      DisplayLabel = 'Data do Evento'
      DisplayWidth = 18
      FieldName = 'DTEVENTO'
      Origin = 'BASEDADOS.PROCESSOBENEF.DTEVENTO'
    end
    object qryProcessosBenefDTREGISTRO: TDateTimeField
      DisplayLabel = 'Data de Registro'
      DisplayWidth = 18
      FieldName = 'DTREGISTRO'
      Origin = 'BASEDADOS.PROCESSOBENEF.DTREGISTRO'
    end
    object qryProcessosBenefDATAINICIOBENEF: TDateTimeField
      DisplayLabel = 'Data de Início~do Benefício'
      DisplayWidth = 18
      FieldName = 'DATAINICIOBENEF'
      Origin = 'BASEDADOS.BENEFBFCIARIO.DATAINICIOFUND'
    end
    object qryProcessosBenefDATAFINAL: TDateTimeField
      DisplayLabel = 'Data de Final~do Benefício'
      DisplayWidth = 18
      FieldName = 'DATAFINAL'
      Origin = 'BASEDADOS.BENEFBFCIARIO.DATAFINAL'
    end
    object qryProcessosBenefDATAINICIOPAG: TDateTimeField
      DisplayLabel = 'Data de Início de~Pagamento do Benefício'
      DisplayWidth = 18
      FieldName = 'DATAINICIOPAG'
      Origin = 'BASEDADOS.BENEFBFCIARIO.DATAINICIO'
    end
    object qryProcessosBenefVALORATUAL: TFloatField
      DisplayLabel = 'Valor Atual'
      DisplayWidth = 10
      FieldName = 'VALORATUAL'
      Origin = 'BASEDADOS.BENEFBFCIARIO.VALORATUAL'
    end
    object qryProcessosBenefVALORCALCULADO: TFloatField
      DisplayLabel = 'Valor Calculado'
      DisplayWidth = 10
      FieldName = 'VALORCALCULADO'
      Origin = 'BASEDADOS.BENEFBFCIARIO.VALORCALCULADO'
    end
    object qryProcessosBenefVALORCOTAS: TFloatField
      DisplayLabel = 'Valor em Cotas'
      DisplayWidth = 10
      FieldName = 'VALORCOTAS'
      Origin = 'BASEDADOS.BENEFBFCIARIO.VALORCOTAS'
    end
    object qryProcessosBenefPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'PERCENTUAL'
      Origin = 'BASEDADOS.BENEFBFCIARIO.PERCENTUAL'
    end
    object qryProcessosBenefIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPLANOPREV'
      Visible = False
    end
    object qryProcessosBenefIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPESSJUR'
      Visible = False
    end
  end
  object dsProcessoBenef: TwwDataSource
    DataSet = qryProcessosBenef
    Left = 274
    Top = 103
  end
  object qrySituacaoAtualBenef: TwwQuery
    AfterScroll = qrySituacaoAtualBenefAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  B.IDSITBENEFICIO,'
      '  B.IDPLANOPREV,'
      '  B.IDPESSJUR,'
      '  B.NUMEROPROCESSO,'
      ''
      '  B.NUMPROCINSS,'
      '  BN.NOME AS BENEFICIO,'
      '  SB.DESCRICAO AS SITBENEFICIO,'
      '  TPG.NOME AS TIPOPAGBENEF,'
      '  B.DATAINICIOFUND AS DATAINICIOBENEF,'
      '  B.DATAINICIO  AS DATAINICIOPAG,'
      '  B.DATAFINAL,'
      '  B.DATAFINALPREVISTA,'
      '  B.DATAREQUERIMENTO,'
      '  B.DATACONCESSAO,'
      '  B.DATAINICIOFUND,'
      '  B.VALORATUAL,'
      '  B.VALORCOTAS,'
      '  B.VALORTOTAL,'
      '  B.VALORCALCULADO,'
      '  B.VALORSRB,'
      '  B.ULTMESPREPARO,'
      '  B.DATAULTREAJUSTE,'
      
        '  DECODE(B.FLGFORMAPAGTO, '#39'F'#39', '#39'FOLHA DE BENEFICIO'#39', '#39'R'#39', '#39'RECIB' +
        'O'#39', '#39'C'#39', '#39'CONTA CORRENTE'#39') AS FORMAPGTO,'
      ''
      
        '  --DECODE(EMP.TIPOCLIENTE,19991,B.VALORBASE1,DECODE(B.IDTITULAR' +
        ',B.IDPESSOA,BPP.VALORBASE1,B.VALORBASE1)) AS VALORBASE1,'
      
        '  --DECODE(EMP.TIPOCLIENTE,19991,B.VALORBASE2,DECODE(B.IDTITULAR' +
        ',B.IDPESSOA,BPP.VALORBASE2,B.VALORBASE2)) AS VALORBASE2,'
      
        '  --DECODE(EMP.TIPOCLIENTE,19991,B.VALORBASE3,DECODE(B.IDTITULAR' +
        ',B.IDPESSOA,BPP.VALORBASE3,B.VALORBASE3)) AS VALORBASE3,'
      
        '  DECODE(B.IDTITULAR,B.IDPESSOA,NVL(BPP.VALORBASE1,B.VALORBASE1)' +
        ',B.VALORBASE1) AS VALORBASE1,'
      
        '  DECODE(B.IDTITULAR,B.IDPESSOA,NVL(BPP.VALORBASE2,B.VALORBASE2)' +
        ',B.VALORBASE2) AS VALORBASE2,'
      
        '  DECODE(B.IDTITULAR,B.IDPESSOA,NVL(BPP.VALORBASE3,B.VALORBASE3)' +
        ',B.VALORBASE3) AS VALORBASE3,'
      ''
      '  NVL(BPPREV.NOMEVALORBASE1, '#39'VALOR OPÇÃO 1'#39') AS NOMEVALORBASE1,'
      '  NVL(BPPREV.NOMEVALORBASE2, '#39'VALOR OPÇÃO 2'#39') AS NOMEVALORBASE2,'
      '  NVL(BPPREV.NOMEVALORBASE3, '#39'VALOR OPÇÃO 3'#39') AS NOMEVALORBASE3,'
      ''
      '  B.DATAINICIOINSS,'
      '  B.VLRCALCINSS,'
      '  B.VLRINFINSS,'
      '  B.MOTIVOCANCELAMEN,'
      '  NVL(B.FLGPROVISORIO, 0) AS FLGPROVISORIO,'
      '  B.PERCPROVISORIO,'
      '  B.PRAZOPROVISORIO,'
      '  B.DIBBENEFANT AS DATAINICIOBENEFANT,'
      '  B.VALORBENEFANT,'
      '  B.ULTMESREAJUSTE,'
      '  NVL (B.FLGPOSSUIACOMPINSS, 0) AS FLGPOSSUIACOMPINSS,'
      ''
      '  B.VALORNADIB AS VALBENEFINICIAL,'
      '  BFT.PERCENTUAL AS PERCGRUPOFAMILIAR,'
      '  BENEFANT.NUMPROCINSS  AS NUMPROCINSSBENANTERIOR,'
      '  BENEFANT.PERCENTUAL  AS PERCBENANTERIOR,'
      '  CASE WHEN B.FONTEPAGADORA = 2  THEN'
      '     1      '
      '  ELSE   '
      '     0'
      '  END MOSTRAFLGPAGAINSS,'
      '  NVL(B.FLGPAGAINSS,0)   AS FLGPAGAINSS,'
      ''
      '  /* SOL 249378-17134 PPM 758026 INICIO*/'
      '  B.FONTEPAGADORA,'
      '  B.DEC,'
      '  B.BENEFLEI142,'
      '  B.TEMPOSERVICOANOS,'
      '  B.TEMPOSERVICOMES,'
      '  B.TEMPOSERVICODIAS,'
      '  /* SOL 249378-17134 PPM 758026 FIM*/'
      ''
      '  --Inicio - Helio - SOL Nº 253577/17604 PPM Nº 999484'
      '  B.DATAENCERRAMENTO,'
      '  B.BSDIB,'
      '  B.FABDIB,'
      '  B.VLRBSATUAL,'
      '  B.VLRBSTOTAL,'
      '  B.VLRFABATUAL,'
      '  B.VLRFABTOTAL,'
      '  B.VLRBASEDEFICIT,'
      '  BPPREV.FLGAPRESENTABSFAB,'
      '  BPPREV.FLGAPRESENTADEFICIT'
      '  --Fim - Helio - SOL Nº 253577/17604 PPM Nº 999484'
      ''
      '  --edilaine WO18367 - inicio'
      '  , B.BSTITULAR, B.FABTITULAR'
      '  , NVL(B.VLRTOTALTITULAR,0) AS VLRTOTALTITULAR'
      '  , CM.FN_BF_BUSCA_PERC_PENSAO(b.numeroprocesso) AS PERC_PENSAO'
      '  --edilaine WO18367 - fim'
      ''
      'FROM BENEFBFCIARIO B, BENEFICIO BN,'
      '     SITBENEFICIO SB,  TPPAGTOBENEFICIO TPG,'
      
        '     BENEFPLANOPART BPP, BENEFPLANPREV BPPREV, BFCIARIOTITPLAN B' +
        'FT,'
      '     EMPRESAPROP EMP,'
      '     PARAMAPREV  PR,           -- edilaine WO18367'
      
        '     (SELECT BF.NUMPROCINSS, BF.IDBENEFICIO,  BF.IDPLANOPREV, BF' +
        '.PERCENTUAL, BPP.FLGREFERENCIA'
      '        FROM BENEFBFCIARIO BF, BENEFPLANPREV BPP'
      '       WHERE BF.IDSITBENEFICIO = 3 AND'
      
        '             BF.DATAINICIO = (SELECT MAX(DATAINICIO) FROM BENEFB' +
        'FCIARIO WHERE IDSITBENEFICIO = 3 AND IDPESSOA = :IDPESSOA) AND'
      '             BF.IDPLANOPREV = BPP.IDPLANOPREV AND'
      '             BF.IDBENEFICIO = BPP.IDBENEFICIO AND'
      '             BF.IDPESSOA    = :IDPESSOA'
      '      ) BENEFANT'
      ''
      'WHERE'
      '  B.IDBENEFICIO          = BN.IDBENEFICIO'
      '  AND B.IDSITBENEFICIO   = SB.IDSITBENEFICIO(+)'
      '  AND B.IDTPPAGTOBENEFIC = TPG.IDTPPAGTOBENEFIC(+)'
      ''
      '  AND B.IDPESSOA         = BPP.IDPESSOA(+)'
      '  AND B.IDPLANOPREV      = BPP.IDPLANOPREV(+)'
      '  AND B.IDPESSJUR        = BPP.IDPESSJUR(+)'
      '  AND B.SEQPROPOSTA      = BPP.SEQPROPOSTA(+)'
      '  AND B.IDBENEFICIO      = BPP.IDBENEFICIO(+)'
      ''
      '  AND B.IDPLANOPREV      = BPPREV.IDPLANOPREV(+)'
      '  AND B.IDBENEFICIO      = BPPREV.IDBENEFICIO(+)'
      '  AND B.IDTITULAR        = :IDTITULAR'
      '  AND B.IDPESSOA         = :IDPESSOA '
      ''
      ''
      '  AND B.IDPESSOA         = BFT.IDPESSOA'
      '  AND B.IDPLANOPREV      = BFT.IDPLANOPREV'
      '  AND B.IDPESSJUR        = BFT.IDPESSJUR'
      '  AND B.SEQPROPOSTA      = BFT.SEQPROPOSTA'
      '  AND B.IDBENEFICIO      = BFT.IDBENEFICIO'
      ''
      '  AND BENEFANT.FLGREFERENCIA(+) = BPPREV.FLGREFERENCIA'
      ''
      '  AND EMP.IDPESSOA       = :PIDEMPRESA '
      ''
      'ORDER BY B.DATAINICIO ASC'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGPROVISORIO;CheckBox;1;0'
      'FLGPOSSUIACOMPINSS;CheckBox;1;0')
    ValidateWithMask = True
    Left = 424
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object qrySituacaoAtualBenefNUMEROPROCESSO: TFloatField
      DisplayLabel = 'Núm. Proc. CM'
      DisplayWidth = 10
      FieldName = 'NUMEROPROCESSO'
    end
    object qrySituacaoAtualBenefNUMPROCINSS: TStringField
      DisplayLabel = 'Núm. Proc. INSS'
      DisplayWidth = 15
      FieldName = 'NUMPROCINSS'
      Size = 15
    end
    object qrySituacaoAtualBenefBENEFICIO: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 40
      FieldName = 'BENEFICIO'
      Size = 60
    end
    object qrySituacaoAtualBenefSITBENEFICIO: TStringField
      DisplayLabel = 'Sit. Benefício'
      DisplayWidth = 30
      FieldName = 'SITBENEFICIO'
      Size = 40
    end
    object qrySituacaoAtualBenefTIPOPAGBENEF: TStringField
      DisplayLabel = 'Tipo de pagamento~do Benefício'
      DisplayWidth = 30
      FieldName = 'TIPOPAGBENEF'
      Size = 60
    end
    object qrySituacaoAtualBenefDATAINICIOBENEF: TDateTimeField
      DisplayLabel = 'Data de Início'
      DisplayWidth = 18
      FieldName = 'DATAINICIOBENEF'
    end
    object qrySituacaoAtualBenefDATAINICIOPAG: TDateTimeField
      DisplayLabel = 'Data de Início~do Pagamento'
      DisplayWidth = 18
      FieldName = 'DATAINICIOPAG'
    end
    object qrySituacaoAtualBenefDATAFINAL: TDateTimeField
      DisplayLabel = 'Data Fim'
      DisplayWidth = 18
      FieldName = 'DATAFINAL'
    end
    object qrySituacaoAtualBenefDATAREQUERIMENTO: TDateTimeField
      DisplayLabel = 'Data de~Requerimento'
      DisplayWidth = 18
      FieldName = 'DATAREQUERIMENTO'
    end
    object qrySituacaoAtualBenefDATACONCESSAO: TDateTimeField
      DisplayLabel = 'Data de~Concessão'
      DisplayWidth = 18
      FieldName = 'DATACONCESSAO'
    end
    object qrySituacaoAtualBenefDATAINICIOFUND: TDateTimeField
      DisplayLabel = 'Data de Início~na Fundação'
      DisplayWidth = 18
      FieldName = 'DATAINICIOFUND'
    end
    object qrySituacaoAtualBenefVALORATUAL: TFloatField
      DisplayLabel = 'Valor Atual'
      DisplayWidth = 10
      FieldName = 'VALORATUAL'
    end
    object qrySituacaoAtualBenefVALORCOTAS: TFloatField
      DisplayLabel = 'Valor em Cotas'
      DisplayWidth = 10
      FieldName = 'VALORCOTAS'
    end
    object qrySituacaoAtualBenefVALORTOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 10
      FieldName = 'VALORTOTAL'
    end
    object qrySituacaoAtualBenefVALORCALCULADO: TFloatField
      DisplayLabel = 'Valor Calculado'
      DisplayWidth = 10
      FieldName = 'VALORCALCULADO'
    end
    object qrySituacaoAtualBenefVALORSRB: TFloatField
      DisplayLabel = 'Valor SRB'
      DisplayWidth = 10
      FieldName = 'VALORSRB'
    end
    object qrySituacaoAtualBenefULTMESPREPARO: TStringField
      DisplayLabel = 'Preparado Até'
      DisplayWidth = 7
      FieldName = 'ULTMESPREPARO'
      FixedChar = True
      Size = 7
    end
    object qrySituacaoAtualBenefDATAULTREAJUSTE: TDateTimeField
      DisplayLabel = 'Reajustado Até'
      DisplayWidth = 18
      FieldName = 'DATAULTREAJUSTE'
    end
    object qrySituacaoAtualBenefFORMAPGTO: TStringField
      DisplayLabel = 'Forma de~Pagamento'
      DisplayWidth = 18
      FieldName = 'FORMAPGTO'
      Size = 18
    end
    object qrySituacaoAtualBenefDATAINICIOINSS: TDateTimeField
      DisplayLabel = 'Data de Início~no INSS'
      DisplayWidth = 18
      FieldName = 'DATAINICIOINSS'
    end
    object qrySituacaoAtualBenefVLRCALCINSS: TFloatField
      DisplayLabel = 'Valor Calculado~do INSS'
      DisplayWidth = 10
      FieldName = 'VLRCALCINSS'
    end
    object qrySituacaoAtualBenefVLRINFINSS: TFloatField
      DisplayLabel = 'Valor Informado~do INSS'
      DisplayWidth = 10
      FieldName = 'VLRINFINSS'
    end
    object qrySituacaoAtualBenefFLGPROVISORIO: TFloatField
      DisplayLabel = 'Benefício~Provisório'
      DisplayWidth = 10
      FieldName = 'FLGPROVISORIO'
    end
    object qrySituacaoAtualBenefPRAZOPROVISORIO: TFloatField
      DisplayLabel = 'Prazo p/ encerr.~do Benef. Provisório'
      DisplayWidth = 10
      FieldName = 'PRAZOPROVISORIO'
    end
    object qrySituacaoAtualBenefDATAINICIOBENEFANT: TDateTimeField
      DisplayLabel = 'Data de Início do~benefício Anterior'
      DisplayWidth = 18
      FieldName = 'DATAINICIOBENEFANT'
    end
    object qrySituacaoAtualBenefVALORBENEFANT: TFloatField
      DisplayLabel = 'Valor do~Benefício Anterior'
      DisplayWidth = 10
      FieldName = 'VALORBENEFANT'
    end
    object qrySituacaoAtualBenefFLGPOSSUIACOMPINSS: TFloatField
      DisplayLabel = 'Possui Acomp.~no INSS'
      DisplayWidth = 10
      FieldName = 'FLGPOSSUIACOMPINSS'
    end
    object qrySituacaoAtualBenefVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
      Visible = False
    end
    object qrySituacaoAtualBenefVALORBASE2: TFloatField
      FieldName = 'VALORBASE2'
      Visible = False
    end
    object qrySituacaoAtualBenefVALORBASE3: TFloatField
      FieldName = 'VALORBASE3'
      Visible = False
    end
    object qrySituacaoAtualBenefNOMEVALORBASE1: TStringField
      FieldName = 'NOMEVALORBASE1'
      Visible = False
      Size = 60
    end
    object qrySituacaoAtualBenefNOMEVALORBASE2: TStringField
      FieldName = 'NOMEVALORBASE2'
      Visible = False
      Size = 60
    end
    object qrySituacaoAtualBenefNOMEVALORBASE3: TStringField
      FieldName = 'NOMEVALORBASE3'
      Visible = False
      Size = 60
    end
    object qrySituacaoAtualBenefMOTIVOCANCELAMEN: TMemoField
      FieldName = 'MOTIVOCANCELAMEN'
      Visible = False
      BlobType = ftMemo
      Size = 1
    end
    object qrySituacaoAtualBenefPERCPROVISORIO: TFloatField
      FieldName = 'PERCPROVISORIO'
      Visible = False
    end
    object qrySituacaoAtualBenefULTMESREAJUSTE: TStringField
      FieldName = 'ULTMESREAJUSTE'
      FixedChar = True
      Size = 7
    end
    object qrySituacaoAtualBenefIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qrySituacaoAtualBenefIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qrySituacaoAtualBenefDATAFINALPREVISTA: TDateTimeField
      FieldName = 'DATAFINALPREVISTA'
    end
    object qrySituacaoAtualBenefIDSITBENEFICIO: TFloatField
      FieldName = 'IDSITBENEFICIO'
    end
    object qrySituacaoAtualBenefVALBENEFINICIAL: TFloatField
      FieldName = 'VALBENEFINICIAL'
    end
    object qrySituacaoAtualBenefPERCGRUPOFAMILIAR: TFloatField
      FieldName = 'PERCGRUPOFAMILIAR'
    end
    object qrySituacaoAtualBenefNUMPROCINSSBENANTERIOR: TStringField
      FieldName = 'NUMPROCINSSBENANTERIOR'
      Size = 15
    end
    object qrySituacaoAtualBenefPERCBENANTERIOR: TFloatField
      FieldName = 'PERCBENANTERIOR'
    end
    object qrySituacaoAtualBenefFLGPAGAINSS: TFloatField
      FieldName = 'FLGPAGAINSS'
    end
    object qrySituacaoAtualBenefMOSTRAFLGPAGAINSS: TFloatField
      FieldName = 'MOSTRAFLGPAGAINSS'
    end
    object qrySituacaoAtualBenefFONTEPAGADORA: TFloatField
      FieldName = 'FONTEPAGADORA'
    end
    object qrySituacaoAtualBenefDEC: TDateTimeField
      FieldName = 'DEC'
    end
    object qrySituacaoAtualBenefBENEFLEI142: TFloatField
      FieldName = 'BENEFLEI142'
    end
    object qrySituacaoAtualBenefTEMPOSERVICOANOS: TFloatField
      FieldName = 'TEMPOSERVICOANOS'
    end
    object qrySituacaoAtualBenefTEMPOSERVICOMES: TFloatField
      FieldName = 'TEMPOSERVICOMES'
    end
    object qrySituacaoAtualBenefTEMPOSERVICODIAS: TFloatField
      FieldName = 'TEMPOSERVICODIAS'
    end
    object qrySituacaoAtualBenefDATAENCERRAMENTO: TDateTimeField
      DisplayLabel = 'Data Encerramento'
      DisplayWidth = 18
      FieldName = 'DATAENCERRAMENTO'
    end
    object qrySituacaoAtualBenefBSDIB: TFloatField
      FieldName = 'BSDIB'
    end
    object qrySituacaoAtualBenefFABDIB: TFloatField
      FieldName = 'FABDIB'
    end
    object qrySituacaoAtualBenefVLRBSATUAL: TFloatField
      FieldName = 'VLRBSATUAL'
    end
    object qrySituacaoAtualBenefVLRBSTOTAL: TFloatField
      FieldName = 'VLRBSTOTAL'
    end
    object qrySituacaoAtualBenefVLRFABATUAL: TFloatField
      FieldName = 'VLRFABATUAL'
    end
    object qrySituacaoAtualBenefVLRFABTOTAL: TFloatField
      FieldName = 'VLRFABTOTAL'
    end
    object qrySituacaoAtualBenefVLRBASEDEFICIT: TFloatField
      FieldName = 'VLRBASEDEFICIT'
    end
    object qrySituacaoAtualBenefFLGAPRESENTABSFAB: TFloatField
      FieldName = 'FLGAPRESENTABSFAB'
    end
    object qrySituacaoAtualBenefFLGAPRESENTADEFICIT: TFloatField
      FieldName = 'FLGAPRESENTADEFICIT'
    end
    object qrySituacaoAtualBenefBSTITULAR: TFloatField
      FieldName = 'BSTITULAR'
    end
    object qrySituacaoAtualBenefFABTITULAR: TFloatField
      FieldName = 'FABTITULAR'
    end
    object qrySituacaoAtualBenefVLRTOTALTITULAR: TFloatField
      FieldName = 'VLRTOTALTITULAR'
    end
    object qrySituacaoAtualBenefPERC_PENSAO: TFloatField
      FieldName = 'PERC_PENSAO'
    end
  end
  object DsSituacaoAtualBenef: TwwDataSource
    DataSet = qrySituacaoAtualBenef
    Left = 482
    Top = 82
  end
  object qryContribSitAtual: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CTB.NOME,'
      '  DECODE(C.FLGCOBRA, 1, '#39'Cobra'#39', '#39'Não Cobra'#39') AS SITCOBRANCA,'
      '  C.DATAINICIO,'
      '  C.DATAFINAL,'
      '  C.VALORBASE1,'
      '  C.VALORBASE2,'
      '  C.VALORBASE3,'
      '  NVL(CP.NOMEVALORBASE1, '#39'Opção 1'#39') AS NOMEVALORBASE1,'
      '  NVL(CP.NOMEVALORBASE2, '#39'Opção 2'#39') AS NOMEVALORBASE2,'
      '  NVL(CP.NOMEVALORBASE3, '#39'Opção 3'#39') AS NOMEVALORBASE3'
      'FROM  CONTRIBPREVPARTP C, CONTRIBUICAO CTB, CONTPREV CP'
      'WHERE C.IDPESSOA       = :IDPESSOA'
      '  AND C.IDPESSJUR      = :IDPESSJUR'
      '  AND C.IDPLANOPREV    = :IDPLANOPREV'
      '  AND C.SEQPROPOSTA    = :SEQPROPOSTA'
      '  AND C.IDCONTRIBUICAO = CTB.IDCONTRIBUICAO'
      '  AND C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      '  AND C.IDPLANOPREV    = CP.IDPLANOPREV'
      ''
      ' ')
    ValidateWithMask = True
    Left = 8
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SEQPROPOSTA'
        ParamType = ptInput
      end>
    object qryContribSitAtualNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.CONTRIBUICAO.NOME'
      Size = 60
    end
    object qryContribSitAtualDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'BASEDADOS.CONTRIBPREVPARTP.DATAINICIO'
    end
    object qryContribSitAtualDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
      Origin = 'BASEDADOS.CONTRIBPREVPARTP.DATAFINAL'
    end
    object qryContribSitAtualVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
      Origin = 'BASEDADOS.CONTRIBPREVPARTP.VALORBASE1'
    end
    object qryContribSitAtualVALORBASE2: TFloatField
      FieldName = 'VALORBASE2'
      Origin = 'BASEDADOS.CONTRIBPREVPARTP.VALORBASE2'
    end
    object qryContribSitAtualVALORBASE3: TFloatField
      FieldName = 'VALORBASE3'
      Origin = 'BASEDADOS.CONTRIBPREVPARTP.VALORBASE3'
    end
    object qryContribSitAtualSITCOBRANCA: TStringField
      FieldName = 'SITCOBRANCA'
      Size = 9
    end
    object qryContribSitAtualNOMEVALORBASE1: TStringField
      FieldName = 'NOMEVALORBASE1'
      Size = 60
    end
    object qryContribSitAtualNOMEVALORBASE2: TStringField
      FieldName = 'NOMEVALORBASE2'
      Size = 60
    end
    object qryContribSitAtualNOMEVALORBASE3: TStringField
      FieldName = 'NOMEVALORBASE3'
      Size = 60
    end
  end
  object DsContribSitAtual: TwwDataSource
    DataSet = qryContribSitAtual
    Left = 7
    Top = 152
  end
  object qryPessoaLigTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPESSOA'
      'FROM DEPENTIT'
      'WHERE IDTITULAR = :IDPESSOA'
      '  AND IDPESSOA <> IDTITULAR'
      ''
      'UNION'
      ''
      'SELECT'
      '  IDFAVORECIDO AS IDPESSOA'
      'FROM RUBRICAINDIV'
      'WHERE IDTITULAR = :IDPESSOA'
      '  AND FLGPENSAOALIM = 1'
      '  AND IDFAVORECIDO <> IDTITULAR'
      ''
      'UNION'
      ''
      'SELECT'
      '  IDRESPONSAVEL AS IDPESSOA'
      'FROM BFCIARIOTITPLAN'
      'WHERE IDTITULAR = :IDPESSOA'
      '  AND IDRESPONSAVEL <> IDTITULAR'
      ' ')
    ValidateWithMask = True
    Left = 72
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    object qryPessoaLigTitularIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
  end
  object qryPatros: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '      DISTINCT '
      '      EL.IDPESSOA,'
      '      EL.IDPESSJUR,'
      '      PJ.NOME'
      'FROM'
      '    ELEGPATRO EL,'
      '    PESSOA PJ '
      'WHERE EL.IDPESSOA = :idpessoa '
      'AND  PJ.IDPESSOA = EL.IDPESSJUR')
    ValidateWithMask = True
    Left = 496
    Top = 544
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptInput
      end>
    object qryPatrosNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryPatrosIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PARTPREVPLAN.IDPESSOA'
      Visible = False
    end
    object qryPatrosIDPESSJUR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.PARTPREVPLAN.IDPESSJUR'
      Visible = False
    end
  end
  object qryEvolFuncATS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '       SELECT  EV.IDPESSOA,'
      '               EV.DATAINICIO, EV.DATAFINAL,'
      '               '#39'ATS'#39' AS NOMEITEM,'
      '               TO_CHAR(EV.PERCATS) AS VALORITEM,'
      '               '#39' '#39' AS DESCITEM,'
      '                 '#39'1 - SITUAÇÃO FUNCIONAL NO PBC'#39' AS DESCGRUPO'
      
        '       FROM    PESSOA P, PESSOA PAT, PESSOAFISICA PF, EVOLFUNCPR' +
        'EV EV,'
      '               DETCALCULO D, CARGOEXT CEXT'
      '       WHERE   EV.IDPESSOA       = :idPessoa'
      '       AND     P.IDPESSOA        = EV.IDPESSOA'
      '       AND     PF.IDPESSOA       = EV.IDPESSOA'
      '       AND     PAT.IDPESSOA      = EV.IDPESSJUR'
      '       AND     EV.PERCATS IS NOT NULL'
      '       AND     EV.PERCATS > 0'
      '       AND     D.IDPESSOA        = EV.IDPESSOA'
      
        '       AND     D.IDCALCULO =  ( SELECT MAX(IDCALCULO) FROM DETCA' +
        'LCULO'
      '                                WHERE  IDPESSOA = :idPessoa'
      
        '                                AND    UPPER(DESCRICAO) LIKE '#39'%%' +
        'ATS:%'#39')'
      '       AND     RTRIM(D.VALOR) = RTRIM(CEXT.CODIGO)'
      ''
      ''
      ''
      'ORDER BY DATAINICIO DESC'
      ' '
      ' '
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      
        'VALORRESULT'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]' +
        '#[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[' +
        '#][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#' +
        '[#][#]]]}'#9'T'#9'T'
      
        'VALORRESERVA'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#' +
        '[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#' +
        ']]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 270
    Top = 371
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idPessoa'
        ParamType = ptUnknown
        Value = 8
      end
      item
        DataType = ftInteger
        Name = 'idPessoa'
        ParamType = ptUnknown
      end>
  end
  object dsEvolFuncATS: TwwDataSource
    DataSet = qryEvolFuncATS
    Left = 266
    Top = 370
  end
  object qryEvolFuncCargo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '               N.CODIGO AS NIVEL,'
      '               EV.IDPESSOA,'
      '               EV.DATAINICIO, EV.DATAFINAL,'
      '               '#39'CARGO'#39' AS NOMEITEM,'
      '               CEXT.CODIGO AS VALORITEM,'
      '               CEXT.TITULO AS DESCITEM,'
      '               '#39'1 - SITUAÇÃO FUNCIONAL NO PBC'#39' AS DESCGRUPO'
      
        '       FROM    PESSOA P, PESSOA PAT, PESSOAFISICA PF, EVOLFUNCPR' +
        'EV EV,'
      
        '               DETCALCULO D, CARGOEXT CEXT, CARGOXNIVEL CN, NIVE' +
        'L N'
      '       WHERE   EV.IDPESSOA       = :idpessoa'
      '       AND     P.IDPESSOA        = EV.IDPESSOA'
      '       AND     PF.IDPESSOA       = EV.IDPESSOA'
      '       AND     PAT.IDPESSOA      = EV.IDPESSJUR'
      '       AND     CEXT.IDCARGOEXT   = EV.IDCARGOEXT'
      '       AND     D.IDPESSOA        = EV.IDPESSOA'
      
        '       AND     D.IDCALCULO =  ( SELECT MAX(IDCALCULO) FROM DETCA' +
        'LCULO'
      '                                WHERE  IDPESSOA = :idpessoa'
      
        '                                AND    UPPER(DESCRICAO) LIKE '#39'%C' +
        'ÓDIGO DO CARGO NA DIB:%'#39')'
      '       AND     RTRIM(D.VALOR) = RTRIM(CEXT.CODIGO)'
      
        '       AND     UPPER(D.DESCRICAO) LIKE '#39'%CÓDIGO DO CARGO NA DIB:' +
        '%'#39
      ''
      '      AND CN.IDCARGOEXT(+)        = EV.IDCARGOEXT'
      '      AND CN.IDPESSJUR(+)         = EV.IDPESSJUR'
      '      AND CN.DATAFIM IS NULL'
      '      AND CN.IDNIVEL              = N.IDNIVEL(+)'
      '      AND CN.IDPESSJUR            = N.IDPESSJUR(+)'
      
        '      AND CN.DATAVIGENCIA = (SELECT MAX(DATAVIGENCIA) FROM CARGO' +
        'XNIVEL WHERE IDPESSJUR = CN.IDPESSJUR AND IDCARGOEXT = CN.IDCARG' +
        'OEXT AND DATAFIM IS NULL)'
      ''
      ''
      'ORDER BY EV.DATAINICIO DESC')
    PictureMasks.Strings = (
      
        'VALORRESULT'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]' +
        '#[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[' +
        '#][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#' +
        '[#][#]]]}'#9'T'#9'T'
      
        'VALORRESERVA'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#' +
        '[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#' +
        ']]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 255
    Top = 262
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idPessoa'
        ParamType = ptUnknown
        Value = 386000
      end
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptUnknown
      end>
  end
  object dsEvolFuncCargo: TwwDataSource
    DataSet = qryEvolFuncCargo
    Left = 258
    Top = 263
  end
  object qryEvolFuncao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'000'#39' AS CODIGO, SYSDATE AS DATAINICIO, SYSDATE AS DATAFI' +
        'NAL,'
      '       '#39'0000000'#39' AS PERCPBC, '#39'XX'#39' AS MODO,'
      
        '       '#39'                                                  '#39' AS N' +
        'OME,'
      '       '#39'                              '#39' AS DESCCONTROLE,'
      '       '#39'01/01/0001'#39' AS DATACONTROLE '
      'FROM DUAL'
      'where 1=2')
    UpdateObject = updEvolFuncao
    PictureMasks.Strings = (
      
        'VALORRESULT'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]' +
        '#[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[' +
        '#][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#' +
        '[#][#]]]}'#9'T'#9'T'
      
        'VALORRESERVA'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#' +
        '[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#' +
        ']]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 485
    Top = 155
  end
  object dsEvolFuncao: TwwDataSource
    DataSet = qryEvolFuncao
    Left = 482
    Top = 156
  end
  object qryEnqSecao2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  0   AS ORDEM,'
      '        0   AS IDPESSOA,'
      '        '#39'                                        '#39' AS NOMEITEM,'
      '        '#39'                                        '#39' AS DESCITEM,'
      '        0   AS VALORITEM,'
      
        '        '#39'                                        '#39' AS DESCITEMPE' +
        'RC,'
      '        '#39'000.00'#39'   AS PERCITEM'
      'FROM    DUAL'
      ' '
      ' '
      ' '
      '')
    UpdateObject = updEnqSecao2
    PictureMasks.Strings = (
      
        'VALORRESULT'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]' +
        '#[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[' +
        '#][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#' +
        '[#][#]]]}'#9'T'#9'T'
      
        'VALORRESERVA'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#' +
        '[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#' +
        ']]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 147
    Top = 370
  end
  object dsEnqSecao2: TwwDataSource
    DataSet = qryEnqSecao2
    Left = 148
    Top = 368
  end
  object updEnqSecao2: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  ORDEM = :ORDEM,'
      '  IDPESSOA = :IDPESSOA,'
      '  NOMEITEM = :NOMEITEM,'
      '  DESCITEM = :DESCITEM,'
      '  VALORITEM = :VALORITEM,'
      '  DESCITEMPERC = :DESCITEMPERC,'
      '  PERCITEM = :PERCITEM'
      'where'
      '  ORDEM = :OLD_ORDEM and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  NOMEITEM = :OLD_NOMEITEM and'
      '  DESCITEM = :OLD_DESCITEM and'
      '  VALORITEM = :OLD_VALORITEM and'
      '  DESCITEMPERC = :OLD_DESCITEMPERC and'
      '  PERCITEM = :OLD_PERCITEM')
    InsertSQL.Strings = (
      'insert into DUAL'
      
        '  (ORDEM, IDPESSOA, NOMEITEM, DESCITEM, VALORITEM, DESCITEMPERC,' +
        ' '
      'PERCITEM)'
      'values'
      '  (:ORDEM, :IDPESSOA, :NOMEITEM, :DESCITEM, :VALORITEM, '
      ':DESCITEMPERC, '
      '   :PERCITEM)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  ORDEM = :OLD_ORDEM and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  NOMEITEM = :OLD_NOMEITEM and'
      '  DESCITEM = :OLD_DESCITEM and'
      '  VALORITEM = :OLD_VALORITEM and'
      '  DESCITEMPERC = :OLD_DESCITEMPERC and'
      '  PERCITEM = :OLD_PERCITEM')
    Left = 148
    Top = 371
  end
  object updEvolFuncao: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  CODIGO = :CODIGO,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  PERCPBC = :PERCPBC,'
      '  MODO = :MODO,'
      '  NOME = :NOME,'
      '  DESCCONTROLE = :DESCCONTROLE,'
      '  DATACONTROLE = :DATACONTROLE'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into DUAL'
      
        '  (CODIGO, DATAINICIO, DATAFINAL, PERCPBC, MODO, NOME, DESCCONTR' +
        'OLE, DATACONTROLE)'
      'values'
      
        '  (:CODIGO, :DATAINICIO, :DATAFINAL, :PERCPBC, :MODO, :NOME, :DE' +
        'SCCONTROLE, '
      '   :DATACONTROLE)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 486
    Top = 156
  end
  object DsPlanos: TwwDataSource
    DataSet = qryPlanos
    Left = 488
    Top = 15
  end
  object UPDTelefones: TUpdateSQL
    Left = 292
    Top = 312
  end
  object qrySoElegivel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '       DECODE(DP.MATRICULA,NULL,EL.MATRICULA,DP.MATRICULA) AS MA' +
        'TRICULA,'
      '       P.NOME,'
      '       P.NUMDOCUMENTO,'
      '       PF.NOMEPAI,'
      '       PF.NOMEMAE,'
      '       PF.DATANASC,'
      '       DECODE(PF.SEXO,'#39'M'#39', '#39'Masculino'#39','#39'F'#39','#39'Feminino'#39') AS SEXO,'
      '       DECODE(PF.ESTCIVIL,'
      '        '#39'S'#39', '#39'Solteiro(a)'#39','
      '        '#39'C'#39', '#39'Casado(a) ou Equiparado(a)'#39','
      '        '#39'D'#39', '#39'Divorciado(a)'#39','
      '        '#39'E'#39', '#39'Desquitado(a)'#39','
      '        '#39'J'#39', '#39'Separado(a) Judicial'#39','
      '        '#39'V'#39', '#39'Viúvo(a)'#39','
      '        '#39'M'#39', '#39'Marital'#39','
      '        '#39'P'#39', '#39'Separado(a)'#39','
      '        '#39'O'#39', '#39'Outros'#39')  AS ESTADOCIVIL,'
      '       P.EMAIL,'
      '       '#39'  '#39' AS SALTOTAL,'
      '       '#39'  '#39' AS DATAADMISSAO,'
      '       '#39'  '#39' AS DATADEMISSAO,'
      '       '#39'  '#39' AS NIVEL,'
      '       '#39'  '#39' AS FLGDIRETOR,'
      ''
      '       '#39'  '#39' AS TIPOFLGDIRETOR,'
      ''
      '       '#39'  '#39' AS SITPART,'
      '       '#39'  '#39' AS NOMECARGO,'
      '       '#39'  '#39' AS FUNCAO,'
      '       '#39'  '#39' AS VINCULO,'
      '       PF.DATAMORTE,'
      '       '#39'  '#39' AS  FILIAL,'
      '       '#39'  '#39' AS LOTACAOFISICA,'
      '       '#39'  '#39' AS NOMEVALORBASE1,'
      '       0  AS VALORBASE1,'
      '       '#39'  '#39' AS NOMEVALORBASE2,'
      '       '#39'  '#39' AS VALORBASE2,'
      '       '#39'  '#39' AS NOMEVALORBASE3,'
      '       '#39'  '#39' AS VALORBASE3,'
      
        '       DECODE (PF.FLGMOLESTIAGRAVE, 1, '#39'Sim'#39', '#39'Não'#39') AS FLGMOLES' +
        'TIAGRAVE,'
      '       PF.DATAMOLESTIAGRAVE, PF.DATAFIMMOLESTIA,'
      
        '       DECODE(PF.FLGISENTOIRRF, 1,'#39'Isento'#39','#39'Recolhe'#39') AS SITIRRF' +
        ','
      '       PF.FLGBLOQUEIO,'
      '       PA.NOMENACIONALIDADE,'
      '       PF.CODESTADO,'
      '       CID.NOME AS CIDADE,'
      '       PF.NUMDEPIRRF,'
      '       PF.NUMDEPSALF,'
      '       PF.NUMDEPTOT,'
      '       PF.TIPOSANG,'
      '       '#39'     '#39' AS SITPLANOPREV,'
      
        '       DECODE (PF.CORPESSOA, 2, '#39'Branca'#39', 4, '#39'Negra'#39', 6, '#39'Amarel' +
        'o'#39', 8, '#39'Parda'#39', 0, '#39'Indígena'#39' ) AS CORPESSOA,'
      
        '       DECODE (PF.FLGDEFICIENTE, 1, '#39'Sim'#39', '#39'Não'#39') AS FLGDEFICIEN' +
        'TE,'
      '       PF.INICIOINVALIDEZ,'
      '       PF.FIMINVALIDEZ,'
      '       GR.DESCRICAO AS GRAUINSTRUCAO,'
      '       IM.IMAGEM,'
      '       '#39'  '#39' AS SITUACAONAPATRO,'
      '       '#39'  '#39' AS PATRO,'
      '       0 AS IDPESSJUR,'
      '       0 AS IDPLANOPREV,'
      '       '#39'  '#39' AS PLANO,'
      '       '#39'  '#39' AS SEQPROPOSTA,'
      '       0 AS INSCRICAONUMERO,'
      '       '#39' '#39'  AS INSCRICAODATA,'
      '       0 AS IDRGELEGBENEF,'
      '       '#39' '#39' AS DATACANCELAMENTO,'
      '       '#39'  '#39' AS DESCRICAO'
      ',TO_DATE(NULL,'#39'DD/MM/YYYY'#39') AS DTNOMEACAO '
      ',TO_DATE(NULL,'#39'DD/MM/YYYY'#39') AS DTEXONERACAO,'
      
        '       DECODE(PF.FLGISENTOIRRF,0,'#39'Não'#39','#39'1'#39','#39'Sim'#39') AS FLGISENTOIR' +
        'RF , '
      
        '       DECODE(PF.FLGSOMAIRSUPINSS,0,'#39'Não'#39','#39'1'#39','#39'Sim'#39') AS FLGSOMAI' +
        'RSUPINSS,'
      '       PF.EMAILFUNCEF,'
      '       '#39' '#39' AS Trgdtinclusao,'
      '      '#39' '#39' AS  Trguserinclusao,'
      '       '#39' '#39' AS Trgdtalteracao,'
      '       '#39' '#39' AS DATACANCEL,'
      '       '#39' '#39' AS Idsitdependente,'
      '       '#39' '#39' AS SITUACAO,'
      '       '#39' '#39' AS DATACANCELA'
      '       --SIG 21868  -INICIO '
      
        '       ,DECODE(EL.IDPESSJUR, 1,DECODE(TRIM(PF.FLGDEFICIENTE), 1,' +
        ' '#39'Física'#39', 2, '#39'Não é Portador'#39', 3, '#39'Auditiva'#39', 4, '#39'Visual'#39', 5, '#39 +
        'Intelectual (Mental)'#39', 6, '#39'Múltipla'#39', 7, '#39'Reabilitado'#39'),PF.DESCD' +
        'EFICIENCIA) AS TPDEFICIENCIA'
      '       ,'#39' '#39' AS IDRESPONSAVEL'
      '       ,'#39' '#39' AS CODTIPORESPONSAVEL'
      '       --SIG 21868  -FIM'
      'FROM'
      '      PESSOA P,'
      '      PESSOAFISICA PF,'
      '      PAIS PA,'
      '      IMAGENS IM,'
      '      ELEGPATRO EL,'
      '      GRINSTR GR,'
      '      CIDADES CID,'
      '      DEPENTIT DP'
      'WHERE'
      '      (P.IDPESSOA      = :IDPESSOA)'
      'AND   DP.IDPESSOA      = :IDPESSOA'
      'AND   DP.IDTITULAR     = :IDTITULAR'
      'AND   (EL.IDPESSOA(+)  = P.IDPESSOA)'
      'AND   (P.IDPESSOA      = PF.IDPESSOA)'
      'AND   (PA.IDPAIS(+)    = PF.IDPAIS)'
      'AND   (PF.IDCIDADES    = CID.IDCIDADES(+))'
      'AND   (P.IDIMAGEM      = IM.IDIMAGEM(+))'
      'AND   (PF.IDGRINSTR = GR.IDGRINSTR(+))'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 432
    Top = 530
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end>
    object qrySoElegivelMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qrySoElegivelNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qrySoElegivelNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qrySoElegivelNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      Size = 50
    end
    object qrySoElegivelNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      Size = 50
    end
    object qrySoElegivelDATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
    object qrySoElegivelSEXO: TStringField
      FieldName = 'SEXO'
      Size = 9
    end
    object qrySoElegivelESTADOCIVIL: TStringField
      FieldName = 'ESTADOCIVIL'
      Size = 26
    end
    object qrySoElegivelEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object qrySoElegivelSALTOTAL: TStringField
      FieldName = 'SALTOTAL'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelDATAADMISSAO: TStringField
      FieldName = 'DATAADMISSAO'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelDATADEMISSAO: TStringField
      FieldName = 'DATADEMISSAO'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelNIVEL: TStringField
      FieldName = 'NIVEL'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelSITPART: TStringField
      FieldName = 'SITPART'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelFUNCAO: TStringField
      FieldName = 'FUNCAO'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelNOMECARGO: TStringField
      FieldName = 'NOMECARGO'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelVINCULO: TStringField
      FieldName = 'VINCULO'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelDATAMORTE: TDateTimeField
      FieldName = 'DATAMORTE'
    end
    object qrySoElegivelFILIAL: TStringField
      FieldName = 'FILIAL'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelNOMEVALORBASE1: TStringField
      FieldName = 'NOMEVALORBASE1'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
    end
    object qrySoElegivelNOMEVALORBASE2: TStringField
      FieldName = 'NOMEVALORBASE2'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelVALORBASE2: TStringField
      FieldName = 'VALORBASE2'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelNOMEVALORBASE3: TStringField
      FieldName = 'NOMEVALORBASE3'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelVALORBASE3: TStringField
      FieldName = 'VALORBASE3'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelFLGMOLESTIAGRAVE: TStringField
      FieldName = 'FLGMOLESTIAGRAVE'
      Size = 3
    end
    object qrySoElegivelDATAMOLESTIAGRAVE: TDateTimeField
      FieldName = 'DATAMOLESTIAGRAVE'
    end
    object qrySoElegivelSITIRRF: TStringField
      FieldName = 'SITIRRF'
      Size = 7
    end
    object qrySoElegivelFLGBLOQUEIO: TFloatField
      FieldName = 'FLGBLOQUEIO'
    end
    object qrySoElegivelNOMENACIONALIDADE: TStringField
      FieldName = 'NOMENACIONALIDADE'
      Size = 30
    end
    object qrySoElegivelCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qrySoElegivelNUMDEPIRRF: TFloatField
      FieldName = 'NUMDEPIRRF'
    end
    object qrySoElegivelNUMDEPSALF: TFloatField
      FieldName = 'NUMDEPSALF'
    end
    object qrySoElegivelNUMDEPTOT: TFloatField
      FieldName = 'NUMDEPTOT'
    end
    object qrySoElegivelTIPOSANG: TStringField
      FieldName = 'TIPOSANG'
      Size = 3
    end
    object qrySoElegivelSITPLANOPREV: TStringField
      FieldName = 'SITPLANOPREV'
      FixedChar = True
      Size = 5
    end
    object qrySoElegivelCORPESSOA: TStringField
      FieldName = 'CORPESSOA'
      Size = 8
    end
    object qrySoElegivelFLGDEFICIENTE: TStringField
      FieldName = 'FLGDEFICIENTE'
      Size = 3
    end
    object qrySoElegivelINICIOINVALIDEZ: TDateTimeField
      FieldName = 'INICIOINVALIDEZ'
    end
    object qrySoElegivelFIMINVALIDEZ: TDateTimeField
      FieldName = 'FIMINVALIDEZ'
    end
    object qrySoElegivelGRAUINSTRUCAO: TStringField
      FieldName = 'GRAUINSTRUCAO'
      Size = 30
    end
    object qrySoElegivelIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qrySoElegivelSITUACAONAPATRO: TStringField
      FieldName = 'SITUACAONAPATRO'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelPATRO: TStringField
      FieldName = 'PATRO'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qrySoElegivelIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qrySoElegivelPLANO: TStringField
      FieldName = 'PLANO'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelSEQPROPOSTA: TStringField
      FieldName = 'SEQPROPOSTA'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qrySoElegivelINSCRICAODATA: TStringField
      FieldName = 'INSCRICAODATA'
      FixedChar = True
      Size = 1
    end
    object qrySoElegivelIDRGELEGBENEF: TFloatField
      FieldName = 'IDRGELEGBENEF'
    end
    object qrySoElegivelFLGDIRETOR: TStringField
      FieldName = 'FLGDIRETOR'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qrySoElegivelDATACANCELAMENTO: TStringField
      FieldName = 'DATACANCELAMENTO'
      FixedChar = True
      Size = 1
    end
    object qrySoElegivelDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 8
    end
    object qrySoElegivelTIPOFLGDIRETOR: TStringField
      FieldName = 'TIPOFLGDIRETOR'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelDTNOMEACAO: TDateTimeField
      FieldName = 'DTNOMEACAO'
    end
    object qrySoElegivelDTEXONERACAO: TDateTimeField
      FieldName = 'DTEXONERACAO'
    end
    object qrySoElegivelFLGISENTOIRRF: TStringField
      FieldName = 'FLGISENTOIRRF'
      Size = 3
    end
    object qrySoElegivelFLGSOMAIRSUPINSS: TStringField
      FieldName = 'FLGSOMAIRSUPINSS'
      Size = 3
    end
    object dtmfldSoElegivelDATAFIMMOLESTIA: TDateTimeField
      FieldName = 'DATAFIMMOLESTIA'
    end
    object qrySoElegivelEMAILFUNCEF: TStringField
      FieldName = 'EMAILFUNCEF'
      Size = 100
    end
    object qrySoElegivelLOTACAOFISICA: TStringField
      FieldName = 'LOTACAOFISICA'
      FixedChar = True
      Size = 2
    end
    object qrySoElegivelTRGDTINCLUSAO: TStringField
      FieldName = 'TRGDTINCLUSAO'
      FixedChar = True
      Size = 1
    end
    object qrySoElegivelTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      FixedChar = True
      Size = 1
    end
    object qrySoElegivelTRGDTALTERACAO: TStringField
      FieldName = 'TRGDTALTERACAO'
      FixedChar = True
      Size = 1
    end
    object qrySoElegivelDATACANCEL: TStringField
      FieldName = 'DATACANCEL'
      FixedChar = True
      Size = 1
    end
    object qrySoElegivelIDSITDEPENDENTE: TStringField
      FieldName = 'IDSITDEPENDENTE'
      FixedChar = True
      Size = 1
    end
    object qrySoElegivelSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object qrySoElegivelDATACANCELA: TStringField
      FieldName = 'DATACANCELA'
      FixedChar = True
      Size = 1
    end
    object qrySoElegivelTPDEFICIENCIA: TStringField
      FieldName = 'TPDEFICIENCIA'
      Size = 25
    end
    object qrySoElegivelIDRESPONSAVEL: TStringField
      FieldName = 'IDRESPONSAVEL'
      Size = 60
    end
    object qrySoElegivelCODTIPORESPONSAVEL: TStringField
      FieldName = 'CODTIPORESPONSAVEL'
      Size = 5
    end
  end
  object updFuncao: TUpdateSQL
    Left = 360
    Top = 58
  end
  object updAdicConpens: TUpdateSQL
    Left = 391
    Top = 21
  end
  object CdsHistReserva: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 8
      end
      item
        Name = 'MESREFERENCIA'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'FLGENTRADA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SALDOCOTAS'
        DataType = ftFloat
      end
      item
        Name = 'VALORINDICE'
        DataType = ftFloat
      end
      item
        Name = 'SALDOREAL'
        DataType = ftFloat
      end
      item
        Name = 'VLRCOTAS'
        DataType = ftFloat
      end
      item
        Name = 'VLRREAL'
        DataType = ftFloat
      end
      item
        Name = 'NOME'
        Attributes = [faFixed]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DATAALIMENTACAO'
        DataType = ftDateTime
      end
      item
        Name = 'DATAMOV'
        DataType = ftDateTime
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NOMEBENEF'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NOMECONTRIB'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDCONTRIBUICAO'
        DataType = ftFloat
      end
      item
        Name = 'IDBENEFICIO'
        DataType = ftFloat
      end
      item
        Name = 'FLGCOLETIVA'
        DataType = ftFloat
      end
      item
        Name = 'INDICEREAJUSTE'
        DataType = ftFloat
      end
      item
        Name = 'ANALITICOSINTETI'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FLGCONTROLE'
        DataType = ftFloat
      end
      item
        Name = 'FLGTITULARCOLET'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IDTIPORESERVA'
        DataType = ftFloat
      end
      item
        Name = 'DATAMAX'
        DataType = ftDateTime
      end
      item
        Name = 'COTVALOR'
        DataType = ftFloat
      end
      item
        Name = 'PATRO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftMemo
        Size = 500
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'PrvHistReserva'
    StoreDefs = True
    Left = 528
    Top = 56
    object CdsHistReservaCODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 8
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 8
    end
    object CdsHistReservaMESREFERENCIA: TStringField
      DisplayLabel = 'Referência'
      DisplayWidth = 8
      FieldName = 'MESREFERENCIA'
      Size = 7
    end
    object CdsHistReservaFLGENTRADA: TStringField
      DisplayLabel = 'E/S'
      DisplayWidth = 3
      FieldName = 'FLGENTRADA'
      Size = 1
    end
    object CdsHistReservaSALDOCOTAS: TFloatField
      DisplayLabel = 'Saldo Cotas'
      DisplayWidth = 18
      FieldName = 'SALDOCOTAS'
    end
    object CdsHistReservaVALORINDICE: TFloatField
      DisplayLabel = 'Valor Índice'
      DisplayWidth = 12
      FieldName = 'VALORINDICE'
    end
    object CdsHistReservaSALDOREAL: TFloatField
      DisplayLabel = 'Saldo Real'
      DisplayWidth = 13
      FieldName = 'SALDOREAL'
    end
    object CdsHistReservaVLRCOTAS: TFloatField
      DisplayLabel = 'Valor Cotas'
      DisplayWidth = 18
      FieldName = 'VLRCOTAS'
    end
    object CdsHistReservaVLRREAL: TFloatField
      DisplayLabel = 'Valor Real'
      DisplayWidth = 14
      FieldName = 'VLRREAL'
    end
    object CdsHistReservaNOME: TStringField
      DisplayLabel = 'Nome da Reserva '
      DisplayWidth = 43
      FieldName = 'NOME'
      FixedChar = True
      Size = 50
    end
    object CdsHistReservaDATAALIMENTACAO: TDateTimeField
      DisplayLabel = 'Alimentação'
      DisplayWidth = 10
      FieldName = 'DATAALIMENTACAO'
    end
    object CdsHistReservaDATAMOV: TDateTimeField
      DisplayLabel = 'Movimento'
      DisplayWidth = 10
      FieldName = 'DATAMOV'
    end
    object CdsHistReservaMOESIGLA: TStringField
      DisplayLabel = 'Índice'
      DisplayWidth = 11
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object CdsHistReservaNOMEBENEF: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 34
      FieldName = 'NOMEBENEF'
      Size = 60
    end
    object CdsHistReservaNOMECONTRIB: TStringField
      DisplayLabel = 'Contribuição'
      DisplayWidth = 40
      FieldName = 'NOMECONTRIB'
      Size = 60
    end
    object CdsHistReservaIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
      Visible = False
    end
    object CdsHistReservaIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Visible = False
    end
    object CdsHistReservaFLGCOLETIVA: TFloatField
      FieldName = 'FLGCOLETIVA'
      Visible = False
    end
    object CdsHistReservaINDICEREAJUSTE: TFloatField
      FieldName = 'INDICEREAJUSTE'
      Visible = False
    end
    object CdsHistReservaANALITICOSINTETI: TStringField
      FieldName = 'ANALITICOSINTETI'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsHistReservaFLGCONTROLE: TFloatField
      FieldName = 'FLGCONTROLE'
      Visible = False
    end
    object CdsHistReservaFLGTITULARCOLET: TStringField
      FieldName = 'FLGTITULARCOLET'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsHistReservaIDTIPORESERVA: TFloatField
      FieldName = 'IDTIPORESERVA'
    end
    object CdsHistReservaDATAMAX: TDateTimeField
      FieldName = 'DATAMAX'
    end
    object CdsHistReservaCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
    end
    object CdsHistReservaPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object CdsHistReservaOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 500
    end
  end
  object PrvHistReserva: TDataSetProvider
    DataSet = qryHistReserva
    Constraints = True
    Left = 8
    Top = 104
  end
  object qryValoresBaseDepentit: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  DP.IDPESSOA,'
      '  DP.IDDEPENDENCIA,'
      '  DP.VALORBASE1,'
      '  DP.VALORBASE2,'
      '  DP.VALORBASE3,'
      '  PT.NOMEVALORBASE1,'
      '  PT.NOMEVALORBASE2,'
      '  PT.NOMEVALORBASE3,'
      '  EL.IDPESSJUR'
      'FROM DEPENTIT DP, ELEGPATRO EL, PATRO PT'
      'WHERE DP.IDPESSOA = :idpessoa AND'
      '      dp.idtitular = :idtitular and'
      '      EL.IDPESSOA = DP.IDTITULAR AND'
      '      EL.IDPESSJUR = PT.IDPESSOA'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 12
    Top = 373
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idtitular'
        ParamType = ptInput
      end>
  end
  object DsValoresBaseDepentit: TwwDataSource
    DataSet = qryValoresBaseDepentit
    Left = 15
    Top = 372
  end
  object qryRunTime: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 208
    Top = 369
  end
  object qryAcaoJudicial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PROCJUD'
      'WHERE'
      '      (IDPESSOA = :IIDPESSOA)')
    PictureMasks.Strings = (
      
        'VALORRESULT'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]' +
        '#[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[' +
        '#][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#' +
        '[#][#]]]}'#9'T'#9'T'
      
        'VALORRESERVA'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#' +
        '[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#' +
        ']]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 192
    Top = 57
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryAcaoJudicialIDPROCJUD: TFloatField
      FieldName = 'IDPROCJUD'
      Origin = 'BASEDADOS.PROCJUD.IDPROCJUD'
    end
    object qryAcaoJudicialIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PROCJUD.IDPESSOA'
    end
    object qryAcaoJudicialIDAGENCIABANCARIA: TFloatField
      FieldName = 'IDAGENCIABANCARIA'
      Origin = 'BASEDADOS.PROCJUD.IDAGENCIABANCARIA'
    end
    object qryAcaoJudicialNUMEROPROCESSO: TStringField
      FieldName = 'NUMEROPROCESSO'
      Origin = 'BASEDADOS.PROCJUD.NUMEROPROCESSO'
    end
    object qryAcaoJudicialIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
      Origin = 'BASEDADOS.PROCJUD.IDCBANCARIA'
    end
    object qryAcaoJudicialCODSECAO: TStringField
      FieldName = 'CODSECAO'
      Origin = 'BASEDADOS.PROCJUD.CODSECAO'
      FixedChar = True
      Size = 2
    end
    object qryAcaoJudicialUFSECAO: TStringField
      FieldName = 'UFSECAO'
      Origin = 'BASEDADOS.PROCJUD.UFSECAO'
      FixedChar = True
      Size = 2
    end
    object qryAcaoJudicialAUTORACAO: TStringField
      FieldName = 'AUTORACAO'
      Origin = 'BASEDADOS.PROCJUD.AUTORACAO'
      Size = 50
    end
    object qryAcaoJudicialDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'BASEDADOS.PROCJUD.DATAINICIO'
    end
    object qryAcaoJudicialDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
      Origin = 'BASEDADOS.PROCJUD.DATAFINAL'
    end
    object qryAcaoJudicialSITPROCESSO: TFloatField
      FieldName = 'SITPROCESSO'
      Origin = 'BASEDADOS.PROCJUD.SITPROCESSO'
    end
    object qryAcaoJudicialIDBANCO: TFloatField
      FieldName = 'IDBANCO'
      Origin = 'BASEDADOS.PROCJUD.IDBANCO'
    end
    object qryAcaoJudicialCODOPERACAO: TStringField
      FieldName = 'CODOPERACAO'
      Origin = 'BASEDADOS.PROCJUD.CODOPERACAO'
      FixedChar = True
      Size = 3
    end
    object qryAcaoJudicialCODVARA: TStringField
      FieldName = 'CODVARA'
      Origin = 'BASEDADOS.PROCJUD.CODVARA'
      FixedChar = True
      Size = 2
    end
    object qryAcaoJudicialNOMEVARA: TStringField
      FieldName = 'NOMEVARA'
      Origin = 'BASEDADOS.PROCJUD.NOMEVARA'
      Size = 25
    end
    object qryAcaoJudicialTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.PROCJUD.TRGDTINCLUSAO'
    end
    object qryAcaoJudicialTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.PROCJUD.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryAcaoJudicialTIPOACAO: TFloatField
      FieldName = 'TIPOACAO'
      Origin = 'BASEDADOS.PROCJUD.TIPOACAO'
    end
    object qryAcaoJudicialPERCACAO: TFloatField
      FieldName = 'PERCACAO'
      Origin = 'BASEDADOS.PROCJUD.PERCACAO'
    end
    object qryAcaoJudicialFLGFAZDEPOSITO: TFloatField
      FieldName = 'FLGFAZDEPOSITO'
      Origin = 'BASEDADOS.PROCJUD.FLGFAZDEPOSITO'
    end
    object qryAcaoJudicialNOMESECAO: TStringField
      FieldName = 'NOMESECAO'
      Origin = 'BASEDADOS.PROCJUD.FLGFAZDEPOSITO'
      Size = 25
    end
  end
  object qryCompensaIR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '  CM.COMPENSAIRRF'
      ''
      'WHERE'
      '  IDPESSOA = :IDPESSOA    ')
    ValidateWithMask = True
    Left = 326
    Top = 155
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCompensaIRIDCOMPIRRF: TFloatField
      FieldName = 'IDCOMPIRRF'
      Origin = 'BASEDADOS.COMPENSAIRRF.IDCOMPIRRF'
    end
    object qryCompensaIRIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.COMPENSAIRRF.IDPESSOA'
    end
    object qryCompensaIRSALDOCOMP: TFloatField
      FieldName = 'SALDOCOMP'
      Origin = 'BASEDADOS.COMPENSAIRRF.SALDOCOMP'
    end
    object qryCompensaIRCOMPTOTAL: TFloatField
      FieldName = 'COMPTOTAL'
      Origin = 'BASEDADOS.COMPENSAIRRF.COMPTOTAL'
    end
    object qryCompensaIRANOMESINICIO: TStringField
      FieldName = 'ANOMESINICIO'
      Origin = 'BASEDADOS.COMPENSAIRRF.ANOMESINICIO'
      FixedChar = True
      Size = 7
    end
    object qryCompensaIRANOMESFIM: TStringField
      FieldName = 'ANOMESFIM'
      Origin = 'BASEDADOS.COMPENSAIRRF.ANOMESFIM'
      FixedChar = True
      Size = 7
    end
    object qryCompensaIRTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.COMPENSAIRRF.TRGDTINCLUSAO'
    end
    object qryCompensaIRTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.COMPENSAIRRF.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryCompensaIRNUMEROPROCESSO: TStringField
      FieldName = 'NUMEROPROCESSO'
      Origin = 'BASEDADOS.COMPENSAIRRF.NUMEROPROCESSO'
    end
    object qryCompensaIRCODVARA: TStringField
      FieldName = 'CODVARA'
      Origin = 'BASEDADOS.COMPENSAIRRF.CODVARA'
      FixedChar = True
      Size = 2
    end
    object qryCompensaIRNOMEVARA: TStringField
      FieldName = 'NOMEVARA'
      Origin = 'BASEDADOS.COMPENSAIRRF.NOMEVARA'
    end
  end
  object qryDetalheRegra: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  D.IDPESSOA,'
      '  D.IDPROCJUD,'
      '  D.IDREGRA,'
      '  R.NOMEREGRA,'
      '  D.IDRUBRICA,'
      '  P.DESCRICAO,'
      '  D.FLGATIVA'
      ''
      'FROM'
      '  REGRA R,'
      '  CM.DETPROCJUD D,'
      '  PROVDESC P'
      ''
      'WHERE'
      '  D.IDPROCJUD = :IDPROCJUD AND'
      '  D.IDPESSOA  = :IDPESSOA  AND'
      '  R.IDREGRA   = D.IDREGRA  AND'
      '  D.IDRUBRICA = P.IDPROVENTO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGATIVA;CheckBox;0;1')
    ValidateWithMask = True
    Left = 423
    Top = 154
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPROCJUD'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsDetalheRegra: TwwDataSource
    AutoEdit = False
    DataSet = qryDetalheRegra
    Left = 427
    Top = 154
  end
  object qryATS: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.IDPESSJUR,       E.IDPESSOA,       E.SEQHISTFUNC,'
      '       E.IDPESSJURCG,     E.IDCARGOEXT,'
      '       E.IDPESSJURFG,     E.IDFUNCAO,'
      '       E.DATAINICIO,      E.DATAFINAL,'
      '       E.PERC1AC,         E.PERC2AC,'
      '       E.PERCATS,         E.PERCINSALUB,'
      '       E.PERCPERICUL,     E.PERCFUNCAO,'
      '       E.MODOFUNCAO,'
      '       E.ORIGEM,'
      '       E.FLGSITPART,'
      '       DECODE(E.ORIGEM, '#39'I'#39', '#39'Interface'#39','
      '                        '#39'C'#39', '#39'Cadastrado'#39','
      '                        '#39'E'#39', '#39'Evento de Manutenção'#39','
      '                        '#39'R'#39', '#39'Retroativo'#39') AS DESCORIGEM,'
      '       DECODE(E.FLGSITPART,'#39'AS'#39', '#39'Assistido'#39','
      '                           '#39'AT'#39', '#39'Ativo'#39','
      '                                 '#39'Outros'#39') AS DESCSITCADASTRADA'
      ''
      'FROM   EVOLFUNCPREV E'
      'WHERE  E.IDPESSJUR      = :IDPESSJUR'
      'AND    E.IDPESSOA       = :IDPESSOA'
      'AND    PERCATS IS NOT NULL'
      'AND    PERCATS > 0'
      'ORDER BY E.DATAINICIO DESC '
      ''
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGSITPART;CustomEdit;dbcSituacao')
    ValidateWithMask = True
    Left = 56
    Top = 58
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 76644
      end>
    object qryATSIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryATSIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryATSSEQHISTFUNC: TFloatField
      FieldName = 'SEQHISTFUNC'
    end
    object qryATSIDPESSJURCG: TFloatField
      FieldName = 'IDPESSJURCG'
    end
    object qryATSIDCARGOEXT: TFloatField
      FieldName = 'IDCARGOEXT'
    end
    object qryATSIDPESSJURFG: TFloatField
      FieldName = 'IDPESSJURFG'
    end
    object qryATSIDFUNCAO: TFloatField
      FieldName = 'IDFUNCAO'
    end
    object qryATSDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
    end
    object qryATSDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
    end
    object qryATSPERC1AC: TFloatField
      FieldName = 'PERC1AC'
    end
    object qryATSPERC2AC: TFloatField
      FieldName = 'PERC2AC'
    end
    object qryATSPERCATS: TFloatField
      FieldName = 'PERCATS'
    end
    object qryATSPERCINSALUB: TFloatField
      FieldName = 'PERCINSALUB'
    end
    object qryATSPERCPERICUL: TFloatField
      FieldName = 'PERCPERICUL'
    end
    object qryATSPERCFUNCAO: TFloatField
      FieldName = 'PERCFUNCAO'
    end
    object qryATSMODOFUNCAO: TStringField
      FieldName = 'MODOFUNCAO'
      FixedChar = True
      Size = 2
    end
    object qryATSORIGEM: TStringField
      FieldName = 'ORIGEM'
      FixedChar = True
      Size = 1
    end
    object qryATSFLGSITPART: TStringField
      FieldName = 'FLGSITPART'
      FixedChar = True
      Size = 2
    end
    object qryATSDESCORIGEM: TStringField
      FieldName = 'DESCORIGEM'
    end
    object qryATSSIT: TStringField
      FieldKind = fkCalculated
      FieldName = 'SIT'
      Calculated = True
    end
    object qryATSDESCSIT: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCSIT'
      Calculated = True
    end
    object qryATSDESCSITCADASTRADA: TStringField
      FieldName = 'DESCSITCADASTRADA'
      Size = 9
    end
  end
  object qryCargo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      E.IDPESSJUR,'
      '      E.IDPESSOA,'
      '      E.IDPESSJURCG,'
      '      E.IDCARGOEXT,'
      '      E.IDPESSJURFG,'
      '      E.IDFUNCAO,'
      '      E.DATAINICIO,'
      '      E.DATAFINAL,'
      '      E.PERC1AC,'
      '      E.PERC2AC,'
      '      E.PERCATS,'
      '      E.PERCINSALUB,'
      '      E.PERCPERICUL,'
      '      E.PERCFUNCAO,'
      '      E.MODOFUNCAO,'
      '      E.SEQHISTFUNC,'
      '      E.ORIGEM,'
      '      DECODE(E.MODOFUNCAO,'
      '            '#39'EF'#39', '#39'EFETIVO'#39','
      '            '#39'BC'#39' , '#39'BOLSA DE CARGO'#39' ) AS DESCMODO,'
      '      DECODE(E.FLGSITPART,   '#39'AS'#39',  '#39'ASSISTIDO'#39','
      '                             '#39'AT'#39',  '#39'ATIVO'#39','
      '                             '#39'OUTROS'#39') AS DESCSITCADASTRADA,'
      '      C.IDCARGOEXT,'
      '      C.CODIGO AS CODCARGO,'
      '      C.TITULO AS TITCARGO,'
      '      C.TIPO,'
      '      C.JORNADA,'
      '      C.FLGATIVO,'
      '      C.NOMERESUMIDO,'
      '      C.CBO,'
      '      DECODE(C.FLGATIVO, 1, '#39'ATIVA'#39','
      '                         0, '#39'DESATIVADA'#39','
      '                         2, '#39'EM EXTINçãO'#39') AS SITUACAO,'
      '      CAR.CODIGO AS CODCARREIRA,'
      '      CAR.NOME AS NOMECARREIRA,'
      '      PCS.CODIGO AS CODPCS,'
      '      N.CODIGO AS NIVEL,'
      '      N.IDNIVEL,'
      '      PCS.NOME AS NOMEPCS,'
      '      MAX(CN.DATAVIGENCIA) AS DATAVIGENCIA'
      ''
      'FROM'
      '      CARGOEXT C,'
      '      CARREIRA CAR,'
      '      PCS PCS,'
      '      NIVEL N,'
      '      CARGOXNIVEL CN,'
      '      EVOLFUNCPREV E ,'
      '('
      '      SELECT'
      '             MAX(DATAINICIO) AS DATAINICIO'
      ''
      '      FROM'
      '      EVOLFUNCPREV'
      ''
      'WHERE IDPESSOA = :idpessoa'
      '      AND IDPESSJUR = :idpessjur) DT'
      'WHERE  C.IDPESSJUR   = E.IDPESSJUR'
      'AND    C.IDCARGOEXT  =  E.IDCARGOEXT'
      'AND    C.TIPO        = '#39'C'#39
      'AND    CAR.IDCARREIRA(+)  = C.IDCARREIRA'
      'AND    PCS.IDPCS(+)       = C.IDPCS'
      'AND    CN.IDPESSJUR(+)    = C.IDPESSJUR'
      'AND    CN.IDCARGOEXT(+)   = C.IDCARGOEXT'
      'AND    CN.IDNIVEL      = N.IDNIVEL(+)'
      'AND   E.IDPESSOA = :idpessoa'
      'AND   E.IDPESSJUR  = :idpessjur'
      '      AND   E.DATAINICIO= DT.DATAINICIO'
      ''
      ''
      '      GROUP BY C.IDCARGOEXT,'
      '      C.CODIGO,'
      '      C.TITULO,'
      '      C.TIPO,'
      '      C.JORNADA,'
      '      C.FLGATIVO,'
      '      C.NOMERESUMIDO,'
      '      C.CBO,'
      '      C.FLGATIVO,'
      '      CAR.CODIGO,'
      '      CAR.NOME,'
      '      PCS.CODIGO,'
      '      N.IDNIVEL,'
      '      PCS.NOME ,'
      '      N.CODIGO,'
      '      E.IDPESSJUR,'
      '      E.IDPESSOA,'
      '      E.IDPESSJURCG,'
      '      E.IDCARGOEXT,'
      '      E.IDPESSJURFG,'
      '      E.IDFUNCAO,'
      '      E.DATAINICIO,'
      '      E.DATAFINAL,'
      '      E.PERC1AC,'
      '      E.PERC2AC,'
      '      E.PERCATS,'
      '      E.PERCINSALUB,'
      '      E.PERCPERICUL,'
      '      E.PERCFUNCAO,'
      '      E.MODOFUNCAO,'
      '      E.SEQHISTFUNC,'
      '      E.ORIGEM,'
      '      E.MODOFUNCAO,'
      '      E.FLGSITPART'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 557
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idpessjur'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idpessjur'
        ParamType = ptInput
      end>
  end
  object DScARGO: TwwDataSource
    DataSet = qryCargo
    Left = 557
    Top = 208
  end
  object qrySitFuncional: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  N.CODIGO AS NIVEL,'
      '  FILIAL.NOME,'
      '  EV.PERCATS,'
      '  EV.DATAINICIO,'
      '  EV.DATAFINAL,'
      '  PPP.SALPARTICIPACAO,'
      '  DECODE(EL.FLGDIRETOR, 1, '#39'Sim'#39', '#39'Não'#39') as FLGDIRETOR,'
      ''
      '  NVL(EL.FLGDIRETOR,0) AS TIPOFLGDIRETOR,'
      ''
      '  VF.DESCRICAO AS VINCULO,'
      '  C.CODIGO AS CODCARGO,'
      '  C.TITULO AS TITCARGO,'
      '  C.IDCARGOEXT,'
      '  EL.VALORBASE1,'
      '  EL.VALORBASE2,'
      '  EL.VALORBASE3,'
      '  EL.VALORBASE4,'
      '  EL.VALORBASE5,'
      '  EL.VALORBASE6,'
      '  NVL (PT.NOMEVALORBASE1, '#39'Opção 1'#39') AS NOMEVALORBASE1,'
      '  NVL (PT.NOMEVALORBASE2, '#39'Opção 2'#39') AS NOMEVALORBASE2,'
      '  NVL (PT.NOMEVALORBASE3, '#39'Opção 3'#39') AS NOMEVALORBASE3,'
      '  NVL (PT.NOMEVALORBASE4, '#39'Opção 4'#39') AS NOMEVALORBASE4,'
      '  NVL (PT.NOMEVALORBASE5, '#39'Opção 5'#39') AS NOMEVALORBASE5,'
      '  NVL (PT.NOMEVALORBASE6, '#39'Opção 6'#39') AS NOMEVALORBASE6'
      
        'FROM ELEGPATRO EL, PESSOA FILIAL, PARTPREVPLAN PPP, EVOLFUNCPREV' +
        ' EV, VINCULAFUNC VF, CARGOEXT C, PATRO PT,'
      '     CARGOXNIVEL CN, NIVEL N,'
      
        '     (SELECT idpessjur, idpessoa, MAX(DATAINICIO) AS DATAINICIO ' +
        'FROM EVOLFUNCPREV WHERE IDPESSOA = :IDPESSOA AND IDPESSJUR = :ID' +
        'PESSJUR and idcargoext is not null group by idpessjur, idpessoa)' +
        ' DT'
      'WHERE EL.IDPESSOA          = :IDPESSOA            AND'
      '      EL.IDESTAB           = FILIAL.IDPESSOA      AND'
      '      EL.IDPESSOA          = PPP.IDPESSOA(+)      AND'
      '      EL.IDPESSJUR         = PPP.IDPESSJUR(+)     AND'
      '      PPP.FLGDESATIVADO(+) = 0                    AND'
      '      EV.IDPESSOA(+)       = EL.IDPESSOA          AND'
      '      EV.IDPESSJUR(+)      = EL.IDPESSJUR         AND'
      '      EV.DATAINICIO        = DT.DATAINICIO        AND'
      '      ev.idpessjur         = dt.idpessjur         and'
      '      ev.idpessoa          = dt.idpessoa          and'
      ''
      '      EL.CODVINCULAFUNC    = VF.CODVINCULAFUNC(+) AND'
      '      EV.IDCARGOEXT        = C.IDCARGOEXT         AND'
      '      C.IDPESSJUR          = EL.IDPESSJUR         AND'
      '      C.TIPO               = '#39'C'#39'                  AND'
      '      EL.IDPESSJUR         = PT.IDPESSOA(+)       AND'
      '      CN.IDCARGOEXT(+)     = EV.IDCARGOEXT        AND'
      '      CN.IDPESSJUR(+)      = EV.IDPESSJUR         AND'
      '      CN.DATAFIM IS NULL                          AND'
      '      CN.IDNIVEL           = N.IDNIVEL(+)         AND'
      '      CN.IDPESSJUR         = N.IDPESSJUR(+)       AND'
      
        '      CN.DATAVIGENCIA      = (SELECT MAX(DATAVIGENCIA) FROM CARG' +
        'OXNIVEL WHERE IDPESSJUR = CN.IDPESSJUR AND IDCARGOEXT = CN.IDCAR' +
        'GOEXT AND DATAFIM IS NULL)'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 432
    Top = 263
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'idpessjur'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    object qrySitFuncionalNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qrySitFuncionalPERCATS: TFloatField
      FieldName = 'PERCATS'
    end
    object qrySitFuncionalDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
    end
    object qrySitFuncionalDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
    end
    object qrySitFuncionalSALPARTICIPACAO: TFloatField
      FieldName = 'SALPARTICIPACAO'
    end
    object qrySitFuncionalFLGDIRETOR: TStringField
      FieldName = 'FLGDIRETOR'
      Size = 3
    end
    object qrySitFuncionalVINCULO: TStringField
      FieldName = 'VINCULO'
      Size = 60
    end
    object qrySitFuncionalCODCARGO: TStringField
      FieldName = 'CODCARGO'
      Size = 15
    end
    object qrySitFuncionalTITCARGO: TStringField
      FieldName = 'TITCARGO'
      Size = 40
    end
    object qrySitFuncionalIDCARGOEXT: TFloatField
      FieldName = 'IDCARGOEXT'
    end
    object qrySitFuncionalVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
    end
    object qrySitFuncionalVALORBASE2: TFloatField
      FieldName = 'VALORBASE2'
    end
    object qrySitFuncionalVALORBASE3: TFloatField
      FieldName = 'VALORBASE3'
    end
    object qrySitFuncionalVALORBASE4: TFloatField
      FieldName = 'VALORBASE4'
    end
    object qrySitFuncionalVALORBASE5: TFloatField
      FieldName = 'VALORBASE5'
    end
    object qrySitFuncionalVALORBASE6: TFloatField
      FieldName = 'VALORBASE6'
    end
    object qrySitFuncionalNOMEVALORBASE1: TStringField
      FieldName = 'NOMEVALORBASE1'
      Size = 60
    end
    object qrySitFuncionalNOMEVALORBASE2: TStringField
      FieldName = 'NOMEVALORBASE2'
      Size = 60
    end
    object qrySitFuncionalNOMEVALORBASE3: TStringField
      FieldName = 'NOMEVALORBASE3'
      Size = 60
    end
    object qrySitFuncionalNOMEVALORBASE4: TStringField
      FieldName = 'NOMEVALORBASE4'
      Size = 60
    end
    object qrySitFuncionalNOMEVALORBASE5: TStringField
      FieldName = 'NOMEVALORBASE5'
      Size = 60
    end
    object qrySitFuncionalNOMEVALORBASE6: TStringField
      FieldName = 'NOMEVALORBASE6'
      Size = 60
    end
    object qrySitFuncionalNIVEL: TStringField
      FieldName = 'NIVEL'
      FixedChar = True
      Size = 15
    end
    object qrySitFuncionalTIPOFLGDIRETOR: TFloatField
      FieldName = 'TIPOFLGDIRETOR'
    end
  end
  object dsSitFuncional: TwwDataSource
    DataSet = qrySitFuncional
    Left = 408
    Top = 264
  end
  object qryFuncAtual: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.IDPESSJUR,       E.IDPESSOA,       E.SEQHISTFUNC,'
      '       E.IDPESSJURCG,     E.IDCARGOEXT,'
      '       E.IDPESSJURFG,     E.IDFUNCAO,'
      '       E.DATAINICIO,      E.DATAFINAL,'
      '       E.PERC1AC,         E.PERC2AC,'
      '       E.PERCATS,         E.PERCINSALUB,'
      '       E.PERCPERICUL,     E.PERCFUNCAO,'
      '       E.MODOFUNCAO,'
      '       E.ORIGEM,'
      '       E.FLGSITPART,'
      '       DECODE(E.ORIGEM, '#39'I'#39', '#39'Interface'#39','
      '                        '#39'C'#39', '#39'Cadastrado'#39','
      '                        '#39'E'#39', '#39'Evento de Manutenção'#39','
      '                        '#39'R'#39', '#39'Retroativo'#39') AS DESCORIGEM,'
      '       DECODE(E.MODOFUNCAO, '#39'EF'#39', '#39'EFETIVA'#39','
      '                            '#39'AS'#39', '#39'ASSEGURADA'#39','
      '                            '#39'ES'#39', '#39'EVENTUAL/SUBSTITUIÇÃO'#39','
      '                            '#39'DP'#39', '#39'DESIGNAÇÃO POR PRAZO'#39','
      '                            '#39'FA'#39', '#39'FACULTATIVA'#39','
      '                            '#39'ET'#39', '#39'ESTRATÉGICA'#39','
      '                             '#39'NÃO INFORMADO'#39') AS DESCMODO,'
      '       DECODE(E.FLGSITPART,'#39'AS'#39', '#39'Assistido'#39','
      '                           '#39'AT'#39', '#39'Ativo'#39','
      '                                 '#39'Outros'#39') AS DESCSITCADASTRADA,'
      ''
      '       F.CODIGO AS CODIGO,'
      '       GF.CODIGO GRUPO,'
      '       F.TITULO AS FUNCAO'
      'FROM   CARGOEXT F, EVOLFUNCPREV E,'
      '       GRUPOCARGOEXT GCE, GRUPOFUNC GF,'
      '       PARTPREVPLAN PP, SITPART SIT,'
      
        '      (SELECT idpessoa, idpessjur, MAX(DATAINICIO) AS DATAINICIO' +
        ' FROM EVOLFUNCPREV WHERE IDPESSOA = :IDPESSOA AND IDPESSJUR = :I' +
        'DPESSJUR and IDFUNCAO is not null and IDPESSJURFG is not null gr' +
        'oup by idpessoa, idpessjur) DT'
      'WHERE  E.IDPESSJUR      = :IDPESSJUR'
      'AND    E.IDPESSOA       = :IDPESSOA'
      'AND    PP.IDPLANOPREV(+)= :IDPLANOPREV'
      'AND    E.IDPESSJURFG    = F.IDPESSJUR'
      'AND    E.IDFUNCAO       = F.IDCARGOEXT'
      'AND    GCE.IDCARGOEXT   = E.IDFUNCAO'
      'AND    GF.IDGRUPOFUNC   = GCE.IDGRUPOFUNC'
      'AND    PP.IDPESSOA(+)      = E.IDPESSOA'
      'AND    PP.IDPESSJUR(+)      = E.IDPESSJUR'
      'AND    SIT.IDSITPART(+)    = PP.IDSITPART'
      'AND    E.IDFUNCAO IS NOT NULL'
      'AND    E.PERC1AC  IS NULL'
      'AND    E.DATAINICIO = DT.DATAINICIO'
      'and    e.idpessoa = dt.idpessoa'
      'and    e.idpessjur = dt.idpessjur'
      'ORDER BY E.DATAINICIO DESC'
      '')
    ValidateWithMask = True
    Left = 244
    Top = 314
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object dsFuncAtual: TwwDataSource
    DataSet = qryFuncAtual
    Left = 244
    Top = 315
  end
  object qryFuncFacult: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  F.IDCARGOEXT AS IDFUNCAO,'
      '  F.CODIGO AS CODIGO,'
      '  F.TITULO AS FUNCAO,'
      '  GF.CODIGO GRUPO,'
      '  E.IDPESSJUR,'
      '  E.DATAINICIO'
      'FROM   CARGOEXT F, EVOLFUNCPREV E,'
      '       GRUPOCARGOEXT GCE, GRUPOFUNC GF, SITPART SIT,'
      '       (SELECT MAX(DATAINICIO) AS DATAINICIO FROM EVOLFUNCPREV '
      
        '        WHERE IDPESSOA = :IDPESSOA AND IDPESSJUR = :IDPESSJUR AN' +
        'D MODOFUNCAO = '#39'FA'#39' AND '
      
        '                       IDPESSJURFG IS NOT NULL AND IDFUNCAO IS N' +
        'OT NULL) DT'
      'WHERE  E.IDPESSJUR          = :IDPESSJUR'
      'AND    E.IDPESSOA           =  :IDPESSOA'
      'AND    E.IDPESSJURFG        = F.IDPESSJUR'
      'AND    E.IDFUNCAO           = F.IDCARGOEXT'
      'AND    GCE.IDCARGOEXT       = E.IDFUNCAO'
      'AND    GF.IDGRUPOFUNC       = GCE.IDGRUPOFUNC'
      'AND    E.MODOFUNCAO         = '#39'FA'#39
      'AND    E.IDFUNCAO IS NOT NULL'
      'AND    E.PERC1AC  IS NULL'
      'AND    E.DATAINICIO = DT.DATAINICIO'
      'AND    F.TIPO = '#39'F'#39
      ' '
      ' ')
    ValidateWithMask = True
    Left = 80
    Top = 313
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idpessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idpessjur'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsFuncFacult: TwwDataSource
    DataSet = qryFuncFacult
    Left = 80
    Top = 313
  end
  object qryMesReferencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT distinct H.MESREFERENCIA'
      
        'FROM  HISTMOVRESERVA H,      RESERVAXPLANO TP,      MOEDA M,    ' +
        ' CONTRIBUICAO C,    BENEFICIO B'
      ''
      'WHERE (H.IDPESSJUR = :IDPESSJUR)'
      'AND   (H.IDPESSOA = :IDTITULAR)'
      'AND   (H.IDPLANOPREV = :IDPLANOPREV)'
      'AND   (H.SEQPROPOSTA = :SEQPROPOSTA)'
      'AND   (TP.IDPLANOPREV = H.IDPLANOPREV)'
      'AND   (TP.IDTIPORESERVA = H.IDTIPORESERVA)'
      'AND   (TP.ANALITICOSINTETI = '#39'A'#39')'
      'AND   (M.MOECODIGO(+)  = TP.INDICEREAJUSTE)'
      'AND  (H.IDCONTRIBUICAO = C.IDCONTRIBUICAO(+))'
      'AND  (H.IDBENEFICIO = B.IDBENEFICIO(+))'
      'ORDER BY  H.MESREFERENCIA DESC')
    ValidateWithMask = True
    Left = 16
    Top = 314
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SEQPROPOSTA'
        ParamType = ptInput
      end>
  end
  object dsMesReferencia: TwwDataSource
    DataSet = qryMesReferencia
    Left = 40
    Top = 312
  end
  object qryNomeReserva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT TP.NOME'
      'FROM  HISTMOVRESERVA H, RESERVAXPLANO TP'
      'WHERE   (H.IDPESSJUR = :IDPESSJUR)'
      '  AND   (H.IDPESSOA = :IDTITULAR)'
      '  AND   (H.IDPLANOPREV = :IDPLANOPREV)'
      '  AND   (H.SEQPROPOSTA = :SEQPROPOSTA)'
      '  AND   (TP.IDPLANOPREV = H.IDPLANOPREV)'
      '  AND   (TP.IDTIPORESERVA = H.IDTIPORESERVA)'
      '  AND   (TP.ANALITICOSINTETI = '#39'A'#39')'
      '')
    ValidateWithMask = True
    Left = 198
    Top = 262
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SEQPROPOSTA'
        ParamType = ptInput
      end>
  end
  object DsNomeReserva: TwwDataSource
    DataSet = qryNomeReserva
    Left = 200
    Top = 261
  end
  object qryRecebDadosPessoais: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME,'
      '       TBLCPF.NUMDOCUMENTO AS CPF,'
      '       TBLRG.NUMDOCUMENTO  AS RG,'
      '       TBLRG.ORGAO         AS EXPEDICAO,'
      '       TBLRG.UF            AS UFRG,'
      '       TBLRG.DATAEMISSAO   AS DTEMISRG'
      'FROM PESSOA P,'
      
        '   ( SELECT NUMDOCUMENTO, ORGAO, NVL(CODESTADO,UF) AS UF, DATAEM' +
        'ISSAO'
      '     FROM DOCPESSOA, ESTADO'
      '     WHERE IDPESSOA = :IDPESSOA'
      '       AND DOCPESSOA.IDESTADO =  ESTADO.IDESTADO (+)'
      '       AND IDDOCUMENTO = ( SELECT IDDOCUMENTO'
      '                           FROM TIPODOCOFICIAL'
      '                           WHERE SIGLADOCUMENTO = '#39'RG:'#39
      
        '                             AND IDDOCUMENTO IS NOT NULL ) ) TBL' +
        'RG,'
      '   ( SELECT NUMDOCUMENTO'
      '     FROM DOCPESSOA'
      '     WHERE IDPESSOA = :IDPESSOA'
      '       AND IDDOCUMENTO = ( SELECT IDDOCUMENTO'
      '                           FROM TIPODOCOFICIAL'
      '                           WHERE SIGLADOCUMENTO = '#39'CPF:'#39
      
        '                             AND IDDOCUMENTO IS NOT NULL ) ) TBL' +
        'CPF'
      'WHERE ( P.IDPESSOA = :IDPESSOA )'
      ' ')
    ValidateWithMask = True
    Left = 203
    Top = 205
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    object qryRecebDadosPessoaisNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryRecebDadosPessoaisCPF: TStringField
      FieldName = 'CPF'
      Origin = 'BASEDADOS.PESSOA.NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryRecebDadosPessoaisRG: TStringField
      FieldName = 'RG'
      Origin = 'BASEDADOS.DOCPESSOA.NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryRecebDadosPessoaisEXPEDICAO: TStringField
      FieldName = 'EXPEDICAO'
      Origin = 'BASEDADOS.DOCPESSOA.ORGAO'
      Size = 30
    end
    object qryRecebDadosPessoaisUFRG: TStringField
      FieldName = 'UFRG'
      Origin = 'BASEDADOS.DOCPESSOA.UF'
      FixedChar = True
      Size = 3
    end
    object qryRecebDadosPessoaisDTEMISRG: TDateTimeField
      FieldName = 'DTEMISRG'
      Origin = 'BASEDADOS.DOCPESSOA.DATAEMISSAO'
    end
  end
  object dsRecebDadosPessoais: TwwDataSource
    AutoEdit = False
    DataSet = qryRecebDadosPessoais
    Left = 205
    Top = 204
  end
  object dsAdicConfianca: TwwDataSource
    AutoEdit = False
    DataSet = qryAdicConfianca
    Left = 41
    Top = 448
  end
  object qryAdicConfianca: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.IDPESSJUR,       E.IDPESSOA,       E.SEQHISTFUNC,'
      '       E.IDPESSJURCG,     E.IDCARGOEXT,'
      '       E.IDPESSJURFG,     E.IDFUNCAO,'
      '       E.DATAINICIO,      E.DATAFINAL,'
      '       E.PERC1AC,         E.PERC2AC,'
      '       E.PERCATS,         E.PERCINSALUB,'
      '       E.PERCPERICUL,     E.PERCFUNCAO,     E.PERCINCORP,'
      '       E.MODOFUNCAO,'
      '       E.ORIGEM,'
      '       E.FLGSITPART,'
      '       DECODE(E.ORIGEM, '#39'I'#39', '#39'Interface'#39','
      '                        '#39'C'#39', '#39'Cadastrado'#39','
      '                        '#39'E'#39', '#39'Evento de Manutenção'#39','
      '                        '#39'R'#39', '#39'Retroativo'#39') AS DESCORIGEM,'
      '       DECODE(E.FLGSITPART,'#39'AS'#39', '#39'Assistido'#39','
      '                           '#39'AT'#39', '#39'Ativo'#39','
      '                                 '#39'Outros'#39') AS DESCSITCADASTRADA'
      'FROM   EVOLFUNCPREV E'
      'WHERE  E.IDPESSJUR      = :IDPESSJUR'
      'AND    E.IDPESSOA       = :IDPESSOA'
      'AND    PERCPERICUL IS NOT NULL'
      'AND    PERCPERICUL > 0'
      'ORDER BY E.DATAINICIO DESC'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGSITPART;CustomEdit;dbcSituacao')
    PictureMasks.Strings = (
      'FLGSITPART'#9'#,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 6
    Top = 502
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 76644
      end>
  end
  object QryHistoricoPercentual: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT c.nome,hst.dtinicio, hst.dtfim, hst.percentual  '
      'FROM hstpercontribprev hst,contribuicao c'
      'WHERE hst.idpessjur    =:idpessjur'
      'AND hst.idpessoa       =:idpessoa'
      'AND hst.idplanoprev    =:idplanoprev'
      'AND hst.Idcontribuicao = 1'
      'AND hst.Idcontribuicao = c.Idcontribuicao'
      
        'ORDER BY c.idcontribuicao,dtinicio DESC,dtfim DESC,idhstpercontr' +
        'ibprev DESC')
    ValidateWithMask = True
    Left = 240
    Top = 464
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpessjur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idplanoprev'
        ParamType = ptUnknown
      end>
  end
  object dsHistoricoPercentual: TwwDataSource
    DataSet = QryHistoricoPercentual
    Left = 184
    Top = 416
  end
  object dsListPatros: TwwDataSource
    DataSet = qryListPatros
    Left = 416
    Top = 464
  end
  object qryListPatros: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'select distinct e.IDPESSJUR AS CODPATROCINADORA, decode(e.idpess' +
        'jur, 1, '#39'Funcef'#39', '#39'Caixa'#39') AS PATROCINADORA'
      '  from elegpatro e, sitfunc s'
      ' where e.idsitfunc = s.idsitfunc'
      '   and e.IDPESSOA = :IdPessoa'
      ''
      ' ')
    ValidateWithMask = True
    Left = 488
    Top = 464
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IdPessoa'
        ParamType = ptInput
      end>
  end
  object dsHistoricoRevisoes: TwwDataSource
    DataSet = qryHistoricoRevisoes
    Left = 600
    Top = 448
  end
  object qryHistoricoRevisoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HV.idpessoa,'
      '       HV.idplanoprev,'
      '       HV.idbeneficio,'
      '       HV.idpessjur,'
      '       HV.idtipomov,'
      '       HV.valoratual,'
      '       HV.valortotal,'
      '       HV.dib,'
      '       HV.dip,'
      '       HV.percentual,'
      '       HV.descrevisao,'
      '       HV.numparc,'
      '       HV.valorparc,'
      '       HV.datainicio,'
      '       HV.datafim,'
      '       HV.sldrevisao,'
      '       TMB.dscmov,'
      '       HV.idmotivo,'
      '       M.descricao desc_motivo'
      '  FROM hstrevisoes HV'
      ' INNER JOIN tipomovbenef TMB'
      '    ON (TMB.idtipomov = HV.idtipomov)'
      ' INNER JOIN motivo M'
      '    ON (M.idmotivo = HV.idmotivo)'
      ' WHERE HV.idpessoa = :idpessoa'
      '   AND HV.idplanoprev = :idplanoprev'
      '   AND HV.idbeneficio = :idbeneficio'
      '   AND HV.idpessjur = :idpessjur'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 760
    Top = 440
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'idplanoprev'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'idbeneficio'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'idpessjur'
        ParamType = ptInput
      end>
    object qryHistoricoRevisoesDSCMOV: TStringField
      DisplayLabel = 'Processo Gerador'
      FieldName = 'DSCMOV'
      Origin = 'BASEDADOS.TIPOMOVBENEF.DSCMOV'
      Size = 50
    end
    object qryHistoricoRevisoesDATAINICIO: TStringField
      DisplayLabel = 'Início~Revisão'
      FieldName = 'DATAINICIO'
      Origin = 'BASEDADOS.HSTREVISOES.DATAINICIO'
      Size = 7
    end
    object qryHistoricoRevisoesDATAFIM: TStringField
      DisplayLabel = 'Fim~Revisão'
      FieldName = 'DATAFIM'
      Origin = 'BASEDADOS.HSTREVISOES.DATAFIM'
      Size = 7
    end
    object qryHistoricoRevisoesVALORATUAL: TFloatField
      DisplayLabel = 'Valor~Atual'
      FieldName = 'VALORATUAL'
      Origin = 'BASEDADOS.HSTREVISOES.VALORATUAL'
      DisplayFormat = ',0.00#'
    end
    object qryHistoricoRevisoesVALORTOTAL: TFloatField
      DisplayLabel = 'Valor~Total'
      FieldName = 'VALORTOTAL'
      Origin = 'BASEDADOS.HSTREVISOES.VALORTOTAL'
      DisplayFormat = ',0.00#'
    end
    object qryHistoricoRevisoesPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      FieldName = 'PERCENTUAL'
      Origin = 'BASEDADOS.HSTREVISOES.PERCENTUAL'
    end
    object qryHistoricoRevisoesSLDREVISAO: TFloatField
      DisplayLabel = 'Saldo Revisão'
      FieldName = 'SLDREVISAO'
      Origin = 'BASEDADOS.HSTREVISOES.SLDREVISAO'
      DisplayFormat = ',0.00#'
    end
    object qryHistoricoRevisoesNUMPARC: TFloatField
      DisplayLabel = 'Número~de Parcelas'
      FieldName = 'NUMPARC'
      Origin = 'BASEDADOS.HSTREVISOES.NUMPARC'
    end
    object qryHistoricoRevisoesVALORPARC: TFloatField
      DisplayLabel = 'Valor~da Parcela'
      FieldName = 'VALORPARC'
      Origin = 'BASEDADOS.HSTREVISOES.VALORPARC'
    end
    object qryHistoricoRevisoesIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.HSTREVISOES.IDPESSOA'
      Visible = False
    end
    object qryHistoricoRevisoesIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.HSTREVISOES.IDPLANOPREV'
      Visible = False
    end
    object qryHistoricoRevisoesIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.HSTREVISOES.IDBENEFICIO'
      Visible = False
    end
    object qryHistoricoRevisoesIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.HSTREVISOES.IDPESSJUR'
      Visible = False
    end
    object qryHistoricoRevisoesIDTIPOMOV: TFloatField
      FieldName = 'IDTIPOMOV'
      Origin = 'BASEDADOS.HSTREVISOES.IDTIPOMOV'
      Visible = False
    end
    object qryHistoricoRevisoesDIB: TDateTimeField
      FieldName = 'DIB'
      Origin = 'BASEDADOS.HSTREVISOES.DIB'
    end
    object qryHistoricoRevisoesDIP: TDateTimeField
      FieldName = 'DIP'
      Origin = 'BASEDADOS.HSTREVISOES.DIP'
    end
    object qryHistoricoRevisoesDESCREVISAO: TMemoField
      DisplayLabel = 'Descrição da Revisão'
      FieldName = 'DESCREVISAO'
      Origin = 'BASEDADOS.HSTREVISOES.DESCREVISAO'
      Visible = False
      BlobType = ftMemo
      Size = 4000
    end
    object qryHistoricoRevisoesIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Visible = False
    end
    object qryHistoricoRevisoesDESC_MOTIVO: TStringField
      DisplayLabel = 'Motivo da Revisão'
      FieldName = 'DESC_MOTIVO'
      Size = 50
    end
  end
  object qryHistoricoRevisoesBeneficios: TwwQuery
    AfterScroll = qryHistoricoRevisoesBeneficiosAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HV.idpessoa, '
      '       HV.idplanoprev,'
      '       HV.idbeneficio,'
      '       HV.idpessjur,  '
      '       B.nome nomebeneficio'
      '  FROM hstrevisoes HV'
      ' INNER JOIN beneficio B'
      '    ON (B.idbeneficio = HV.idbeneficio)'
      ' WHERE HV.idpessoa = :idpessoa'
      '   AND HV.idplanoprev = :idplanoprev'
      '   AND HV.idpessjur = :idpessjur')
    ValidateWithMask = True
    Left = 712
    Top = 544
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'idplanoprev'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'idpessjur'
        ParamType = ptInput
      end>
    object qryHistoricoRevisoesBeneficiosIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.HSTREVISOES.IDPESSOA'
    end
    object qryHistoricoRevisoesBeneficiosIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.HSTREVISOES.IDPLANOPREV'
    end
    object qryHistoricoRevisoesBeneficiosIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.HSTREVISOES.IDBENEFICIO'
    end
    object qryHistoricoRevisoesBeneficiosIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.HSTREVISOES.IDPESSJUR'
    end
    object qryHistoricoRevisoesBeneficiosNOMEBENEFICIO: TStringField
      FieldName = 'NOMEBENEFICIO'
      Origin = 'BASEDADOS.BENEFICIO.NOME'
      Size = 60
    end
  end
  object dsHistoricoRevisoesBeneficios: TwwDataSource
    DataSet = qryHistoricoRevisoesBeneficios
    Left = 648
    Top = 488
  end
  object qryAgencia: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT'
      '  A.IDPESSOA,'
      '  A.IDBANCO,'
      '  A.NUMAGENCIA||'#39' - '#39'||P.NOME AS NOME'
      ''
      'FROM'
      '  AGENCIABANCARIA A,'
      '  PESSOA P'
      ''
      'WHERE'
      '  A.IDBANCO  = :IDBANCO AND'
      '  A.IDPESSOA = P.IDPESSOA'
      ''
      'ORDER BY'
      '  A.NUMAGENCIA')
    ValidateWithMask = True
    Left = 656
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDBANCO'
        ParamType = ptUnknown
      end>
  end
  object qryConta: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT'
      '  IDCBANCARIA,'
      '  CONTACORRENTE'
      ''
      'FROM'
      '  CONTABANCARIA'
      ''
      'WHERE'
      '  IDAGENCIA = :IDAGENCIA')
    ValidateWithMask = True
    Left = 720
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDAGENCIA'
        ParamType = ptUnknown
      end>
  end
  object qryBanco: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT'
      '  B.IDPESSOA,'
      '  B.NUMBANCO||'#39#39' - '#39#39'||P.NOME AS NOME'
      ''
      'FROM'
      '  PESSOA P,'
      '  BANCO B'
      ''
      'WHERE'
      '  P.IDPESSOA = B.IDPESSOA'
      ''
      'ORDER BY'
      '  NOME')
    ValidateWithMask = True
    Left = 784
    Top = 56
  end
  object dsAgencia: TwwDataSource
    DataSet = qryAgencia
    Left = 657
    Top = 110
  end
  object dsConta: TwwDataSource
    DataSet = qryConta
    Left = 720
    Top = 110
  end
  object dsBanco: TwwDataSource
    DataSet = qryBanco
    Left = 784
    Top = 110
  end
  object dsMatriculas: TwwDataSource
    AutoEdit = False
    DataSet = QryMatriculas
    Left = 655
    Top = 265
  end
  object QryMatriculas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MATRICULA, IDPESSOA'
      '  FROM DEPENTIT'
      ' WHERE IDPESSOA IN'
      '       (SELECT IDPESSOA'
      '          FROM PESSOA'
      '         WHERE NUMDOCUMENTO ='
      
        '               (SELECT NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA =' +
        ' :IDPESSOA))'
      '')
    ValidateWithMask = True
    Left = 643
    Top = 328
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryHstSalParticipGrid: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  '#39'                     '#39'  AS  MES,'
      
        '        cast('#39'                                                  ' +
        '                                                                ' +
        '                                                 '#39' as varchar2(1' +
        '70)) AS SALPART,'
      
        '        cast('#39'                                                  ' +
        '                                                                ' +
        '                                                 '#39' as varchar2(1' +
        '70)) AS SALCONT,'
      '        '#39'                     '#39'  AS TIPO,'
      '        '#39'                     '#39'  AS  MESFILTRO'
      ''
      ' FROM    DUAL'
      ''
      ' '
      ''
      ' ')
    UpdateObject = updHstSalParticipGrid
    PictureMasks.Strings = (
      'VALORPROVENTO'#9'###.###.###.##0,00'#9'T'#9'T'
      'SUMPROVENTO'#9'999,999,999,999.99'#9'T'#9'F'
      'SUMDESCONTO'#9'999,999,999,999.99'#9'T'#9'F'
      'SUMLIQ'#9'999,999,999,999.99'#9'T'#9'F')
    ValidateWithMask = True
    Left = 246
    Top = 314
    object qryHstSalParticipGridMES: TStringField
      DisplayLabel = 'Mês de ~Referência'
      DisplayWidth = 10
      FieldName = 'MES'
      FixedChar = True
      Size = 21
    end
    object qryHstSalParticipGridSALCONT: TStringField
      DisplayLabel = 'Salário de Participação'
      DisplayWidth = 60
      FieldName = 'SALCONT'
      FixedChar = True
      Size = 163
    end
    object qryHstSalParticipGridSALPART: TStringField
      DisplayLabel = 'Salário de Contribuição'
      DisplayWidth = 60
      FieldName = 'SALPART'
      FixedChar = True
      Size = 163
    end
    object qryHstSalParticipGridTIPO: TStringField
      FieldName = 'TIPO'
      Visible = False
      FixedChar = True
      Size = 21
    end
    object qryHstSalParticipGridMESFILTRO: TStringField
      FieldName = 'MESFILTRO'
      Visible = False
      FixedChar = True
      Size = 21
    end
  end
  object updHstSalParticipGrid: TUpdateSQL
    Left = 754
    Top = 315
  end
  object DSHstSalParticipGrid: TwwDataSource
    AutoEdit = False
    DataSet = qryHstSalParticipGrid
    Left = 411
    Top = 425
  end
  object qryLogAltDependentes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT LG.OPERACAO,'
      '       LG.CAMPO AS NOMECAMPO,  '
      
        '       CAST(SUBSTR(LG.VALORANTERIOR, 1, 110) AS VARCHAR2(110)) A' +
        'S VLRANTERIOR,'
      
        '       CAST(SUBSTR(LG.VALORALTERADO, 1, 110) AS VARCHAR2(110)) A' +
        'S VLRALTERADO,'
      '       LG.TRGDTINCLUSAO,'
      '       LG.NOMEUSUARIO'
      ' FROM (SELECT '
      '       L.OPERACAO,'
      
        '       DECODE(L.NOMECAMPO, '#39'DATACADASTRO'#39',      '#39'Data de Cadastr' +
        'o'#39','
      
        '                           '#39'DATACANCELA'#39',       '#39'Data de Cancela' +
        'mento'#39','
      '                           '#39'DATAMORTE'#39',         '#39'Data Morte'#39','
      
        '                           '#39'DATANASC'#39',          '#39'Data de Nascime' +
        'nto'#39','
      '                           '#39'DESCESTCIVIL'#39',      '#39'Estado Civil'#39','
      '                           '#39'DESCRICAO'#39',         '#39'Dependência'#39','
      '                           '#39'ESTADOCIVIL'#39',       '#39'Estado Civil'#39','
      
        '                           '#39'ESTCIVIL'#39',          '#39'Sigla Estado Ci' +
        'vil'#39','
      
        '                           '#39'FIMIMPOSTOR'#39',       '#39'Dt Fim de Dep. ' +
        'IR'#39','
      
        '                           '#39'FLGBENEFICIARIO'#39',   '#39'Possui Benefíci' +
        'o'#39', '
      
        '                           '#39'FLGCONTAIMPOSTOR'#39',  '#39'Dependente de I' +
        'R'#39','
      '                           '#39'FLGCONTASALARIOF'#39',  '#39'Conta Salário'#39','
      
        '                           '#39'FLGDEPINVALIDO'#39',    '#39'Dependente Invá' +
        'lido'#39','
      
        '                           '#39'FLGDEPIR'#39',          '#39'Dependente de I' +
        'R'#39','
      
        '                           '#39'FLGDEPLEGAL'#39',       '#39'Dependente FUNC' +
        'EF'#39','
      
        '                           '#39'FLGDESIGNADO'#39',      '#39'Designado para ' +
        'Resgate'#39','
      
        '                           '#39'FLGDESINADO'#39',       '#39'Designado para ' +
        'Resgate'#39','
      '                           '#39'FLGELEGIVEL'#39',       '#39'Elegível'#39','
      
        '                           '#39'FLGIGNORAVALIR'#39',    '#39'Ignora Imposto ' +
        'de Renda'#39','
      '                           '#39'FLGISENTOIRRF'#39',     '#39'Isento de IR'#39','
      
        '                           '#39'FLGMOLESTIAGRAVE'#39',  '#39'Moléstia Grave'#39 +
        ','
      '                           '#39'FLGOBRIDOCPESSOA'#39',  '#39'Obriga Doc.'#39','
      
        '                           '#39'GRAUINSTR'#39',         '#39'Grau de Instruç' +
        'ão'#39','
      
        '                           '#39'IDDEPENDENCIA'#39',     '#39'Sigla Dependênc' +
        'ia'#39','
      
        '                           '#39'IDGRINSTR'#39',         '#39'Identificador d' +
        'o Grau de Instrução'#39','
      
        '                           '#39'IDPESSOA'#39',          '#39'Identificador d' +
        'a Pessoa'#39','
      
        '                           '#39'IDSITDEPENDENTE'#39',   '#39'Situação do Dep' +
        'endente'#39','
      
        '                           '#39'IDTITULAR'#39',         '#39'Identificador d' +
        'o Titular'#39','
      
        '                           '#39'INICIOIMPOSTOR'#39',    '#39'Dt Início de De' +
        'p. IR'#39','
      '                           '#39'MASCARA'#39',           '#39'Máscara'#39','
      '                           '#39'MATRICULA'#39',         '#39'Matrícula'#39','
      '                           '#39'NOME'#39',              '#39'Nome'#39','
      '                           '#39'NOMEMAE'#39',           '#39'Nome da Mãe'#39','
      '                           '#39'NOMEPAI'#39',           '#39'Nome do Pai'#39','
      '                           '#39'NUMDOCUMENTO'#39',      '#39'CPF'#39','
      '                           '#39'NUMSEQUENCIA'#39',      '#39'Sequencial'#39','
      '                           '#39'SEXO'#39',              '#39'Sexo'#39','
      
        '                           '#39'SITUACAODEPEN'#39',     '#39'Situação do Dep' +
        'endente'#39','
      '                           '#39'TIPOCANCELAMENTO'#39',  '#39'Cancelado'#39','
      
        '                           '#39'TIPODEPENDENCIA'#39',   '#39'Situação do Dep' +
        'endente'#39','
      
        '                           '#39'VALORBASE1'#39',        '#39'Percentual de C' +
        'ontribuição'#39','
      
        '                           '#39'VALORBASE3'#39',        '#39'Percentual de C' +
        'ontribuição'#39', '#39#39') AS CAMPO,           '
      '       CASE'
      
        '         WHEN (L.NOMECAMPO = '#39'GRAUINSTR'#39') OR (L.NOMECAMPO = '#39'SIT' +
        'UACAODEPEN'#39') OR (L.NOMECAMPO = '#39'TIPODEPENDENCIA'#39') THEN'
      
        '           REPLACE(INITCAP(REPLACE(L.VALORANTERIOR,'#39'('#39','#39'xxxx'#39')),' +
        #39'xxxx'#39','#39'('#39')'
      ''
      '         WHEN (L.NOMECAMPO = '#39'IDNATUALIDADE'#39') THEN'
      
        '            DECODE(L.VALORANTERIOR, NULL, '#39#39', (SELECT E.CODESTAD' +
        'O FROM ESTADO E'
      
        '                                              WHERE E.IDESTADO =' +
        ' TO_NUMBER(L.VALORANTERIOR, '#39'99'#39')))   '
      ''
      '         WHEN (L.NOMECAMPO = '#39'IDGRINSTR'#39') THEN'
      
        '            DECODE(L.VALORANTERIOR, NULL, '#39#39', TRIM(L.VALORANTERI' +
        'OR) ||'#39' - '#39'|| (SELECT G.DESCRICAO FROM GRINSTR G'
      
        '                                            WHERE G.IDGRINSTR = ' +
        'TRIM(L.VALORANTERIOR)))   '
      ''
      '         WHEN L.NOMECAMPO = '#39'IDSITDEPENDENTE'#39' THEN'
      '            DECODE(TRIM(L.VALORANTERIOR), '#39'0'#39','#39'Normal'#39','
      '                                          '#39'1'#39','#39'Normal'#39','
      '                                          '#39'NULL'#39','#39'Normal'#39','
      '                                          '#39'120'#39','#39'Inválido'#39','
      
        '                                          '#39'2'#39','#39'Decisão Judicial'#39 +
        ')'
      ''
      '         WHEN (L.NOMECAMPO = '#39'SEXO'#39') THEN'
      
        '             DECODE(TRIM(L.VALORANTERIOR), '#39'F'#39', '#39'Feminino'#39', '#39'M'#39',' +
        ' '#39'Masculino'#39', L.VALORANTERIOR)'
      '           '
      
        '         WHEN (L.NOMECAMPO = '#39'FLGBENEFICIARIO'#39')  OR (L.NOMECAMPO' +
        ' = '#39'FLGCONTAIMPOSTOR'#39') OR'
      
        '              (L.NOMECAMPO = '#39'FLGCONTASALARIOF'#39') OR (L.NOMECAMPO' +
        ' = '#39'FLGDEPINVALIDO'#39')   OR'
      
        '              (L.NOMECAMPO = '#39'FLGDEPIR'#39')         OR (L.NOMECAMPO' +
        ' = '#39'FLGDEPLEGAL'#39')      OR'
      
        '              (L.NOMECAMPO = '#39'FLGDESIGNADO'#39')     OR (L.NOMECAMPO' +
        ' = '#39'FLGDESINADO'#39')      OR '
      
        '              (L.NOMECAMPO = '#39'FLGELEGIVEL'#39')      OR (L.NOMECAMPO' +
        ' = '#39'FLGIGNORAVALIR'#39')   OR'
      
        '              (L.NOMECAMPO = '#39'FLGISENTOIRRF'#39')    OR (L.NOMECAMPO' +
        ' = '#39'FLGMOLESTIAGRAVE'#39') OR'
      
        '              (L.NOMECAMPO = '#39'FLGOBRIDOCPESSOA'#39') OR (L.NOMECAMPO' +
        ' = '#39'TIPOCANCELAMENTO'#39') THEN'
      
        '             DECODE(TRIM(L.VALORANTERIOR), '#39'0'#39', '#39'Não'#39', '#39'1'#39', '#39'Sim' +
        #39', L.VALORANTERIOR)                '
      '         ELSE'
      '           L.VALORANTERIOR'
      '       END AS VALORANTERIOR,  '
      '       '
      '       CASE'
      
        '         WHEN (L.NOMECAMPO = '#39'GRAUINSTR'#39') OR (L.NOMECAMPO = '#39'SIT' +
        'UACAODEPEN'#39') OR (L.NOMECAMPO = '#39'TIPODEPENDENCIA'#39') THEN'
      
        '           REPLACE(INITCAP(REPLACE(L.VALORALTERADO,'#39'('#39','#39'xxxx'#39')),' +
        #39'xxxx'#39','#39'('#39')'
      ''
      '         WHEN (L.NOMECAMPO = '#39'IDNATUALIDADE'#39') THEN'
      
        '            DECODE(L.VALORALTERADO, NULL, '#39#39', (SELECT E.CODESTAD' +
        'O FROM ESTADO E'
      
        '                                              WHERE E.IDESTADO =' +
        ' TO_NUMBER(L.VALORALTERADO, '#39'99'#39')))   '
      ''
      '         WHEN (L.NOMECAMPO = '#39'IDGRINSTR'#39') THEN'
      
        '            DECODE(L.VALORALTERADO, NULL, '#39#39', TRIM(L.VALORALTERA' +
        'DO) ||'#39' - '#39'|| (SELECT G.DESCRICAO FROM GRINSTR G'
      
        '                                            WHERE G.IDGRINSTR = ' +
        'TRIM(L.VALORALTERADO)))   '
      '  '
      '         WHEN L.NOMECAMPO = '#39'IDSITDEPENDENTE'#39' THEN'
      '            DECODE(TRIM(L.VALORALTERADO), '#39'0'#39','#39'Normal'#39','
      '                                          '#39'1'#39','#39'Normal'#39','
      '                                          '#39'NULL'#39','#39'Normal'#39','
      '                                          '#39'120'#39','#39'Inválido'#39','
      
        '                                          '#39'2'#39','#39'Decisão Judicial'#39 +
        ')'
      ''
      '         WHEN (L.NOMECAMPO = '#39'SEXO'#39') THEN'
      
        '             DECODE(TRIM(L.VALORALTERADO), '#39'F'#39', '#39'Feminino'#39', '#39'M'#39',' +
        ' '#39'Masculino'#39', L.VALORALTERADO)'
      '           '
      
        '         WHEN (L.NOMECAMPO = '#39'FLGBENEFICIARIO'#39')  OR (L.NOMECAMPO' +
        ' = '#39'FLGCONTAIMPOSTOR'#39') OR'
      
        '              (L.NOMECAMPO = '#39'FLGCONTASALARIOF'#39') OR (L.NOMECAMPO' +
        ' = '#39'FLGDEPINVALIDO'#39')   OR'
      
        '              (L.NOMECAMPO = '#39'FLGDEPIR'#39')         OR (L.NOMECAMPO' +
        ' = '#39'FLGDEPLEGAL'#39')      OR'
      
        '              (L.NOMECAMPO = '#39'FLGDESIGNADO'#39')     OR (L.NOMECAMPO' +
        ' = '#39'FLGDESINADO'#39')      OR '
      
        '              (L.NOMECAMPO = '#39'FLGELEGIVEL'#39')      OR (L.NOMECAMPO' +
        ' = '#39'FLGIGNORAVALIR'#39')   OR'
      
        '              (L.NOMECAMPO = '#39'FLGISENTOIRRF'#39')    OR (L.NOMECAMPO' +
        ' = '#39'FLGMOLESTIAGRAVE'#39') OR '
      
        '              (L.NOMECAMPO = '#39'FLGOBRIDOCPESSOA'#39') OR (L.NOMECAMPO' +
        ' = '#39'TIPOCANCELAMENTO'#39') THEN'
      
        '             DECODE(TRIM(L.VALORALTERADO), '#39'0'#39', '#39'Não'#39', '#39'1'#39', '#39'Sim' +
        #39', L.VALORALTERADO)                '
      '         ELSE'
      '           L.VALORALTERADO'
      '       END AS VALORALTERADO,                              '
      '       L.TRGDTINCLUSAO,'
      
        '       NVL(U.NOME, DECODE(SIGN(INSTR(L.TRGUSERINCLUSAO, '#39'DML_'#39'))' +
        ', 0, '#39'DML_'#39'||L.TRGUSERINCLUSAO, L.TRGUSERINCLUSAO)) AS NOMEUSUAR' +
        'IO'
      '  FROM LOGALTDEPENDENTES L'
      
        '  LEFT JOIN (SELECT '#39'CM'#39'||US.IDUSUARIO AS IDUSER, P.NOME, US.NOM' +
        'EUSUARIO '
      '               FROM USUARIOSISTEMA US '
      
        '               JOIN PESSOA P ON P.IDPESSOA = US.IDUSUARIO) U ON ' +
        'U.IDUSER = L.TRGUSERINCLUSAO '
      'WHERE L.IDPESSOA  = :IDPESSOA'
      ') LG'
      'ORDER BY LG.TRGDTINCLUSAO DESC  '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 80
    Top = 552
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsLogAltDependentes: TDataSource
    DataSet = qryLogAltDependentes
    Left = 192
    Top = 552
  end
  object qryHstSalParticipacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        '/* AS TABELAS SC E SP NÃO SE RELACIONAM, FOI FEITO UM FULL JOIN ' +
        'PARA QUE QUANDO O'
      
        'CAMPO MESFILTRO E TIPO FOR IGUAL UMA DA OUTRA JUNTAR AS MESMAS N' +
        'A MESMA LINHA'
      ''
      
        'O FILTRO = '#39'M'#39' É POR CAUSA QUE NA TABELA SALPARTSRB TEM QUE TRAZ' +
        'ER O REGISTRO COM O MAIOR IDPROCESSO DENTRO DO MESREFER'
      '*/'
      'SELECT'
      '       DISTINCT MESFILTRO,'
      '       TIPO,'
      '       '#39' '#39' AS SALCONT,'
      '       CAST(SALPART AS VARCHAR2(170)) AS SALPART,'
      '       FILTRO'
      'FROM ('
      'SELECT MESFILTRO,'
      '       TIPO,'
      
        '     --  DECODE(SALCONT, LAG(SALCONT) OVER(ORDER BY MESFILTRO DE' +
        'SC, TIPO DESC),'#39#39',SALCONT) AS SALCONT,'
      
        '       DECODE(SALPART, LAG(SALCONT) OVER(ORDER BY MESFILTRO DESC' +
        ', TIPO DESC),'#39#39',SALPART) AS SALPART,'
      '       FILTRO,'
      '       NUMORDEMCLASS'
      '  FROM('
      
        'SELECT  DECODE(SC.MESFILTRO,'#39#39',SP.MESFILTRO,SC.MESFILTRO) AS MES' +
        'FILTRO,'
      '        DECODE(SC.TIPO,'#39#39',SP.TIPO,SC.TIPO) AS TIPO,'
      
        '        DECODE(NVL(SC.TIPO,SP.TIPO), '#39'T'#39', RPAD(NVL(SC.MESFILTRO,' +
        'SP.MESFILTRO), 10, '#39' '#39') || NVL(SC.VALORPROVENTO,0),'
      
        '                                     '#39'E'#39', RPAD('#39'Mês Ref.'#39', 10, '#39 +
        ' '#39') || RPAD('#39'Rubrica'#39', 10, '#39' '#39') ||'
      
        '                                          RPAD('#39'Descrição'#39', 32, ' +
        #39' '#39') || RPAD('#39'Valor'#39', 18, '#39' '#39')  , '
      
        '                                     '#39'D'#39', RPAD(SC.MESFILTRO, 10,' +
        ' '#39' '#39') ||RPAD(SC.IDRUBRICA, 10, '#39' '#39') ||'
      
        '                                          RPAD(NVL(SUBSTR(TRIM((' +
        'SELECT DESCRICAO'
      
        '                                                                ' +
        '  FROM PROVDESC PD'
      
        '                                                                ' +
        ' WHERE IDPROVENTO = SC.IDRUBRICA)),1,30),'#39' '#39'),32,'#39' '#39') ||'
      
        '                                          RPAD(to_char(SC.VALORP' +
        'ROVENTO),18,'#39' '#39')'
      ''
      '        )'
      '        AS SALCONT,   '
      
        '        DECODE(NVL(SP.TIPO,SC.TIPO), '#39'T'#39', RPAD(NVL(SP.MESFILTRO,' +
        'SC.MESFILTRO), 10, '#39' '#39') || '
      
        '                                          RPAD(TO_CHAR(NVL(SP.VA' +
        'LORPARCCOMPORCALC,0), '#39'999G990D00'#39'),16,'#39' '#39') || '
      '                                          SP.DESCRSITCALC,'
      
        '                                     '#39'E'#39', Rpad('#39'Mês Ref.'#39', 10, '#39 +
        ' '#39') || Rpad('#39'Descrição'#39', 19, '#39' '#39') ||'
      
        '                                          Rpad('#39'Código'#39', 13, '#39' '#39 +
        ') || Rpad('#39'Valor'#39', 30, '#39' '#39'),'
      
        '                                     '#39'D'#39', RPAD(SP.MESFILTRO, 10,' +
        ' '#39' '#39') || '
      
        '                                          NVL(RPAD(SP.DESCRICAO,' +
        ' 19, '#39' '#39'),LPAD('#39' '#39',19,'#39' '#39')) ||'
      
        '                                          NVL(RPAD(SP.CODIGO, 10' +
        ', '#39' '#39'),LPAD('#39' '#39',10,'#39' '#39')) || '
      
        '                                          TO_CHAR(SP.VALORPARCCO' +
        'MPORCALC, '#39'999G990D00'#39')'
      '                          ) '
      '        AS SALPART,'
      '        DECODE(SC.FILTRO, '#39#39', SP.FILTRO, SC.FILTRO) AS FILTRO,'
      '        SP.NUMORDEMCLASS  '
      '  FROM('
      'SELECT TIPO, '
      '       MESFILTRO, '
      '       VALORPROVENTO, '
      '       IDRUBRICA,'
      '       FILTRO'
      '  FROM (SELECT '#39'T'#39' AS TIPO,'
      '               H.MESCOBRANCA AS MESFILTRO,'
      '               SUM(H.VALORPROVENTO) AS VALORPROVENTO,'
      '               0 AS IDRUBRICA,'
      '               '#39'M'#39' AS FILTRO'
      '          FROM HISTRUBSAL H,'
      '               PROVDESCXPLANO PDP'
      '         WHERE (H.IDPESSOA = :IDPESSOA)'
      '           AND (H.IDPLANOPREV = PDP.IDPLANOPREV)'
      '           AND (PDP.IDPLANOPREV = :IDPLANOPREV)'
      '           AND (H.IDRUBRICA (+)= PDP.IDRUBRICA)'
      '           AND (PDP.FLGCOMPOESALCONT = 1)'
      '         GROUP BY H.MESCOBRANCA'
      '         '
      '        UNION'
      '        '
      '        SELECT '#39'D'#39' AS TIPO,'
      '               H.MESCOBRANCA AS MESFILTRO,'
      '               H.VALORPROVENTO,'
      '               H.IDRUBRICA,'
      '               '#39'M'#39' AS FILTRO'
      '          FROM HISTRUBSAL H,'
      '               PROVDESCXPLANO PDP'
      '         WHERE (H.IDPESSOA = :IDPESSOA)'
      '           AND (H.IDPLANOPREV (+)= PDP.IDPLANOPREV)'
      '           AND (PDP.IDPLANOPREV = :IDPLANOPREV)'
      '           AND (H.IDRUBRICA = PDP.IDRUBRICA)'
      
        '           AND (PDP.FLGCOMPOESALCONT = 1)                       ' +
        '              '
      '         '
      '         UNION                                   '
      ''
      '        SELECT '#39'E'#39' AS TIPO,                  '
      '               H.MESCOBRANCA AS MESFILTRO,'
      '               0 AS VALORPROVENTO,'
      '               0 AS IDRUBRICA,'
      '               '#39'M'#39' AS FILTRO   '
      '          FROM HISTRUBSAL H, '
      '               PROVDESCXPLANO PDP'
      '         WHERE (H.IDPESSOA = :IDPESSOA)'
      '           AND (H.IDPLANOPREV (+)= PDP.IDPLANOPREV)'
      '           AND (PDP.IDPLANOPREV = :IDPLANOPREV)'
      '           AND (H.IDRUBRICA = PDP.IDRUBRICA)'
      
        '           AND (PDP.FLGCOMPOESALCONT = 1)                       ' +
        '                                                   '
      '                                     ) '
      '                                     '
      ' ORDER BY MESFILTRO DESC, TIPO DESC) SC'
      ' FULL JOIN'
      ' (SELECT  '#39'M'#39' AS FILTRO,'
      '       '#39'E'#39' AS TIPO,  '
      
        '       S.MESREFER AS MESFILTRO,                                 ' +
        ' '
      '       0 AS VALORPARCCOMPORCALC,'
      '       '#39#39' AS DESCRSITCALC,'
      '       '#39#39' AS DESCRICAO,'
      '       '#39#39' AS CODIGO,'
      '       0 AS NUMORDEMCLASS'
      '    FROM SALPARTSRB S'
      '   WHERE S.IDPESSOA = :IDPESSOA '
      '     AND S.IDPESSJUR = :IDPESSJUR '
      '     AND S.IDPLANOPREV = :IDPLANOPREV '
      '     AND S.TIPOCALC = 1'
      '     AND S.SEQPARC = 1'
      '     AND S.TIPOBENEF = 1'
      '       '
      '  UNION '
      '  '
      ' SELECT  CASE '
      
        '            WHEN S.IDPROCESSO <> (SELECT MAX(IDPROCESSO) AS IDPR' +
        'OCESSO FROM SALPARTSRB '
      '                                   WHERE IDPESSOA = :IDPESSOA '
      '                                     AND IDPESSJUR = :IDPESSJUR '
      
        '                                     AND IDPLANOPREV = :IDPLANOP' +
        'REV '
      '                                     AND TIPOCALC = 1'
      '                                     AND TIPOBENEF = 1'
      '                                     AND SEQPARC = 1'
      '                                     AND IDPARC = 10'
      
        '                                     AND MESREFER = S.MESREFER) ' +
        'THEN '#39#39
      '            ELSE '#39'M'#39
      '          END'
      '           AS FILTRO,'
      '          '#39'T'#39' AS TIPO,'
      '          S.MESREFER AS MESFILTRO,'
      '          S.VALORPARCCOMPORCALC,'
      '         DECODE(S.SITCALC, 1, '#39'Calculado'#39','
      '                          3, '#39'Efetivado'#39') '
      '          AS DESCRSITCALC,           '
      '          '#39#39' AS DESCRICAO,'
      '          '#39#39' AS CODIGO,'
      '          0 AS NUMORDEMCLASS'
      '  FROM SALPARTSRB S'
      ' WHERE S.IDPESSOA = :IDPESSOA '
      '   AND S.IDPESSJUR = :IDPESSJUR '
      '   AND S.IDPLANOPREV = :IDPLANOPREV '
      '   AND S.TIPOCALC = 1'
      '   AND S.SEQPARC = 1'
      '   AND S.TIPOBENEF = 1 '
      '   AND S.IDPARC = 10'
      '   '
      'UNION'
      ''
      'SELECT  CASE '
      '            WHEN S.MESREFER <> S.MESREFERPARC OR '
      
        '                 S.IDPROCESSO <> (SELECT MAX(IDPROCESSO) AS IDPR' +
        'OCESSO FROM SALPARTSRB '
      '                                   WHERE IDPESSOA = :IDPESSOA '
      '                                     AND IDPESSJUR = :IDPESSJUR '
      
        '                                     AND IDPLANOPREV = :IDPLANOP' +
        'REV '
      '                                     AND TIPOCALC = 1'
      '                                     AND TIPOBENEF = 1'
      '                                     AND SEQPARC = 1'
      '                                     AND IDPARC <> 10'
      
        '                                     AND MESREFER = S.MESREFER) ' +
        'THEN '#39#39
      '            ELSE '#39'M'#39
      '          END'
      '           AS FILTRO,'
      '          '#39'D'#39' AS TIPO,                     '
      '          S.MESREFER AS MESFILTRO,'
      '          S.VALORPARCCOMPORCALC,'
      '          '#39#39' AS DESCRSITCALC,'
      '          CASE'
      
        '            WHEN TIPOCODORIGEM = 2 AND S.IDPARC = 200  THEN C.NO' +
        'MERESUMIDO'
      '            ELSE P.NOMERESPARC'
      '          END '
      '          AS DESCRICAO,'
      '          CASE'
      '            WHEN S.IDPARC IN (100,200) THEN CODORIGEM'
      '            WHEN S.IDPARC = 110 THEN TO_CHAR(PERCORIGEMPARC)'
      '            ELSE '#39#39'  '
      '          END'
      '          AS CODIGO,'
      '          P.NUMORDEMCLASS'
      '  FROM SALPARTSRB S, PARCSALPARTSRB P, CARGOEXT C'
      ' WHERE S.IDPESSOA = :IDPESSOA '
      '   AND S.IDPESSJUR = :IDPESSJUR '
      '   AND S.IDPLANOPREV = :IDPLANOPREV '
      '   AND S.IDPARC = P.IDPARC'
      '   AND S.CODORIGEM = C.CODIGO(+)'
      '   AND S.TIPOCALC = 1'
      '   AND S.SEQPARC = 1'
      '   AND S.TIPOBENEF = 1 '
      '   AND S.IDPARC <> 10 '
      '   ) SP'
      'ON (SC.MESFILTRO = SP.MESFILTRO AND SC.TIPO = SP.TIPO)'
      ')'
      ' WHERE FILTRO = '#39'M'#39
      'ORDER BY MESFILTRO DESC, TIPO DESC, NUMORDEMCLASS  )'
      ''
      'ORDER BY MESFILTRO DESC, TIPO DESC '
      ' '
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'VALORPROVENTO'#9'###.###.###.##0,00'#9'T'#9'T'
      'SUMPROVENTO'#9'999,999,999,999.99'#9'T'#9'F'
      'SUMDESCONTO'#9'999,999,999,999.99'#9'T'#9'F'
      'SUMLIQ'#9'999,999,999,999.99'#9'T'#9'F')
    ValidateWithMask = True
    Left = 150
    Top = 250
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
    object qryHstSalParticipacaoSALPART: TStringField
      FieldName = 'SALPART'
      Size = 112
    end
    object qryHstSalParticipacaoSALCONT: TStringField
      FieldName = 'SALCONT'
      Size = 82
    end
    object qryHstSalParticipacaoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object qryHstSalParticipacaoMESFILTRO: TStringField
      FieldName = 'MESFILTRO'
      FixedChar = True
      Size = 7
    end
  end
  object qryHstSalParticipacaoAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        '/* AS TABELAS SC E SP NÃO SE RELACIONAM, FOI FEITO UM FULL JOIN ' +
        'PARA QUE QUANDO O'
      
        'CAMPO MESFILTRO E TIPO FOR IGUAL UMA DA OUTRA JUNTAR AS MESMAS N' +
        'A MESMA LINHA'
      ''
      
        'O FILTRO = '#39'M'#39' É POR CAUSA QUE NA TABELA SALPARTSRB TEM QUE TRAZ' +
        'ER O REGISTRO COM O MAIOR IDPROCESSO DENTRO DO MESREFER'
      '*/'
      'SELECT'
      '       DISTINCT MESFILTRO,'
      '       TIPO,'
      '       CAST(SALCONT AS VARCHAR(170)) AS SALCONT,'
      '       CAST('#39' '#39' AS VARCHAR(170)) AS SALPART,'
      '       FILTRO'
      'FROM ('
      'SELECT  MESFILTRO,'
      '       TIPO,'
      
        '       DECODE(SALCONT, LAG(SALCONT) OVER(ORDER BY MESFILTRO DESC' +
        ', TIPO DESC),'#39#39',SALCONT) AS SALCONT, '
      
        '     --  DECODE(SALPART, LAG(SALCONT) OVER(ORDER BY MESFILTRO DE' +
        'SC, TIPO DESC),'#39#39',SALPART) AS SALPART,'
      '       FILTRO,'
      '       NUMORDEMCLASS'
      '  FROM('
      
        'SELECT  DECODE(SC.MESFILTRO,'#39#39',SP.MESFILTRO,SC.MESFILTRO) AS MES' +
        'FILTRO,  '
      '        DECODE(SC.TIPO,'#39#39',SP.TIPO,SC.TIPO) AS TIPO,'
      
        '        DECODE(NVL(SC.TIPO,SP.TIPO), '#39'T'#39', RPAD(NVL(SC.MESFILTRO,' +
        'SP.MESFILTRO), 10, '#39' '#39') || NVL(SC.VALORPROVENTO,0),'
      
        '                                     '#39'E'#39', RPAD('#39'Mês Ref.'#39', 10, '#39 +
        ' '#39') || RPAD('#39'Rubrica'#39', 10, '#39' '#39') ||'
      
        '                                          RPAD('#39'Descrição'#39', 32, ' +
        #39' '#39') || RPAD('#39'Valor'#39', 18, '#39' '#39')  , '
      
        '                                     '#39'D'#39', RPAD(SC.MESFILTRO, 10,' +
        ' '#39' '#39') ||RPAD(SC.IDRUBRICA, 10, '#39' '#39') ||'
      
        '                                          RPAD(NVL(SUBSTR(TRIM((' +
        'SELECT DESCRICAO'
      
        '                                                                ' +
        '  FROM PROVDESC PD'
      
        '                                                                ' +
        ' WHERE IDPROVENTO = SC.IDRUBRICA)),1,30),'#39' '#39'),32,'#39' '#39') ||'
      
        '                                          RPAD(to_char(SC.VALORP' +
        'ROVENTO),18,'#39' '#39')'
      '                                          '
      '        )'
      '        AS SALCONT,   '
      
        '        DECODE(NVL(SP.TIPO,SC.TIPO), '#39'T'#39', RPAD(NVL(SP.MESFILTRO,' +
        'SC.MESFILTRO), 10, '#39' '#39') ||'
      
        '                                          RPAD(TO_CHAR(NVL(SP.VA' +
        'LORPARCCOMPORCALC,0), '#39'999G990D00'#39'),16,'#39' '#39') || '
      '                                          SP.DESCRSITCALC,'
      
        '                                     '#39'E'#39', Rpad('#39'Mês Ref.'#39', 10, '#39 +
        ' '#39') || Rpad('#39'Descrição'#39', 19, '#39' '#39') ||'
      
        '                                          Rpad('#39'Código'#39', 13, '#39' '#39 +
        ') || Rpad('#39'Valor'#39', 30, '#39' '#39'),'
      
        '                                     '#39'D'#39', RPAD(SP.MESFILTRO, 10,' +
        ' '#39' '#39') || '
      
        '                                          NVL(RPAD(SP.DESCRICAO,' +
        ' 19, '#39' '#39'),LPAD('#39' '#39',19,'#39' '#39')) ||'
      
        '                                          NVL(RPAD(SP.CODIGO, 10' +
        ', '#39' '#39'),LPAD('#39' '#39',10,'#39' '#39')) || '
      
        '                                          TO_CHAR(SP.VALORPARCCO' +
        'MPORCALC, '#39'999G990D00'#39')'
      '                          ) '
      '        AS SALPART,'
      '        DECODE(SC.FILTRO, '#39#39', SP.FILTRO, SC.FILTRO) AS FILTRO,'
      '        SP.NUMORDEMCLASS  '
      '  FROM('
      'SELECT TIPO, '
      '       MESFILTRO, '
      '       VALORPROVENTO, '
      '       IDRUBRICA,'
      '       FILTRO'
      '  FROM (SELECT '#39'T'#39' AS TIPO,'
      '               H.MESCOBRANCA AS MESFILTRO,'
      '               SUM(H.VALORPROVENTO) AS VALORPROVENTO,'
      '               0 AS IDRUBRICA,'
      '               '#39'M'#39' AS FILTRO'
      '          FROM HISTRUBSAL H,'
      '               PROVDESCXPLANO PDP'
      '         WHERE (H.IDPESSOA = :IDPESSOA)'
      '           AND (H.IDPLANOPREV = PDP.IDPLANOPREV)'
      '           AND (PDP.IDPLANOPREV = :IDPLANOPREV)'
      '           AND (H.IDRUBRICA (+)= PDP.IDRUBRICA)'
      '           AND (PDP.FLGCOMPOESALCONT = 1)'
      '         GROUP BY H.MESCOBRANCA'
      '         '
      '        UNION'
      '        '
      '        SELECT '#39'D'#39' AS TIPO,'
      '               H.MESCOBRANCA AS MESFILTRO,'
      '               H.VALORPROVENTO,'
      '               H.IDRUBRICA,'
      '               '#39'M'#39' AS FILTRO'
      '          FROM HISTRUBSAL H,'
      '               PROVDESCXPLANO PDP'
      '         WHERE (H.IDPESSOA = :IDPESSOA)'
      '           AND (H.IDPLANOPREV (+)= PDP.IDPLANOPREV)'
      '           AND (PDP.IDPLANOPREV = :IDPLANOPREV)'
      '           AND (H.IDRUBRICA = PDP.IDRUBRICA)'
      
        '           AND (PDP.FLGCOMPOESALCONT = 1)                       ' +
        '              '
      '         '
      '         UNION                                   '
      ''
      '        SELECT '#39'E'#39' AS TIPO,                  '
      '               H.MESCOBRANCA AS MESFILTRO,'
      '               0 AS VALORPROVENTO,'
      '               0 AS IDRUBRICA,'
      '               '#39'M'#39' AS FILTRO   '
      '          FROM HISTRUBSAL H, '
      '               PROVDESCXPLANO PDP'
      '         WHERE (H.IDPESSOA = :IDPESSOA)'
      '           AND (H.IDPLANOPREV (+)= PDP.IDPLANOPREV)'
      '           AND (PDP.IDPLANOPREV = :IDPLANOPREV)'
      '           AND (H.IDRUBRICA = PDP.IDRUBRICA)'
      
        '           AND (PDP.FLGCOMPOESALCONT = 1)                       ' +
        '                                                   '
      '                                     ) '
      '                                     '
      ' ORDER BY MESFILTRO DESC, TIPO DESC) SC'
      ' FULL JOIN'
      ' (SELECT  '#39'M'#39' AS FILTRO,'
      '       '#39'E'#39' AS TIPO,  '
      
        '       S.MESREFER AS MESFILTRO,                                 ' +
        ' '
      '       0 AS VALORPARCCOMPORCALC,'
      '       '#39#39' AS DESCRSITCALC,'
      '       '#39#39' AS DESCRICAO,'
      '       '#39#39' AS CODIGO,'
      '       0 AS NUMORDEMCLASS'
      '    FROM SALPARTSRB S'
      '   WHERE S.IDPESSOA = :IDPESSOA '
      '     AND S.IDPESSJUR = :IDPESSJUR '
      '     AND S.IDPLANOPREV = :IDPLANOPREV '
      '     AND S.TIPOCALC = 1'
      '     AND S.SEQPARC = 1'
      '     AND S.TIPOBENEF = 1'
      '       '
      '  UNION '
      '  '
      ' SELECT  CASE '
      
        '            WHEN S.IDPROCESSO <> (SELECT MAX(IDPROCESSO) AS IDPR' +
        'OCESSO FROM SALPARTSRB '
      '                                   WHERE IDPESSOA = :IDPESSOA '
      '                                     AND IDPESSJUR = :IDPESSJUR '
      
        '                                     AND IDPLANOPREV = :IDPLANOP' +
        'REV '
      '                                     AND TIPOCALC = 1'
      '                                     AND TIPOBENEF = 1'
      '                                     AND SEQPARC = 1'
      '                                     AND IDPARC = 10'
      
        '                                     AND MESREFER = S.MESREFER) ' +
        'THEN '#39#39
      '            ELSE '#39'M'#39
      '          END'
      '           AS FILTRO,'
      '          '#39'T'#39' AS TIPO,                     '
      '          S.MESREFER AS MESFILTRO,'
      '          S.VALORPARCCOMPORCALC,'
      '         DECODE(S.SITCALC, 1, '#39'Calculado'#39','
      '                          3, '#39'Efetivado'#39') '
      '          AS DESCRSITCALC,           '
      '          '#39#39' AS DESCRICAO,'
      '          '#39#39' AS CODIGO,'
      '          0 AS NUMORDEMCLASS'
      '  FROM SALPARTSRB S'
      ' WHERE S.IDPESSOA = :IDPESSOA '
      '   AND S.IDPESSJUR = :IDPESSJUR '
      '   AND S.IDPLANOPREV = :IDPLANOPREV '
      '   AND S.TIPOCALC = 1'
      '   AND S.SEQPARC = 1'
      '   AND S.TIPOBENEF = 1 '
      '   AND S.IDPARC = 10'
      '   '
      'UNION'
      ''
      'SELECT  CASE '
      '            WHEN S.MESREFER <> S.MESREFERPARC OR '
      
        '                 S.IDPROCESSO <> (SELECT MAX(IDPROCESSO) AS IDPR' +
        'OCESSO FROM SALPARTSRB '
      '                                   WHERE IDPESSOA = :IDPESSOA '
      '                                     AND IDPESSJUR = :IDPESSJUR '
      
        '                                     AND IDPLANOPREV = :IDPLANOP' +
        'REV '
      '                                     AND TIPOCALC = 1'
      '                                     AND TIPOBENEF = 1'
      '                                     AND SEQPARC = 1'
      '                                     AND IDPARC <> 10'
      
        '                                     AND MESREFER = S.MESREFER) ' +
        'THEN '#39#39
      '            ELSE '#39'M'#39
      '          END'
      '           AS FILTRO,'
      '          '#39'D'#39' AS TIPO,                     '
      '          S.MESREFER AS MESFILTRO,'
      '          S.VALORPARCCOMPORCALC,'
      '          '#39#39' AS DESCRSITCALC,'
      '          CASE'
      
        '            WHEN TIPOCODORIGEM = 2 AND S.IDPARC = 200  THEN C.NO' +
        'MERESUMIDO'
      '            ELSE P.NOMERESPARC'
      '          END '
      '          AS DESCRICAO,'
      '          CASE'
      '            WHEN S.IDPARC IN (100,200) THEN CODORIGEM'
      '            WHEN S.IDPARC = 110 THEN TO_CHAR(PERCORIGEMPARC)'
      '            ELSE '#39#39'  '
      '          END'
      '          AS CODIGO,'
      '          P.NUMORDEMCLASS'
      '  FROM SALPARTSRB S, PARCSALPARTSRB P, CARGOEXT C'
      ' WHERE S.IDPESSOA = :IDPESSOA '
      '   AND S.IDPESSJUR = :IDPESSJUR '
      '   AND S.IDPLANOPREV = :IDPLANOPREV '
      '   AND S.IDPARC = P.IDPARC'
      '   AND S.CODORIGEM = C.CODIGO(+)'
      '   AND S.TIPOCALC = 1'
      '   AND S.SEQPARC = 1'
      '   AND S.TIPOBENEF = 1 '
      '   AND S.IDPARC <> 10 '
      '   ) SP'
      'ON (SC.MESFILTRO = SP.MESFILTRO AND SC.TIPO = SP.TIPO)'
      ')'
      ' WHERE FILTRO = '#39'M'#39
      ' ORDER BY MESFILTRO DESC, TIPO DESC, NUMORDEMCLASS'
      ')'
      ''
      'ORDER BY MESFILTRO DESC, TIPO DESC'
      ' ')
    PictureMasks.Strings = (
      'VALORPROVENTO'#9'###.###.###.##0,00'#9'T'#9'T'
      'SUMPROVENTO'#9'999,999,999,999.99'#9'T'#9'F'
      'SUMDESCONTO'#9'999,999,999,999.99'#9'T'#9'F'
      'SUMLIQ'#9'999,999,999,999.99'#9'T'#9'F')
    ValidateWithMask = True
    Left = 150
    Top = 306
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
    object StringField7: TStringField
      FieldName = 'SALPART'
      Size = 112
    end
    object StringField8: TStringField
      FieldName = 'SALCONT'
      Size = 82
    end
    object StringField9: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object StringField10: TStringField
      FieldName = 'MESFILTRO'
      FixedChar = True
      Size = 7
    end
  end
  object qryHistSRBregreplan: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT  DECODE(TIPO, '#39'T'#39', RPAD(MESREFER, 14, '#39' '#39') || '
      
        '                          RPAD(TO_CHAR(VALORPARCCOMPORCALC,'#39'999G' +
        '990D00'#39'), 20, '#39' '#39') || '
      '                          DESCRSITCALC, '
      
        '                     '#39'E'#39', RPAD('#39'Mês Ref.'#39', 9, '#39' '#39') || RPAD('#39'Desc' +
        'rição'#39', 15, '#39' '#39') ||'
      
        '                          RPAD('#39'Código'#39', 7,  '#39' '#39') || RPAD('#39'%Caix' +
        'a'#39', 7, '#39' '#39') ||'
      '                          RPAD('#39'%Funcef'#39', 10, '#39' '#39') || '#39'Valor'#39', '
      
        '                     '#39'D'#39', MESREFER || '#39'  '#39' || RPAD(NVL(SUBSTR(DE' +
        'SCRICAO,1,15),'#39' '#39'),15,'#39' '#39') ||'
      
        '                          RPAD(NVL(SUBSTR(CODIGO,1,6), '#39' '#39'),6,'#39' ' +
        #39') ||'
      
        '                          RPAD(NVL(TO_CHAR(PERCORIGEMPARC, '#39'999D' +
        '99'#39'),'#39' '#39'), 7, '#39' '#39') ||'
      
        '                          RPAD(NVL(TO_CHAR(PERCREALFUNCEFPARC, '#39 +
        '999D99'#39'),'#39' '#39'), 7, '#39' '#39') || '
      
        '                          TO_CHAR(VALORPARCCOMPORCALC,'#39'999G990D0' +
        '0'#39')'
      '                     )'
      '                      AS SRB,'
      '       TIPOBENEF,'
      '       MESREFER,'
      '       MESREFERPARC,'
      '       TIPO,'
      '       CODIGO,'
      '       FILTRO,'
      '       IDPROCESSO'
      '       '
      'FROM('
      'SELECT CASE '
      
        '         WHEN IDPROCESSO <> (SELECT MAX(IDPROCESSO) FROM SALPART' +
        'SRB'
      
        '                            WHERE IDPESSOA = :IDPESSOA          ' +
        '        '
      '                              AND IDPESSJUR = :IDPESSJUR'
      '                              AND IDPLANOPREV = :IDPLANOPREV'
      '                              AND TIPOCALC = 2'
      '                              AND IDPARC = S.IDPARC'
      '                              AND TIPOBENEF = S.TIPOBENEF'
      '                              AND MESREFER = S.MESREFER)'
      '         THEN '#39#39
      '         ELSE '#39'M'#39' '
      '       END'
      '       AS FILTRO,'
      '       S.MESREFER, '
      '       S.MESREFERPARC,'
      '       S.IDPROCESSO, '
      '       S.TIPOCALC, '
      '       S.IDPARC, '
      '       S.TIPOBENEF,'
      '       S.VALORPARCCOMPORCALC,'
      '       DECODE(SITCALC, 1, '#39'Calculado'#39','
      '                       3, '#39'Efetivado'#39
      '                       ,  '#39#39') AS DESCRSITCALC,'
      '       '#39#39' AS CODIGO,'
      '       S.PERCORIGEMPARC,'
      '       S.PERCREALFUNCEFPARC,'
      '       '#39#39'  AS DESCRICAO,'
      '       '#39'T'#39' AS TIPO,'
      '       0 AS NUMORDEMCLASS    '
      '  FROM SALPARTSRB S'
      '  WHERE S.IDPESSOA = :IDPESSOA                  '
      '        AND S.IDPESSJUR = :IDPESSJUR'
      '        AND S.IDPLANOPREV = :IDPLANOPREV'
      '        AND S.TIPOCALC = 2'
      '        AND S.TIPOBENEF IN (2, 3)'
      '        AND S.IDPARC = 15'
      'UNION'
      'SELECT CASE '
      
        '         WHEN IDPROCESSO <> (SELECT MAX(IDPROCESSO) FROM SALPART' +
        'SRB'
      
        '                            WHERE IDPESSOA = :IDPESSOA          ' +
        '        '
      '                              AND IDPESSJUR = :IDPESSJUR'
      '                              AND IDPLANOPREV = :IDPLANOPREV'
      '                              AND TIPOCALC = 2'
      '                              AND IDPARC = S.IDPARC'
      '                              AND TIPOBENEF = S.TIPOBENEF'
      '                              AND MESREFER = S.MESREFER)'
      '         THEN '#39#39
      '         ELSE '#39'M'#39' '
      '       END'
      '       AS FILTRO,'
      '       S.MESREFER, '
      '       S.MESREFERPARC,'
      '       S.IDPROCESSO, '
      '       S.TIPOCALC, '
      '       S.IDPARC, '
      '       S.TIPOBENEF,'
      '       S.VALORPARCCOMPORCALC,'
      '       DECODE(SITCALC, 1, '#39'Calculado'#39','
      '                       3, '#39'Efetivado'#39
      '                       ,  '#39#39') AS DESCRSITCALC,'
      '       CASE'
      '         WHEN S.IDPARC IN (100, 200, 201, 202) THEN S.CODORIGEM'
      '         ELSE '#39#39
      '         END'
      '         AS CODIGO,'
      '       S.PERCORIGEMPARC,'
      '       S.PERCREALFUNCEFPARC,'
      '       CASE'
      
        '         WHEN S.TIPOCODORIGEM = 2 AND S.IDPARC = 20 THEN C.NOMER' +
        'ESUMIDO'
      '         ELSE P.NOMERESPARC'
      '         END'
      '         AS DESCRICAO,'
      '       '#39'D'#39' AS TIPO,'
      '       P.NUMORDEMCLASS    '
      '  FROM SALPARTSRB S, PARCSALPARTSRB P, CARGOEXT C'
      '  WHERE S.IDPESSOA = :IDPESSOA                  '
      '        AND S.IDPESSJUR = :IDPESSJUR'
      '        AND S.IDPLANOPREV = :IDPLANOPREV'
      '        AND S.TIPOCALC = 2'
      '        AND S.TIPOBENEF IN (2, 3)'
      '        AND S.IDPARC >= 100'
      '        AND S.IDPARC = P.IDPARC'
      '        AND S.CODORIGEM = C.CODIGO(+)'
      'UNION'
      'SELECT  '#39'M'#39' AS FILTRO,   '
      '        MESREFER, '
      '        '#39#39' AS MESREFERPARC,'
      '        0 AS IDPROCESSO, '
      '        0 AS TIPOCALC, '
      '        0 AS IDPARC, '
      '        TIPOBENEF,'
      '        0 AS VALORPARCCOMPORCALC,'
      '        '#39#39' AS DESCRSITCALC,'
      '        '#39#39' AS CODIGO,'
      '        0 AS PERCORIGEMPARC,'
      '        0 AS PERCREALFUNCEFPARC,'
      '        '#39#39' AS DESCRICAO,'
      '        '#39'E'#39' AS TIPO,'
      '        0 AS NUMORDEMCLASS'
      '    FROM SALPARTSRB'
      '      WHERE IDPESSOA = :IDPESSOA                  '
      '        AND IDPESSJUR = :IDPESSJUR'
      '        AND IDPLANOPREV = :IDPLANOPREV'
      '        AND TIPOCALC = 2'
      '        AND TIPOBENEF IN (2, 3)'
      ')'
      '  WHERE FILTRO = '#39'M'#39
      'ORDER BY MESREFER DESC, TIPO DESC, NUMORDEMCLASS'
      '')
    ValidateWithMask = True
    Left = 120
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object dsHistSRBGrid02: TDataSource
    DataSet = qryHistSRBGrid02
    Left = 88
    Top = 153
  end
  object qryHistSRBGrid01: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SessionName = 'Default'
    SQL.Strings = (
      
        'SELECT '#39'                                                        ' +
        '                                 '#39' AS SRB, '
      '               '#39'                     '#39' AS MESREFER,'
      '               '#39' '#39' AS TIPO'
      'FROM DUAL')
    UpdateObject = updHistSRBGrid01
    ValidateWithMask = True
    Left = 224
    Top = 178
  end
  object qryHistSRBnovoplano: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'SELECT DECODE(TIPO, '#39'A'#39', LPAD('#39'SALPART'#39', 17,'#39' '#39') || '#39'    '#39' || '#39'V' +
        'alor SRB'#39', '
      '                    '#39'T'#39', RPAD(MESREFER, 7, '#39' '#39') ||'
      
        '                         RPAD(TO_CHAR(VALORBASECALC, '#39'999G990D00' +
        #39'), 11, '#39' '#39') ||'
      
        '                         RPAD(TO_CHAR(VALORPARCCOMPORCALC, '#39'999G' +
        '990D00'#39'), 13, '#39' '#39') || DESCRSITCALC, '
      
        '                    '#39'E'#39', RPAD('#39'Mês Ref.'#39', 12, '#39' '#39') || RPAD('#39'Ref.' +
        #39', 9, '#39' '#39') ||'
      '                         RPAD('#39'INPC'#39', 9, '#39' '#39') || '#39'INPC ACUM'#39' ,'
      '                    '#39'D'#39', '
      
        '                         NVL(DECODE(MESREFERPARC,LAG(MESREFERPAR' +
        'C)'
      
        '                                             OVER(ORDER BY MESRE' +
        'FER DESC,TIPO DESC,MESREFERPARC DESC,MESREFINDICE DESC)'
      
        '                                             ,'#39#39',MESREFERPARC),L' +
        'PAD('#39' '#39', 7, '#39' '#39')) ||  '
      
        '                         RPAD('#39' '#39', 3, '#39' '#39') || RPAD(MESREFINDICE,' +
        ' 10, '#39' '#39') ||'
      
        '                         RPAD(TO_CHAR(VALORINDICEREFER, '#39'0D00'#39'),' +
        ' 10, '#39' '#39')  || TO_CHAR(VALORINDICEACUMREFER, '#39'0D00999'#39')  '
      '                        ) AS SRB,'
      '              TIPO,'
      '              MESREFER'
      'FROM('
      'SELECT '
      '       CASE'
      
        '          WHEN IDPROCESSO <> (SELECT MAX(IDPROCESSO) FROM SALPAR' +
        'TSRB'
      '                              WHERE IDPESSOA = :IDPESSOA        '
      '                                AND IDPESSJUR = :IDPESSJUR'
      '                                AND IDPLANOPREV = :IDPLANOPREV'
      '                                AND IDPARC = 25'
      '                                AND TIPOCALC = 4'
      '                                AND TIPOBENEF = 2'
      '                                AND SEQPARC = 1'
      '                                AND MESREFER = S.MESREFER)'
      '          THEN '#39#39
      '          ELSE '#39'M'#39
      '        END  '
      '             AS FILTRO, '
      '       S.MESREFER, '
      '       S.MESREFERPARC,'
      '       S.IDPROCESSO, '
      '       S.TIPOCALC, '
      '       S.IDPARC, '
      '       S.TIPOBENEF,'
      '       S.VALORPARCCOMPORCALC,'
      '       S.VALORBASECALC,'
      '       DECODE(SITCALC, 1, '#39'Calculado'#39','
      '                       3, '#39'Efetivado'#39
      '                       ,  '#39#39') AS DESCRSITCALC,'
      '       0 AS VALORINDICEREFER,'
      '       0 AS VALORINDICEACUMREFER,'
      '       '#39'T'#39' AS TIPO,'
      '       '#39#39' AS MESREFINDICE,'
      '       S.SEQINDICE '
      '  FROM SALPARTSRB S'
      '  WHERE IDPESSOA = :IDPESSOA        '
      '        AND S.IDPESSJUR = :IDPESSJUR'
      '        AND S.IDPLANOPREV = :IDPLANOPREV'
      '        AND S.IDPARC = 25'
      '        AND S.TIPOCALC = 4'
      '        AND S.TIPOBENEF = 2'
      '        AND S.SEQPARC = 1'
      'UNION'
      'SELECT  '#39'M'#39' AS FILTRO,   '
      '        MESREFER, '
      '        '#39#39' AS MESREFERPARC,'
      '        0 AS IDPROCESSO, '
      '        0 AS TIPOCALC, '
      '        0 AS IDPARC, '
      '        0 AS TIPOBENEF,'
      '        0 AS VALORPARCCOMPORCALC,'
      '        0 AS VALORBASECALC,'
      '        '#39#39' AS DESCRSITCALC,'
      '        0 AS VALORINDICEREFER, '
      '        0 AS VALORINDICEACUMREFER,'
      '        '#39'E'#39' AS TIPO,'
      '        '#39#39' AS MESREFINDICE,'
      '        0 AS SEQINDICE'
      '    FROM SALPARTSRB S'
      '     WHERE IDPESSOA = :IDPESSOA        '
      '        AND S.IDPESSJUR = :IDPESSJUR'
      '        AND S.IDPLANOPREV = :IDPLANOPREV'
      '        AND S.TIPOCALC = 4'
      '        AND S.IDPARC = 25'
      '        AND S.TIPOBENEF = 2'
      '        AND S.SEQPARC = 1'
      'UNION'
      'SELECT  '#39'M'#39' AS FILTRO,   '
      '        '#39#39' AS MESREFER, '
      '        '#39#39' AS MESREFERPARC,'
      '        0 AS IDPROCESSO, '
      '        0 AS TIPOCALC, '
      '        0 AS IDPARC, '
      '        0 AS TIPOBENEF,'
      '        0 AS VALORPARCCOMPORCALC,'
      '        0 AS VALORBASECALC,'
      '        '#39#39' AS DESCRSITCALC,'
      '        0 AS VALORINDICEREFER,'
      '        0 AS VALORINDICEACUMREFER,'
      '        '#39'A'#39' AS TIPO,'
      '        '#39#39' AS MESREFINDICE,'
      '        0 AS SEQINDICE'
      '    FROM DUAL'
      'UNION'
      'SELECT  CASE'
      
        '          WHEN IDPROCESSO <> (SELECT MAX(IDPROCESSO) FROM SALPAR' +
        'TSRB'
      '                              WHERE IDPESSOA = :IDPESSOA        '
      '                                AND IDPESSJUR = :IDPESSJUR'
      '                                AND IDPLANOPREV = :IDPLANOPREV'
      '                                AND IDPARC = 25'
      '                                AND TIPOCALC = 4'
      '                                AND TIPOBENEF = 2'
      '                                AND SEQPARC = 1'
      '                                AND MESREFER = S.MESREFER)'
      '          THEN '#39#39
      '          ELSE '#39'M'#39
      '        END'
      '          AS FILTRO,'
      '        S.MESREFER, '
      '        SIND.MESREFPARC AS MESREFERPARC,'
      '        S.IDPROCESSO, '
      '        0 AS TIPOCALC, '
      '        0 AS IDPARC, '
      '        0 AS TIPOBENEF,'
      '        0 AS VALORPARCCOMPORCALC,'
      '        0 AS VALORBASECALC,'
      '        '#39#39' AS DESCRSITCALC,'
      '        SIND.VALORINDICEREF AS VALORINDICEREFER,'
      '        SIND.VALORINDICEACUMREF AS VALORINDICEACUMREFER,'
      '        '#39'D'#39' AS TIPO,'
      '        MESREFINDICE,'
      '        S.SEQINDICE'
      '   FROM SALPARTSRB S, SALPARTINDICE SIND'
      '     WHERE IDPESSOA = :IDPESSOA        '
      '        AND S.IDPESSJUR = :IDPESSJUR'
      '        AND S.IDPLANOPREV = :IDPLANOPREV'
      '        AND S.TIPOCALC = 4'
      '        AND S.TIPOBENEF = 2'
      '        AND S.IDPARC = 25'
      '        AND S.SEQPARC = 1'
      '        AND S.SEQINDICE = SIND.SEQINDICE'
      ')'
      '  WHERE FILTRO = '#39'M'#39
      'ORDER BY MESREFER DESC,TIPO DESC, MESREFINDICE DESC')
    ValidateWithMask = True
    Left = 128
    Top = 349
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryHistSRBreb: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT  DECODE(TIPO, '#39'A'#39', LPAD('#39'Valor SRB'#39', 22, '#39' '#39'),'
      
        '                    '#39'T'#39', RPAD(MESREFER, 10, '#39' '#39') || RPAD(TO_CHAR' +
        '(VALORPARCCOMPORCALC, '#39'999G990D00'#39'), 20, '#39' '#39') || '
      '                         DESCRSITCALC,'
      
        '                    '#39'E'#39', RPAD('#39'Mês Ref.'#39', 11, '#39' '#39') || RPAD('#39'Ref.' +
        #39', 8, '#39' '#39') ||'
      
        '                         RPAD('#39'SALPART'#39', 10, '#39' '#39') || RPAD('#39'INPC'#39 +
        ', 6, '#39' '#39') ||'
      '                         RPAD('#39'INPC ACUM'#39', 12, '#39' '#39') || '#39'Valor'#39', '
      '                    '#39'D'#39', NVL(DECODE(MESDETALHE,'
      
        '                         LAG(MESDETALHE) OVER(ORDER BY MESREFER ' +
        'DESC, TIPO DESC, MESREFERPARC DESC),'
      '                         '#39#39', MESDETALHE),'#39'       '#39')'
      '                         || '#39'  '#39' ||  MESREFERPARC || '
      
        '                         RPAD(TO_CHAR(NVL(VALORBASECALC,0), '#39'999' +
        'G990D00'#39'), 12, '#39' '#39') || '
      
        '                         RPAD(TO_CHAR(NVL(VALORINDICEREFER,0), '#39 +
        '0D00'#39'), 7, '#39' '#39') ||'
      
        '                         RPAD(TO_CHAR(NVL(VALORINDICEACUMREFER,0' +
        '), '#39'0D00999'#39'), 8, '#39' '#39') || '
      
        '                         TO_CHAR(NVL(VALORPARCCOMPORCALC,0), '#39'99' +
        '9G990D00'#39')) AS SRB,'
      '       MESREFER,  '
      '       TIPO,'
      '       FILTRO,'
      '       IDPROCESSO,'
      '       IDPARC  '
      'FROM('
      'SELECT '
      '       CASE'
      
        '          WHEN IDPROCESSO <> (SELECT MAX(IDPROCESSO) FROM SALPAR' +
        'TSRB'
      '                            WHERE IDPESSOA = :IDPESSOA  '
      '                              AND IDPESSJUR = :IDPESSJUR  '
      '                              AND IDPLANOPREV = :IDPLANOPREV  '
      '                              AND TIPOCALC = S.TIPOCALC'
      '                              AND TIPOBENEF = 2'
      '                              AND SEQPARC = 1'
      '                              AND IDPARC = S.IDPARC '
      '                              AND MESREFER = S.MESREFER)    '
      '                              THEN '#39#39
      '            ELSE '#39'M'#39
      '       END'
      '       AS FILTRO,'
      '       S.MESREFER,   '
      '       S.MESREFERPARC,'
      '       S.IDPROCESSO, '
      '       S.TIPOCALC, '
      '       S.IDPARC, '
      '       S.TIPOBENEF,'
      '       S.VALORPARCCOMPORCALC,'
      '       DECODE(SITCALC, 1, '#39'Calculado'#39','
      '                       3, '#39'Efetivado'#39
      '                       ,  '#39#39') AS DESCRSITCALC,'
      '       CASE'
      '         WHEN IDPARC = 100 OR IDPARC = 200 THEN CODORIGEM'
      '         ELSE '#39#39
      '         END'
      '         AS CODIGO,'
      '       S.VALORINDICEREFER,'
      '       S.VALORINDICEACUMREFER,'
      '       S.VALORBASECALC,'
      '       CASE'
      '         WHEN S.IDPARC = 20 THEN '#39'T'#39' '
      '         WHEN S.IDPARC = 10 THEN '#39'D'#39' '
      '         ELSE '#39#39' '
      '         END'
      '         AS TIPO,'
      '       CASE '
      '         WHEN S.IDPARC = 10 THEN S.MESREFER'
      '       END   '
      '       AS MESDETALHE'
      '  FROM SALPARTSRB S'
      '   WHERE S.IDPESSOA = :IDPESSOA  '
      '        AND S.IDPESSJUR = :IDPESSJUR  '
      '        AND S.IDPLANOPREV = :IDPLANOPREV  '
      '        AND S.TIPOCALC IN(1, 3)'
      '        AND S.TIPOBENEF = 2'
      '        AND S.SEQPARC = 1 '
      'UNION'
      'SELECT  '#39'M'#39' AS FILTRO,'
      '        MESREFER,      '
      '        '#39#39' AS MESREFERPARC,'
      '        0 AS IDPROCESSO, '
      '        0 AS TIPOCALC, '
      '        0 AS IDPARC, '
      '        0 AS TIPOBENEF,'
      '        0 AS VALORPARCCOMPORCALC,'
      '        '#39#39' AS DESCRSITCALC,'
      '        '#39#39' AS CODIGO,'
      '        0 AS VALORINDICEREFER, '
      '        0 AS VALORINDICEACUMREFER,'
      '        0 AS VALORBASECALC,'
      '        '#39'E'#39' AS TIPO,'
      '        '#39#39' AS MESDETALHE  '
      '    FROM SALPARTSRB'
      '      WHERE IDPESSOA = :IDPESSOA  '
      '        AND IDPESSJUR = :IDPESSJUR  '
      '        AND IDPLANOPREV = :IDPLANOPREV  '
      '        AND TIPOCALC IN(1, 3)'
      '        AND TIPOBENEF = 2'
      '        AND SEQPARC = 1 '
      'UNION'
      'SELECT  '#39'M'#39' AS FILTRO,'
      '        '#39#39' AS MESREFER,     '
      '        '#39#39' AS MESREFERPARC,'
      '        0 AS IDPROCESSO, '
      '        0 AS TIPOCALC, '
      '        0 AS IDPARC, '
      '        0 AS TIPOBENEF,'
      '        0 AS VALORPARCCOMPORCALC,'
      '        '#39#39' AS DESCRSITCALC,'
      '        '#39#39' AS CODIGO,'
      '        0 AS VALORINDICEREFER,'
      '        0 AS VALORINDICEACUMREFER,'
      '        0 AS VALORBASECALC,'
      '        '#39'A'#39' AS TIPO,'
      '        '#39#39' AS MESDETALHE  '
      '    FROM DUAL '
      ')'
      '   WHERE FILTRO = '#39'M'#39
      'ORDER BY MESREFER DESC, TIPO DESC, MESREFERPARC DESC '
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 152
    Top = 46
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryHistSRBGrid02: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'SELECT '#39'                                                        ' +
        '                                 '#39' AS SRB, '
      '               '#39'                     '#39' AS MESREFER,'
      '               '#39' '#39' AS TIPO'
      'FROM DUAL')
    UpdateObject = updHistSRBGrid02
    ValidateWithMask = True
    Left = 224
    Top = 130
  end
  object updHistSRBGrid02: TUpdateSQL
    Left = 248
    Top = 224
  end
  object updHistSRBGrid01: TUpdateSQL
    Left = 304
    Top = 70
  end
  object dsHistSRBGrid01: TDataSource
    DataSet = qryHistSRBGrid01
    Left = 48
    Top = 134
  end
  object dsPortabEntrada: TwwDataSource
    DataSet = qryPortabEntrada
    Left = 312
    Top = 576
  end
  object qryPortabEntrada: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DECODE(PP.IDENTIDADEORIGEM, NULL, PP.NOME, E.NOME) NOME,'
      
        '       CAST(regexp_replace(REGEXP_REPLACE(DECODE(PP.IDENTIDADEOR' +
        'IGEM,'
      '                                            NULL,'
      '                                            PP.CNPJ,'
      '                                            E.CNPJ),'
      '                                     '#39'\D'#39'),'
      
        '                      '#39'([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})(' +
        '[0-9]{2})'#39','
      '                      '#39'\1.\2.\3/\4-\5'#39')  AS VARCHAR2(20)) CNPJ,'
      
        '       DECODE(PP.IDENTIDADEORIGEM, NULL, PP.CNPBSUSEP, E.CNPBSUS' +
        'EP) CNPBSUSEP,'
      '       DECODE(PP.IDENTIDADEORIGEM, NULL, PP.TIPO, E.TIPO) TIPO,'
      '       (SELECT MAX(H.DATARECEBIMENTO )'
      '          FROM HSTCONTRIBPREV H'
      
        '         WHERE PP.IDPORTABILIDADE = H.IDPORTABILIDADE) DATARECEB' +
        'IMENTO ,'
      '       (SELECT SUM(H.VALORRECEBIDO)'
      '          FROM HSTCONTRIBPREV H'
      
        '         WHERE PP.IDPORTABILIDADE = H.IDPORTABILIDADE) VALORPORT' +
        'ADO,'
      '       PPV.NOME NOMEPLANO,'
      '       PP.TEMPOMESES TEMPOMESES,'
      '       PP.OPCAOIR OPCAOIR,'
      '       PP.DATAOPCAOIR DATAOPCAOIR '
      '  FROM PORTABILIDADEPREV PP'
      '  LEFT JOIN ENTIDADEORIGEM E'
      '    ON PP.IDENTIDADEORIGEM = E.IDENTIDADEORIGEM'
      '  JOIN PLANPREV PPV'
      '    ON PP.IDPLANOPREV = PPV.IDPLANOPREV'
      '    WHERE PP.IDPESSOA = :IDPESSOA'
      '    AND PP.IDPLANOPREV = :IDPLANOPREV'
      '    AND PP.IDPESSJUR   = :IDPESSJUR')
    ValidateWithMask = True
    Left = 368
    Top = 576
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end>
    object qryPortabEntradaNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object qryPortabEntradaCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object qryPortabEntradaCNPBSUSEP: TStringField
      FieldName = 'CNPBSUSEP'
    end
    object qryPortabEntradaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object qryPortabEntradaVALORPORTADO: TFloatField
      FieldName = 'VALORPORTADO'
    end
    object qryPortabEntradaNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      Size = 50
    end
    object qryPortabEntradaTEMPOMESES: TFloatField
      FieldName = 'TEMPOMESES'
    end
    object qryPortabEntradaOPCAOIR: TStringField
      FieldName = 'OPCAOIR'
      Size = 11
    end
    object qryPortabEntradaDATAOPCAOIR: TDateTimeField
      FieldName = 'DATAOPCAOIR'
    end
    object qryPortabEntradaDATARECEBIMENTO: TDateTimeField
      FieldName = 'DATARECEBIMENTO'
    end
  end
  object dsPortabSaida: TwwDataSource
    DataSet = qryPortabSaida
    Left = 424
    Top = 576
  end
  object qryPortabSaida: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME NOME,'
      '       CAST(regexp_replace(REGEXP_REPLACE(P.NUMDOCUMENTO, '#39'\D'#39'),'
      
        '                           '#39'([0-9]{2})([0-9]{3})([0-9]{3})([0-9]' +
        '{4})([0-9]{2})'#39','
      
        '                           '#39'\1.\2.\3/\4-\5'#39') AS VARCHAR2(20)) CN' +
        'PJ,'
      '       BF.CAMPOTEXTO1 CNPBSUSEP,'
      '       B.NOME BENEFÍCIO,'
      '       E.DATAEVENTO DATASOLICITACAO,'
      '       E.DATAREGISTRO DATAREGISTRO,'
      '       H.DATAPAGAMENTO DATAPAGAMENTO,'
      '       SUM(H.VALORPROVENTO) VALORPORTADO,'
      '       TAB_AUX.VLRCOTAS VLRCOTAS'
      '  FROM BENEFBFCIARIO BF'
      '  JOIN BFCIARIOTITPLAN BTT'
      '    ON BF.IDPESSJUR = BTT.IDPESSJUR'
      '   AND BF.IDTITULAR = BTT.IDTITULAR'
      '   AND BF.IDPLANOORIGEM = BTT.IDPLANOORIGEM'
      '   AND BF.IDPESSOA = BTT.IDPESSOA'
      '   AND BF.SEQPROPOSTA = BTT.SEQPROPOSTA'
      '   AND BF.IDPLANOPREV = BTT.IDPLANOPREV'
      '   AND BF.IDBENEFICIO = BTT.IDBENEFICIO'
      '  JOIN PESSOA P'
      '    ON P.IDPESSOA = BTT.IDRESPONNAOREC'
      '  JOIN BENEFICIO B'
      '    ON B.IDBENEFICIO = BF.IDBENEFICIO'
      '  LEFT JOIN EVENTOSPREV E'
      '    ON E.IDPESSJUR = BF.IDPESSJUR'
      '   AND E.IDPLANOPREV = BF.IDPLANOPREV'
      '   AND E.IDPESSOA = BF.IDPESSOA'
      '   AND E.SEQPROPOSTA = BF.SEQPROPOSTA'
      '  JOIN HISTRUBSAL H'
      '    ON H.IDPATRO = BF.IDPESSJUR'
      '   AND H.IDPESSOA = BF.IDPESSOA'
      '   AND H.IDPLANOPREV = BF.IDPLANOPREV'
      
        '   JOIN (SELECT HR.IDPESSOA, HR.IDPLANOPREV, HR.IDPESSJUR, SUM(D' +
        'ECODE(HR.FLGENTRADA, 0, HR.VLRREAL, -HR.VLRREAL)) AS VLRCOTAS'
      '          FROM HISTMOVRESERVA HR'
      '         WHERE HR.IDPLANOPREV = :IDPLANOPREV'
      '           AND HR.IDPESSJUR = :IDPESSJUR'
      '           AND HR.IDPESSOA = :IDPESSOA'
      '           AND HR.IDBENEFICIO IN (493, 516, 871, 872)'
      '           AND HR.IDEVENTOGERADOR  IN (334, 369)'
      '           AND ((:IDPLANOPREV <> 2) AND'
      
        '           (HR.IDTIPORESERVA IN (50, 51, 52, 53, 55, 58, 59, 60,' +
        ' 61, 62, 79, 117, 134, 167, 170, 178, 100, 101, 110, 111, 208, 2' +
        '09, 217, 218))'
      '           OR (:IDPLANOPREV = 2))'
      
        '           GROUP BY HR.IDPESSOA, HR.IDPLANOPREV, HR.IDPESSJUR) T' +
        'AB_AUX'
      '    ON  TAB_AUX.IDPLANOPREV = BF.IDPLANOPREV'
      '     AND   TAB_AUX.IDPESSJUR = BF.IDPESSJUR'
      '     AND   TAB_AUX.IDPESSOA = BF.IDPESSOA  '
      '           '
      ' WHERE BF.IDBENEFICIO IN (493, 516, 871, 872)'
      '   AND E.IDEVENTOGERADOR IN (334, 369)'
      '   AND H.IDRUBRICA IN (38970, 38987)'
      '   AND BF.IDPESSJUR = :IDPESSJUR'
      '   AND BF.IDPLANOPREV = :IDPLANOPREV'
      '   AND BF.IDPESSOA = :IDPESSOA'
      ' GROUP BY P.NOME,'
      '          P.NUMDOCUMENTO,'
      '          BF.CAMPOTEXTO1,'
      '          B.NOME,'
      '          E.DATAEVENTO,'
      '          E.DATAREGISTRO,'
      '          H.DATAPAGAMENTO,'
      '          TAB_AUX.VLRCOTAS'
      ' ')
    ValidateWithMask = True
    Left = 480
    Top = 584
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryPortabSaidaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryPortabSaidaCNPBSUSEP: TStringField
      FieldName = 'CNPBSUSEP'
      Size = 200
    end
    object qryPortabSaidaBENEFCIO: TStringField
      FieldName = 'BENEFÍCIO'
      Size = 60
    end
    object qryPortabSaidaDATASOLICITACAO: TDateTimeField
      FieldName = 'DATASOLICITACAO'
    end
    object qryPortabSaidaDATAREGISTRO: TDateTimeField
      FieldName = 'DATAREGISTRO'
    end
    object qryPortabSaidaDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
    end
    object qryPortabSaidaVALORPORTADO: TFloatField
      FieldName = 'VALORPORTADO'
    end
    object qryPortabSaidaVLRCOTAS: TFloatField
      FieldName = 'VLRCOTAS'
    end
    object qryPortabSaidaCNPJ: TStringField
      FieldName = 'CNPJ'
      FixedChar = True
      Size = 18
    end
  end
end
