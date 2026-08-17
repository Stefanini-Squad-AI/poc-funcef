inherited frmIndicadorRecebedor: TfrmIndicadorRecebedor
  Left = 284
  Top = 183
  HelpContext = 160101
  Caption = 'Indicação de Recebedor'
  ClientHeight = 467
  ClientWidth = 911
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 911
    Height = 381
    inherited pnlMestre: TPanel
      Width = 909
      Height = 63
      object lblParticipante: TLabel
        Left = 8
        Top = 9
        Width = 69
        Height = 13
        Caption = 'Participante'
      end
      object dbTNome: TDBText
        Left = 95
        Top = 9
        Width = 47
        Height = 13
        AutoSize = True
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblPatro: TLabel
        Left = 8
        Top = 41
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object dbTPatro: TDBText
        Left = 96
        Top = 41
        Width = 44
        Height = 13
        AutoSize = True
        DataField = 'NOMEPATRO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblPlanoPrev: TLabel
        Left = 490
        Top = 9
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object dbTPlano: TDBText
        Left = 618
        Top = 9
        Width = 46
        Height = 13
        AutoSize = True
        DataField = 'NOMEPLANO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblMatricula: TLabel
        Left = 292
        Top = 41
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object dbTMatricula: TDBText
        Left = 356
        Top = 41
        Width = 62
        Height = 13
        AutoSize = True
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblInscricao: TLabel
        Left = 490
        Top = 41
        Width = 71
        Height = 13
        Caption = 'Inscrição Nº'
      end
      object dbTInscricao: TDBText
        Left = 570
        Top = 41
        Width = 62
        Height = 13
        AutoSize = True
        DataField = 'INSCRICAONUMERO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 290
        Top = 9
        Width = 24
        Height = 13
        Caption = 'CPF'
      end
      object DBText1: TDBText
        Left = 322
        Top = 9
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'NUMDOCUMENTOFORMATADO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 64
      Width = 909
      Height = 316
      Tabs.Strings = (
        'Benefícios')
      inherited pgctrlDetalhe: TPageControl
        Width = 811
        Height = 257
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 803
            Height = 229
            Selected.Strings = (
              'BENEFICIO'#9'40'#9'Benefício'
              'CPFRECEBEDORFORMATADO'#9'14'#9'CPF'
              'RESPONSAVEL'#9'40'#9'Recebedor'
              'DATAFIMRECEB'#9'12'#9'Data Limite')
          end
          inherited pnlControlesDet: TPanel
            Width = 803
            Height = 229
            object grpbxResp: TGroupBox
              Left = 4
              Top = 4
              Width = 586
              Height = 101
              Caption = ' Recebedor '
              TabOrder = 0
              object Label9: TLabel
                Left = 176
                Top = 36
                Width = 117
                Height = 13
                Caption = 'Nome do Recebedor'
              end
              object Label2: TLabel
                Left = 16
                Top = 36
                Width = 90
                Height = 13
                Caption = 'CPF Recebedor'
              end
              object dbeRecebedor: TDBEdit
                Left = 176
                Top = 50
                Width = 403
                Height = 21
                TabStop = False
                Color = clBtnFace
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
              object rdbProprio: TRadioButton
                Left = 10
                Top = 16
                Width = 102
                Height = 17
                Caption = 'É o próprio'
                TabOrder = 0
                OnClick = rdbProprioClick
              end
              object rdbOutro: TRadioButton
                Left = 132
                Top = 16
                Width = 125
                Height = 17
                Caption = 'É o responsável'
                TabOrder = 1
                OnClick = rdbProprioClick
              end
              object dbeCpfRecebedor: TDBEdit
                Left = 15
                Top = 50
                Width = 138
                Height = 21
                TabStop = False
                Color = clBtnFace
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 901
        object edPaiDetalhe: TEdit
          Left = 85
          Top = 4
          Width = 508
          Height = 21
          BorderStyle = bsNone
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      inherited Dock974: TDock97
        Left = 815
        Height = 257
      end
    end
  end
  inherited Dock972: TDock97
    Width = 911
  end
  inherited Dock971: TDock97
    Top = 428
    Width = 911
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 264
    Top = 10
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 673
    Top = 268
  end
  inherited ds: TwwDataSource
    Left = 754
    Top = 290
  end
  inherited upd: TUpdateSQL
    Left = 754
    Top = 194
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'EL.MATRICULA'
      'P.NUMDOCUMENTO'
      'P.NOME'
      'PD.NOME'
      'PP.INSCRICAONUMERO'
      'PL.NOME'
      'PT.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      '')
    Descricao.Strings = (
      'Matrícula'
      'CPF'
      'Titular'
      'Dependente'
      'Inscrição Nº'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
      'S'
      'S'
      'S'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'PESSOA PT'
      'PESSOA PD'
      'ELEGPATRO EL'
      'PLANPREV PL'
      'PARTPREVPLAN PP'
      'DEPENTIT DT'
      'PLANPREVPATRO PPP')
    CamposChave.Strings = (
      'PP.IDPESSOA'
      'PP.IDPESSJUR'
      'PP.IDPLANOPREV'
      'PP.SEQPROPOSTA'
      'DT.IDPESSOA')
    Filtro.Strings = (
      'EL.IDPESSOA = PP.IDPESSOA    '
      'EL.IDPESSJUR = PP.IDPESSJUR'
      'PP.SEQPROPOSTA = 1'
      'PP.IDPESSJUR = PPP.IDPESSJUR'
      'PP.IDPLANOPREV = PPP.IDPLANOPREV'
      'PPP.IDPLANOPREV = PL.IDPLANOPREV'
      'EL.IDPESSOA = P.IDPESSOA'
      'EL.IDPESSJUR = PT.IDPESSOA'
      'EL.IDPESSOA = DT.IDTITULAR(+)'
      'DT.IDPESSOA = PD.IDPESSOA'
      'PP.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '11'
      '60'
      '60'
      '15'
      '60'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 427
    Top = 10
  end
  inherited ImlPadrao: TImageList
    Left = 297
    Top = 10
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 364
    Top = 10
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT P.NOME,P.NUMDOCUMENTO,'
      
        '  SUBSTR(P.NUMDOCUMENTO,1,3)||'#39'.'#39'||SUBSTR(P.NUMDOCUMENTO,4,3)||'#39 +
        '.'#39'||  SUBSTR(P.NUMDOCUMENTO,7,3)||'#39'-'#39'||  SUBSTR(P.NUMDOCUMENTO,1' +
        '0,2) AS NUMDOCUMENTOFORMATADO,'
      '              PT.NOME AS NOMEPATRO, '
      '              PL.NOME AS NOMEPLANO,'
      '              EL.MATRICULA,       '
      '              PP.INSCRICAONUMERO,   '
      '              PP.IDPESSJUR,         '
      '              PP.IDPLANOPREV,'
      '              PP.IDPESSOA,        '
      '              PP.SEQPROPOSTA,       '
      '              SP.FLGINTERNO,      '
      '              PP.INSCRICAODATA,    '
      '              PP.IDSITPART,         '
      '              PF.DATANASC,'
      
        '              DECODE(SP.FLGINTERNO, '#39'MA'#39', PP.SALMANTIDO, PP.SALP' +
        'ARTICIPACAO) AS SALARIO'
      'FROM    PESSOA P, '
      '              PESSOA PT, '
      '              PESSOAFISICA PF, '
      '              PLANPREV PL, '
      '              PARTPREVPLAN PP,'
      '              ELEGPATRO EL,'
      '              SITPART SP'
      'WHERE     (PP.IDPESSJUR     = :IDPESSJUR)'
      'AND       (PP.IDPLANOPREV   = :IDPLANOPREV)'
      'AND       (PP.IDPESSOA      = :IDPESSOA)'
      'AND       (PP.SEQPROPOSTA   = :SEQPROPOSTA)'
      'AND       (PP.IDPLANOPREV   = PL.IDPLANOPREV)'
      'AND       (PP.IDPESSOA      = P.IDPESSOA)'
      'AND       (PP.IDPESSJUR     = PT.IDPESSOA)'
      'AND       (PP.IDPESSJUR     = EL.IDPESSJUR)'
      'AND       (PP.IDPESSOA      = EL.IDPESSOA)'
      'AND       (PP.IDSITPART     = SP.IDSITPART)'
      'AND       (EL.IDPESSOA      = PF.IDPESSOA)'
      ''
      ' '
      ' '
      ' ')
    Left = 753
    Top = 242
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 556
    Top = 12
  end
  object qryDet: TwwQuery
    Tag = 5
    CachedUpdates = True
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ''
      ''
      '  BTP.IDRESPONSAVEL,'
      '  PREC.NOME  AS NOMERECEBEDOR,'
      '  PREC.NUMDOCUMENTO AS CPFRECEBEDOR,'
      
        '  SUBSTR(PREC.NUMDOCUMENTO,1,3)||'#39'.'#39'||SUBSTR(PREC.NUMDOCUMENTO,4' +
        ',3)||'#39'.'#39'||  SUBSTR(PREC.NUMDOCUMENTO,7,3)||'#39'-'#39'||  SUBSTR(PREC.NU' +
        'MDOCUMENTO,10,2) AS CPFRECEBEDORFORMATADO,'
      '  BTP.IDRESPONNAOREC,'
      '  PRESP.NOME AS NOMERESPONSAVEL,'
      '  PRESP.NUMDOCUMENTO AS CPFRESPONSAVEL,'
      
        '  SUBSTR(PRESP.NUMDOCUMENTO,1,3)||'#39'.'#39'||SUBSTR(PRESP.NUMDOCUMENTO' +
        ',4,3)||'#39'.'#39'||  SUBSTR(PRESP.NUMDOCUMENTO,7,3)||'#39'-'#39'|| SUBSTR(PRESP' +
        '.NUMDOCUMENTO,10,2) AS CPFRESPONSAVELFORMATADO,'
      '  PTIT.NOME AS NOMETITULAR,'
      '  PTIT.NUMDOCUMENTO AS CPFTITULAR,'
      
        '  SUBSTR(PTIT.NUMDOCUMENTO,1,3)||'#39'.'#39'||SUBSTR(PTIT.NUMDOCUMENTO,4' +
        ',3)||'#39'.'#39'||  SUBSTR(PTIT.NUMDOCUMENTO,7,3)||'#39'-'#39'||  SUBSTR(PTIT.NU' +
        'MDOCUMENTO,10,2) AS CPFTITULARFORMATADO,'
      '  PDEP.NOME AS NOMEDEPENDENTE,'
      '  PDEP.IDPESSOA AS IDDEPENDENTE,'
      ''
      '  D.IDTITULAR, D.IDPESSOA,'
      ''
      '  BTP.IDPESSJUR,        BTP.IDPLANOPREV,'
      '  BTP.IDBENEFICIO,      BTP.SEQPROPOSTA,      BTP.IDDEPENRESPON,'
      '  BTP.IDNUCLEOFAMILIAR, BTP.PRIORIDADE,     BTP.PERCENTUAL,'
      '  BTP.CODTIPORECEBEDOR, BTP.DATAFIMRECEB,'
      ''
      '  B.NOME AS BENEFICIO,'
      '  PREC.NOME AS RESPONSAVEL,'
      '  TP.DESCRICAO AS TIPORESPONSAVEL,'
      '  BP.IDREGRABENEFICIA'
      'FROM'
      '  PESSOA PREC,'
      '  PESSOA PRESP,'
      '  PESSOA PTIT,'
      '  PESSOA PDEP,'
      '  BENEFPLANPREV BP,'
      '  BFCIARIOTITPLAN BTP,'
      '  PARTPREVPLAN PPP,'
      '  BENEFICIO B,'
      '  DEPENTIT D,'
      '  TIPORECEBEDOR TP'
      'WHERE   BTP.IDTITULAR     = :IDTITULAR'
      'AND     PTIT.IDPESSOA     = BTP.IDTITULAR'
      'AND     BTP.SEQPROPOSTA   = 1'
      'AND     BTP.IDPESSJUR     = PPP.IDPESSJUR'
      'AND     BTP.IDPLANOORIGEM   = PPP.IDPLANOPREV'
      'AND     BTP.IDTITULAR     = PPP.IDPESSOA'
      'AND     BTP.SEQPROPOSTA   = PPP.SEQPROPOSTA'
      'AND     BTP.IDPESSOA      = D.IDPESSOA'
      'AND     BTP.IDPESSOA      = PDEP.IDPESSOA'
      'AND     BTP.IDTITULAR     = D.IDTITULAR'
      'AND     BTP.IDBENEFICIO   = B.IDBENEFICIO'
      'AND     BTP.CODTIPORECEBEDOR = TP.CODTIPORECEBEDOR(+)'
      'AND     BTP.IDRESPONSAVEL = PREC.IDPESSOA(+)'
      'AND     BTP.IDRESPONNAOREC = PRESP.IDPESSOA(+)'
      'AND     BTP.IDPLANOPREV   = BP.IDPLANOPREV'
      'AND     BTP.IDBENEFICIO   = BP.IDBENEFICIO'
      '')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 673
    Top = 341
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update BFCIARIOTITPLAN'
      'set'
      '  IDRESPONSAVEL = :IDRESPONSAVEL,'
      '  DATAFIMRECEB  = :DATAFIMRECEB,'
      '  CODTIPORECEBEDOR = :CODTIPORECEBEDOR,'
      '  IDRESPONNAOREC = :IDRESPONNAOREC'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA'
      ''
      '')
    InsertSQL.Strings = (
      'insert into BFCIARIOTITPLAN'
      
        '  (IDRESPONSAVEL, DATAFIMRECEB, CODTIPORECEBEDOR, IDRESPONNAOREC' +
        ')'
      'values'
      
        '  (:IDRESPONSAVEL, :DATAFIMRECEB, :CODTIPORECEBEDOR, :IDRESPONNA' +
        'OREC)'
      ' '
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from BFCIARIOTITPLAN'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 672
    Top = 300
  end
  object MSResp: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'CPF')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'RESPONSAVEL')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'RESPONSAVEL.IDRESPONSAVEL'
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      
        'SUBSTR(PESSOA.NUMDOCUMENTO,1,3)||'#39'.'#39'||SUBSTR(PESSOA.NUMDOCUMENTO' +
        ',4,3)||'#39'.'#39'||  SUBSTR(PESSOA.NUMDOCUMENTO,7,3)||'#39'-'#39'||  SUBSTR(PES' +
        'SOA.NUMDOCUMENTO,9,2) AS NUMDOCUMENTOFORMATADO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = RESPONSAVEL.IDRESPONSAVEL'
      'RESPONSAVEL.FLGADMPREV = 1')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '10')
    OperComparador.Strings = (
      '0'
      '0')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 496
    Top = 10
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 753
    Top = 355
  end
  object dsDep: TwwDataSource
    AutoEdit = False
    DataSet = qryDep
    Left = 676
    Top = 148
  end
  object qryDep: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME,'
      '       P.IDPESSOA,'
      '       P.NUMDOCUMENTO,'
      '       D.IDTITULAR,'
      '       DP.DESCRICAO AS TIPODEPENDENCIA,'
      '       D.NUMSEQUENCIA,'
      '       D.FLGCONTAIMPOSTOR,'
      '       D.FLGCONTASALARIOF,'
      '       DECODE(BF.IDSITBENEFICIO, NULL, 0,'
      '                                    3, 0,'
      '                                    5, 0,'
      '                                    6, 0,'
      '                                    7, 0,'
      '                                    8, 0,'
      '                                    1, 1,'
      '                                    2, 1,'
      '                                    4, 1 ) AS FLGBENEFICIARIO,'
      '       DECODE(PF.ESTCIVIL, '#39'S'#39', '#39'Solteiro'#39','
      '                           '#39'C'#39', '#39'Casado'#39','
      '                           '#39'D'#39', '#39'Divorciado(a)'#39','
      '                           '#39'E'#39', '#39'Desquitado(a)'#39','
      '                           '#39'J'#39', '#39'Separado(a) Judicial'#39','
      '                           '#39'V'#39', '#39'Viúvo(a)'#39','
      '                           '#39'O'#39', '#39'Outros'#39')  AS DESCESTCIVIL,'
      '       D.FLGDESIGNADO,'
      '       D.FLGDEPLEGAL,'
      '       D.IDDEPENDENCIA,'
      '       D.MATRICULA,'
      '       PF.DATANASC,'
      '       PF.DATAMORTE,'
      '       PF.NOMEPAI,'
      '       PF.NOMEMAE,'
      '       PF.SEXO,'
      '       PF.FLGMOLESTIAGRAVE,'
      '       PF.DATAMOLESTIAGRAVE ,'
      '       PF.FLGISENTOIRRF,'
      '       SIT.DESCRICAO AS SITUACAODEPEN,'
      '       0 AS FLGELEGIVEL  '
      
        'FROM   PESSOA P, PESSOAFISICA PF, SITDEPENDENTE SIT, DEPEN DP, D' +
        'EPENDENTE DEP, DEPENTIT D, BENEFBFCIARIO BF'
      'WHERE  D.IDTITULAR     = :IDTITULAR'
      'AND    D.IDDEPENDENCIA <> '#39'PRP'#39
      'AND    D.IDPESSOA      = P.IDPESSOA'
      'AND    D.IDDEPENDENCIA = DP.IDDEPENDENCIA'
      'AND    BF.IDTITULAR(+) = D.IDTITULAR'
      'AND    BF.IDPESSOA(+)  = D.IDPESSOA'
      'AND    PF.IDPESSOA     = D.IDPESSOA'
      'AND    DEP.IDPESSOA    = D.IDPESSOA'
      'AND    DEP.IDSITDEPENDENTE = SIT.IDSITDEPENDENTE(+)'
      'ORDER BY D.NUMSEQUENCIA'
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updDep
    ControlType.Strings = (
      'FLGCONTAIMPOSTOR;CheckBox;1;0'
      'FLGCONTASALARIOF;CheckBox;1;0'
      'FLGBENEFICIARIO;CheckBox;1;0'
      'FLGDESIGNADO;CheckBox;1;0'
      'FLGDEPLEGAL;CheckBox;1;0'
      'FLGISENTOIRRF;CheckBox;1;0'
      'FLGMOLESTIAGRAVE;CheckBox;1;0'
      'FLGELEGIVEL;CheckBox;1;0')
    ValidateWithMask = True
    Left = 675
    Top = 204
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object qryRecebedor: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDRESPONSAVEL, FLGADMPREV, FLGIMOBILIARIO, FLGATIVOFIXO'
      'FROM   RESPONSAVEL'
      'WHERE  IDRESPONSAVEL = :IDRESPONSAVEL')
    UpdateObject = updRecebedor
    ValidateWithMask = True
    Left = 731
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object updRecebedor: TUpdateSQL
    ModifySQL.Strings = (
      'update RESPONSAVEL'
      'set'
      '  FLGADMPREV = :FLGADMPREV,'
      '  FLGIMOBILIARIO = :FLGIMOBILIARIO,'
      '  FLGATIVOFIXO = :FLGATIVOFIXO'
      'where'
      '  IDRESPONSAVEL = :OLD_IDRESPONSAVEL')
    InsertSQL.Strings = (
      'insert into RESPONSAVEL'
      '  (IDRESPONSAVEL, FLGADMPREV, FLGIMOBILIARIO, FLGATIVOFIXO)'
      'values'
      '  (:IDRESPONSAVEL, :FLGADMPREV, :FLGIMOBILIARIO, :FLGATIVOFIXO)')
    DeleteSQL.Strings = (
      'delete from RESPONSAVEL'
      'where'
      '  IDRESPONSAVEL = :OLD_IDRESPONSAVEL')
    Left = 731
    Top = 80
  end
  object dsRecebedor: TwwDataSource
    AutoEdit = False
    DataSet = qryRecebedor
    Left = 732
    Top = 48
  end
  object qryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  B.IDBENEFICIO,'
      '  B.NOME'
      ''
      'FROM'
      '  BENEFICIO B,'
      '  BENEFPLANPREV BPP'
      '  '
      'WHERE'
      '  BPP.IDPLANOPREV = :IDPLANOPREV   AND'
      '  BPP.IDBENEFICIO = B.IDBENEFICIO  AND'
      '  B.FLGDESTBENEF <> '#39'P'#39
      ''
      'ORDER BY '
      '   B.NOME'
      '')
    ValidateWithMask = True
    Left = 600
    Top = 354
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object updDep: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  IDGRUPO = :IDGRUPO,'
      '  IDIMAGEM = :IDIMAGEM,'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  NOME = :NOME,'
      '  TIPO = :TIPO,'
      '  RAZAOSOCIAL = :RAZAOSOCIAL,'
      '  FLGUSUARIO = :FLGUSUARIO,'
      '  FLGCONTATO = :FLGCONTATO,'
      '  FLGCOTISTA = :FLGCOTISTA,'
      '  FLGCLIENTE = :FLGCLIENTE,'
      '  FLGPATROCINADORA = :FLGPATROCINADORA,'
      '  FLGADMINFUNDO = :FLGADMINFUNDO,'
      '  FLGADMINISTRADORA = :FLGADMINISTRADORA,'
      '  FLGEMPEMITETIT = :FLGEMPEMITETIT,'
      '  FLGBANCO = :FLGBANCO,'
      '  FLGBOLSA = :FLGBOLSA,'
      '  FLGAUTARQUIA = :FLGAUTARQUIA,'
      '  FLGSINDICATO = :FLGSINDICATO,'
      '  FLGOUTRO = :FLGOUTRO,'
      '  FLGRESPONSAVEL = :FLGRESPONSAVEL,'
      '  FLGTERCEIRO = :FLGTERCEIRO,'
      '  FLGFORNSERV = :FLGFORNSERV,'
      '  FLGFUNCIONARIO = :FLGFUNCIONARIO,'
      '  FLGINVALIDO = :FLGINVALIDO,'
      '  FLGCANDIDATO = :FLGCANDIDATO,'
      '  FLGESTRANGEIRO = :FLGESTRANGEIRO,'
      '  FLGGESTORFUNDO = :FLGGESTORFUNDO,'
      '  FLGAVALISTA = :FLGAVALISTA,'
      '  FLGPAGADOR = :FLGPAGADOR,'
      '  FLGPRODUTOR = :FLGPRODUTOR,'
      '  FLGAVERBADORA = :FLGAVERBADORA,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  EMAIL = :EMAIL,'
      '  FLGAGENCIA = :FLGAGENCIA,'
      '  FLGFUNDACAO = :FLGFUNDACAO,'
      '  FLGDEPENDENTE = :FLGDEPENDENTE,'
      '  FLGELEGIVEL = :FLGELEGIVEL,'
      '  FLGHOTEL = :FLGHOTEL,'
      '  FLGVENDEDOR = :FLGVENDEDOR,'
      '  FLGAGENCIAVIAGEM = :FLGAGENCIAVIAGEM,'
      '  FLGFILIALPESSOA = :FLGFILIALPESSOA,'
      '  FLGPROPRIETARIOUH = :FLGPROPRIETARIOUH,'
      '  FLGREPRESENTANTE = :FLGREPRESENTANTE,'
      '  SEQTRANSMISSAO = :SEQTRANSMISSAO,'
      '  FLGHOSPEDE = :FLGHOSPEDE,'
      '  FLGEMISSOR = :FLGEMISSOR,'
      '  FLGINSTFIN = :FLGINSTFIN,'
      '  FLGBOLSAVALORES = :FLGBOLSAVALORES,'
      '  FLGCORRETORAVALOR = :FLGCORRETORAVALOR,'
      '  FLGGESTORCARTEIRA = :FLGGESTORCARTEIRA,'
      '  FLGCUSTODIANTE = :FLGCUSTODIANTE,'
      '  FLGBENEFPROCUH = :FLGBENEFPROCUH,'
      '  FLGCANALREP = :FLGCANALREP,'
      '  FLGLOCATARIO = :FLGLOCATARIO,'
      '  FLGADMINIMOVEL = :FLGADMINIMOVEL,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  FLGCONCIERGE = :FLGCONCIERGE,'
      '  FLGOPERADORMANUT = :FLGOPERADORMANUT,'
      '  IDENDCORRESP = :IDENDCORRESP,'
      '  IDENDCOMERCIAL = :IDENDCOMERCIAL,'
      '  IDENDENTREGA = :IDENDENTREGA,'
      '  IDENDRESIDENCIAL = :IDENDRESIDENCIAL,'
      '  IDENDCOBRANCA = :IDENDCOBRANCA,'
      '  HOMEPAGE = :HOMEPAGE'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      
        '  (IDGRUPO, IDIMAGEM, IDDOCUMENTO, NOME, TIPO, RAZAOSOCIAL, FLGU' +
        'SUARIO, '
      
        '   FLGCONTATO, FLGCOTISTA, FLGCLIENTE, FLGPATROCINADORA, FLGADMI' +
        'NFUNDO, '
      
        '   FLGADMINISTRADORA, FLGEMPEMITETIT, FLGBANCO, FLGBOLSA, FLGAUT' +
        'ARQUIA, '
      
        '   FLGSINDICATO, FLGOUTRO, FLGRESPONSAVEL, FLGTERCEIRO, FLGFORNS' +
        'ERV, FLGFUNCIONARIO, '
      
        '   FLGINVALIDO, FLGCANDIDATO, FLGESTRANGEIRO, FLGGESTORFUNDO, FL' +
        'GAVALISTA, '
      
        '   FLGPAGADOR, FLGPRODUTOR, FLGAVERBADORA, NUMDOCUMENTO, EMAIL, ' +
        'FLGAGENCIA, '
      
        '   FLGFUNDACAO, FLGDEPENDENTE, FLGELEGIVEL, FLGHOTEL, FLGVENDEDO' +
        'R, FLGAGENCIAVIAGEM, '
      
        '   FLGFILIALPESSOA, FLGPROPRIETARIOUH, FLGREPRESENTANTE, SEQTRAN' +
        'SMISSAO, '
      
        '   FLGHOSPEDE, FLGEMISSOR, FLGINSTFIN, FLGBOLSAVALORES, FLGCORRE' +
        'TORAVALOR, '
      
        '   FLGGESTORCARTEIRA, FLGCUSTODIANTE, FLGBENEFPROCUH, FLGCANALRE' +
        'P, FLGLOCATARIO, '
      
        '   FLGADMINIMOVEL, TRGDTINCLUSAO, TRGUSERINCLUSAO, FLGCONCIERGE,' +
        ' FLGOPERADORMANUT, '
      
        '   IDENDCORRESP, IDENDCOMERCIAL, IDENDENTREGA, IDENDRESIDENCIAL,' +
        ' IDENDCOBRANCA, '
      '   HOMEPAGE)'
      'values'
      
        '  (:IDGRUPO, :IDIMAGEM, :IDDOCUMENTO, :NOME, :TIPO, :RAZAOSOCIAL' +
        ', :FLGUSUARIO, '
      
        '   :FLGCONTATO, :FLGCOTISTA, :FLGCLIENTE, :FLGPATROCINADORA, :FL' +
        'GADMINFUNDO, '
      
        '   :FLGADMINISTRADORA, :FLGEMPEMITETIT, :FLGBANCO, :FLGBOLSA, :F' +
        'LGAUTARQUIA, '
      
        '   :FLGSINDICATO, :FLGOUTRO, :FLGRESPONSAVEL, :FLGTERCEIRO, :FLG' +
        'FORNSERV, '
      
        '   :FLGFUNCIONARIO, :FLGINVALIDO, :FLGCANDIDATO, :FLGESTRANGEIRO' +
        ', :FLGGESTORFUNDO, '
      
        '   :FLGAVALISTA, :FLGPAGADOR, :FLGPRODUTOR, :FLGAVERBADORA, :NUM' +
        'DOCUMENTO, '
      
        '   :EMAIL, :FLGAGENCIA, :FLGFUNDACAO, :FLGDEPENDENTE, :FLGELEGIV' +
        'EL, :FLGHOTEL, '
      
        '   :FLGVENDEDOR, :FLGAGENCIAVIAGEM, :FLGFILIALPESSOA, :FLGPROPRI' +
        'ETARIOUH, '
      
        '   :FLGREPRESENTANTE, :SEQTRANSMISSAO, :FLGHOSPEDE, :FLGEMISSOR,' +
        ' :FLGINSTFIN, '
      
        '   :FLGBOLSAVALORES, :FLGCORRETORAVALOR, :FLGGESTORCARTEIRA, :FL' +
        'GCUSTODIANTE, '
      
        '   :FLGBENEFPROCUH, :FLGCANALREP, :FLGLOCATARIO, :FLGADMINIMOVEL' +
        ', :TRGDTINCLUSAO, '
      
        '   :TRGUSERINCLUSAO, :FLGCONCIERGE, :FLGOPERADORMANUT, :IDENDCOR' +
        'RESP, :IDENDCOMERCIAL, '
      '   :IDENDENTREGA, :IDENDRESIDENCIAL, :IDENDCOBRANCA, :HOMEPAGE)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 672
    Top = 177
  end
  object qryRepAtivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME AS NOMERESPONSAVEL, '
      
        '       SUBSTR(P.NUMDOCUMENTO,1,3)||'#39'.'#39'||SUBSTR(P.NUMDOCUMENTO,4,' +
        '3)||'#39'.'#39'||  SUBSTR(P.NUMDOCUMENTO,7,3)||'#39'-'#39'||  SUBSTR(P.NUMDOCUME' +
        'NTO,10,2) AS CPFFORMATADO,'
      '       H.* '
      '  FROM HSTREPRLEGAL H, PESSOA P'
      ' WHERE P.IDPESSOA = H.IDRECEBEDOR'
      '   AND H.IDPESSOA = :IDPESSOA'
      '   AND H.SITATUAL = 1')
    ValidateWithMask = True
    Left = 520
    Top = 354
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
