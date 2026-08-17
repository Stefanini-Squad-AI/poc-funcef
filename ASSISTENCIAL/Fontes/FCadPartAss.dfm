inherited FrmCadPartAss: TFrmCadPartAss
  Left = 57
  Top = 65
  BorderIcons = [biSystemMenu, biHelp]
  Caption = 'Cadastro de Participante Assistencial'
  ClientHeight = 508
  ClientWidth = 741
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 741
    Height = 422
    inherited pnlMestre: TPanel
      Width = 739
      Height = 128
      object Label4: TLabel
        Left = 0
        Top = 0
        Width = 45
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 88
        Top = 0
        Width = 43
        Height = 13
        Caption = 'Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 224
        Top = 0
        Width = 102
        Height = 13
        Caption = 'Nome do Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblFalecido: TLabel
        Left = 336
        Top = 0
        Width = 305
        Height = 12
        AutoSize = False
        Caption = 'lblFalecido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label9: TLabel
        Left = 648
        Top = 0
        Width = 64
        Height = 13
        Caption = 'Dependência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbtMatricula: TDBText
        Left = 0
        Top = 16
        Width = 71
        Height = 13
        AutoSize = True
        DataField = 'MATRICULA'
        DataSource = ds
      end
      object dbtInscricao: TDBText
        Left = 88
        Top = 16
        Width = 71
        Height = 13
        AutoSize = True
        DataField = 'INSCRICAONUMERO'
        DataSource = ds
      end
      object dbtNomeParticip: TDBText
        Left = 224
        Top = 16
        Width = 94
        Height = 13
        AutoSize = True
        DataField = 'NOMERESPONSAVEL'
        DataSource = ds
      end
      object dbtDepend: TDBText
        Left = 648
        Top = 16
        Width = 63
        Height = 13
        AutoSize = True
        DataField = 'DEPENDENCIA'
        DataSource = ds
      end
      object Label2: TLabel
        Left = 0
        Top = 32
        Width = 66
        Height = 13
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 208
        Top = 32
        Width = 42
        Height = 13
        Caption = 'Situação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 400
        Top = 32
        Width = 97
        Height = 13
        Caption = 'Plano Previdênciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 600
        Top = 32
        Width = 51
        Height = 13
        Caption = 'Inscrito em'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbtPatro: TDBText
        Left = 0
        Top = 48
        Width = 49
        Height = 13
        AutoSize = True
        DataField = 'PATROCINADORA'
        DataSource = ds
      end
      object dbtSituacao: TDBText
        Left = 208
        Top = 48
        Width = 69
        Height = 13
        AutoSize = True
        DataField = 'SITUACAO'
        DataSource = ds
      end
      object dbtPlano: TDBText
        Left = 400
        Top = 48
        Width = 51
        Height = 13
        AutoSize = True
        DataField = 'PREVIDENCIARIO'
        DataSource = ds
      end
      object dbtDataInscricao: TDBText
        Left = 600
        Top = 48
        Width = 98
        Height = 13
        AutoSize = True
        DataField = 'INSCRICAODATA'
        DataSource = ds
      end
      object Label7: TLabel
        Left = 0
        Top = 64
        Width = 97
        Height = 13
        Caption = 'Nascimento / Idade '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 152
        Top = 64
        Width = 24
        Height = 13
        Caption = 'Sexo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 264
        Top = 64
        Width = 55
        Height = 13
        Caption = 'Estado Civil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 368
        Top = 64
        Width = 31
        Height = 13
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 552
        Top = 64
        Width = 71
        Height = 13
        Caption = 'Conta Corrente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbtNasc: TDBText
        Left = 0
        Top = 80
        Width = 48
        Height = 13
        AutoSize = True
        DataField = 'IDADE'
        DataSource = ds
      end
      object dbtSexo: TDBText
        Left = 152
        Top = 80
        Width = 47
        Height = 13
        AutoSize = True
        DataField = 'SEXO'
        DataSource = ds
      end
      object dbtEstCivil: TDBText
        Left = 264
        Top = 80
        Width = 61
        Height = 13
        AutoSize = True
        DataField = 'ESTCIVIL'
        DataSource = ds
      end
      object dbtBanco: TDBText
        Left = 368
        Top = 80
        Width = 55
        Height = 13
        AutoSize = True
        DataField = 'BANCO'
        DataSource = ds
      end
      object dbtConta: TDBText
        Left = 552
        Top = 80
        Width = 52
        Height = 13
        AutoSize = True
        DataField = 'CONTA'
        DataSource = ds
      end
      object Label14: TLabel
        Left = 0
        Top = 96
        Width = 93
        Height = 13
        Caption = 'Endereço Completo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbtEndCompleto: TDBText
        Left = 0
        Top = 112
        Width = 93
        Height = 13
        AutoSize = True
        DataField = 'ENDERECO'
        DataSource = ds
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 129
      Width = 739
      Height = 292
      Tabs.Strings = (
        'Planos Inscritos')
      inherited pgctrlDetalhe: TPageControl
        Width = 641
        Height = 233
        inherited tbsDet: TTabSheet
          Caption = 'Planos Inscritos'
          inherited dbgrdDet: TwwDBGrid
            Width = 633
            Height = 205
            Selected.Strings = (
              'NOME'#9'40'#9'Plano Assistencial'#9'F'
              'DATAENTRADA'#9'18'#9'Data da Inscrição'#9'F'
              'DESCRICAO'#9'50'#9'Situação no Plano'#9'F'
              'DATACANCELAMENTO'#9'18'#9'Data do Cancelamento'#9'F')
          end
          inherited pnlControlesDet: TPanel
            Width = 633
            Height = 205
            object Label15: TLabel
              Left = 0
              Top = 6
              Width = 104
              Height = 13
              Caption = 'Plano Assistencial'
            end
            object Label49: TLabel
              Left = 261
              Top = 6
              Width = 102
              Height = 13
              Caption = 'Data de Inscrição'
            end
            object Label16: TLabel
              Left = 379
              Top = 6
              Width = 88
              Height = 13
              Caption = 'Cobrança Atual'
            end
            object Label18: TLabel
              Left = 3
              Top = 48
              Width = 134
              Height = 13
              Caption = 'Contribuição Associada'
            end
            object edtCobra: TEdit
              Left = 379
              Top = 25
              Width = 254
              Height = 21
              CharCase = ecUpperCase
              Color = clInactiveCaption
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
            object chkContrib: TCheckListBox
              Left = 2
              Top = 63
              Width = 271
              Height = 138
              OnClickCheck = chkContribClickCheck
              ItemHeight = 13
              Items.Strings = (
                'Mensalidade Folha de benefícios'
                'Mensalidade Folha de Pagamento')
              TabOrder = 0
            end
            object dblkPlano: TwwDBLookupCombo
              Left = 2
              Top = 25
              Width = 255
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'5'#9'Plano')
              DataField = 'IDPLANASS'
              DataSource = dsDet
              LookupTable = qryPlanos
              LookupField = 'IDPLANASS'
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = dblkPlanoCloseUp
            end
            object dbtpDataInscricao: TwwDBDateTimePicker
              Left = 263
              Top = 25
              Width = 110
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              DataField = 'DATAENTRADA'
              DataSource = dsDet
              Epoch = 1950
              ShowButton = True
              TabOrder = 2
            end
            object GroupBox1: TGroupBox
              Left = 280
              Top = 56
              Width = 353
              Height = 145
              Caption = '  Outras Informações  '
              TabOrder = 3
              object Label17: TLabel
                Left = 5
                Top = 101
                Width = 176
                Height = 13
                Caption = 'Situação no Plano Assistencial'
              end
              object Label19: TLabel
                Left = 5
                Top = 57
                Width = 111
                Height = 13
                Caption = 'Forma de Cobrança'
              end
              object Label20: TLabel
                Left = 117
                Top = 57
                Width = 194
                Height = 13
                Caption = '(preencher apenas em excessões)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object chkOpcaoA: TDBCheckBox
                Left = 197
                Top = 75
                Width = 153
                Height = 17
                Caption = 'Cobrança Diferenciada'
                DataField = 'OPCAOA'
                DataSource = dsDet
                TabOrder = 0
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dblkSitPlanoAss: TwwDBLookupCombo
                Left = 5
                Top = 117
                Width = 241
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'UPPER(DESCRICAO)'#9'50'#9'UPPER(DESCRICAO)'#9'F')
                DataField = 'IDSITPART'
                DataSource = dsDet
                LookupTable = qrySitPlanoAss
                LookupField = 'IDSITPLANOASS'
                TabOrder = 1
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
              end
              object dblkCodPortForma: TwwDBLookupCombo
                Left = 5
                Top = 74
                Width = 183
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'50'#9'Cobrança em '#9'F')
                DataField = 'CODPORTFORMA'
                DataSource = dsContass
                LookupTable = qryPortForma
                LookupField = 'CODPORTFORMA'
                TabOrder = 2
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = True
              end
              object dbrgflgcobcarne: TDBRadioGroup
                Left = 5
                Top = 17
                Width = 344
                Height = 34
                Caption = 'Forma de Pagamento'
                Columns = 2
                DataField = 'FLGCOBCARNE'
                DataSource = dsContass
                Items.Strings = (
                  'Folha'
                  'Outros')
                TabOrder = 3
                Values.Strings = (
                  '0'
                  '1')
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 731
      end
      inherited Dock974: TDock97
        Left = 645
        Height = 233
        inherited tb97Detalhe: TToolbar97
          object btnOpcoes: TBitBtn
            Left = 0
            Top = 81
            Width = 85
            Height = 27
            Cancel = True
            Caption = '&Opções'
            TabOrder = 3
            OnClick = btnOpcoesClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300033333
              33333330CCC0000000003330C00CCCCCCCC03330CF000788FFC0330CCF08F700
              0FC030CCFF08F8FB7FC030CFFF0877FF7FC030CFFF08F77B7FC030CFFF0877FF
              7FC030CFFF08F77B7FC030CFFF08F7FF7FC030CFF877FFFB700330CFF73377FF
              733330CF87333377733333787333333333333337333333333333}
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 741
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 469
    Width = 741
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 256
    Top = 2
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 547
    Top = 419
  end
  inherited ds: TwwDataSource
    Left = 418
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (IDPESSOA, NOME)'
      'values'
      '  (:IDPESSOA, :NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 378
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Insere Novo Participante no Assistencial'
    Colunas.Strings = (
      'PV.INSCRICAONUMERO'
      'EL.MATRICULA'
      'PE.NOME'
      'DECODE(PF.DATAMORTE, NULL, '#39'NÃO'#39','#39'SIM'#39') AS FALECIDO'
      'PL.NOME'
      'PJ.NOME AS PATROCINADORA')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Inscrição'
      'Matrícula'
      'Nome'
      'Falecido ?'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA PE'
      'PESSOA PJ'
      'PESSOAFISICA PF'
      'DEPENTIT DP'
      'ELEGPATRO EL'
      'PARTPREVPLAN PV'
      'PLANPREV PL'
      'NUCLEOFAMASS NF')
    CamposChave.Strings = (
      'EL.IDPESSOA'
      'PE.IDPESSOA'
      'NF.IDRESPONSAVEL'
      'PF.DATAMORTE'
      'PV.IDPESSJUR'
      'PV.IDPLANOPREV'
      'PV.SEQPROPOSTA')
    Filtro.Strings = (
      'DP.IDPESSOA        = DP.IDPESSOA'
      'DP.IDTITULAR       = PE.IDPESSOA'
      'PV.IDPESSOA        = PE.IDPESSOA'
      'PF.IDPESSOA        = PV.IDPESSOA'
      'EL.IDPESSJUR       = PJ.IDPESSOA'
      'EL.IDPESSOA        = PV.IDPESSOA'
      'PV.IDPESSJUR       = EL.IDPESSJUR'
      'PV.IDPLANOPREV     = PL.IDPLANOPREV'
      'PV.IDSITPART       = PV.IDSITPART'
      'PV.FLGDESATIVADO   = 0'
      'NF.IDTITULAR(+)    = PV.IDPESSOA'
      'NVL(NF.IDTITULAR,DP.IDTITULAR)  = DP.IDPESSOA'
      '( PV.DATACANCELAMENTO IS NULL ) ')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '13'
      '60'
      '1'
      '50'
      '50')
    Left = 459
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 297
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 508
    Top = 2
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT EL.IDPESSOA, EL.MATRICULA, PV.INSCRICAONUMERO, PV.IDPESSJ' +
        'UR,'
      '       UPPER(SP.DESCRICAO) AS SITUACAO, SP.FLGINTERNO,'
      
        '       DECODE(NF.IDRESPONSAVEL, NULL, PE.NOME, PS.NOME) AS NOMER' +
        'ESPONSAVEL,'
      '       PE.NOME,'
      
        '       PF.DATANASC||'#39' - '#39'|| TRUNC((SYSDATE - PF.DATANASC)/365.5)' +
        '||'#39' Anos'#39' AS IDADE,'
      '       PF.SEXO, NF.IDRESPONSAVEL, NF.IDNUCLEO,'
      '       UPPER(PS.NOME) AS RESPONSAVEL,'
      '       DECODE(PF.ESTCIVIL,'#39'S'#39','#39'SOLTEIRO(A)'#39','
      '                          '#39'C'#39','#39'CASADO(A)'#39','
      '                          '#39'D'#39','#39'DIVORCIADO(A)'#39','
      '                          '#39'V'#39','#39'VIÚVO(A)'#39','
      '                          '#39'O'#39','#39'OUTROS'#39') AS ESTCIVIL,'
      '       PJ.NOME AS PATROCINADORA,'
      '       SD.DESCRICAO AS DEPENDENTE,'
      '       UPPER(DP.DESCRICAO) AS DEPENDENCIA,'
      '       DECODE(FLGDEPLEGAL, 0, '#39'NÃO'#39','
      '                           1, '#39'SIM'#39','
      '                        NULL, '#39'AGREGADO'#39') AS LEGAL,'
      '       PL.IDPLANOPREV,'
      '       PL.NOME PREVIDENCIARIO,'
      '       PV.INSCRICAODATA,'
      
        '       RTRIM(EP.LOGRADOURO) || '#39' '#39'|| RTRIM(EP.NUMERO) || '#39' '#39' || ' +
        'RTRIM(EP.COMPLEMENTO) || '#39' '#39' || RTRIM(EP.BAIRRO) || '#39' '#39' || RTRIM' +
        '(EP.CIDADE) || '#39' '#39' || RTRIM(EP.CODESTADO) || '#39' CEP: '#39' || RTRIM(E' +
        'P.CEP) AS ENDERECO,'
      
        '       '#39'AG. '#39' || RTRIM(AB.NUMAGENCIA) || '#39' - C/C Nº '#39'|| CB.CONTA' +
        'CORRENTE AS CONTA,'
      '       PB.NOME AS BANCO,'
      '       PV.SEQPROPOSTA'
      
        'FROM   PESSOA PE, PARTPREVPLAN PV, ELEGPATRO EL, PESSOAFISICA PF' +
        ',PESSOA PJ,'
      
        '       NUCLEOFAMASS NF, DEPENTIT DT, DEPEN DP, DEPENDENTE DE,  S' +
        'ITDEPENDENTE SD,'
      
        '       PLANPREV PL, SITPART SP, PESSOA PS, ENDPESS EP, CONTABANC' +
        'ARIA CB,'
      '       AGENCIABANCARIA AB, BANCO BC, PESSOA PB'
      'WHERE (PE.IDPESSOA        = :IDPESSOA)'
      '  AND (PE.IDPESSOA        = PE.IDPESSOA)'
      '  AND (PE.IDPESSOA        = PV.IDPESSOA)'
      '  AND (PE.IDPESSOA        = EL.IDPESSOA)'
      '  AND (PV.IDPESSJUR       = EL.IDPESSJUR)'
      '  AND (PE.IDPESSOA        = PF.IDPESSOA)'
      '  AND (PV.IDPESSJUR       = PJ.IDPESSOA)'
      '  AND (PE.IDPESSOA        = NF.IDTITULAR(+))'
      '  AND (PV.IDPESSOA        = DT.IDTITULAR)'
      '  AND (DT.IDPESSOA        = PE.IDPESSOA)'
      '  AND (DT.IDTITULAR       = PE.IDPESSOA)'
      '  AND (DT.IDDEPENDENCIA   = DP.IDDEPENDENCIA)'
      '  AND (DE.IDPESSOA        = PE.IDPESSOA)'
      '  AND (DE.IDSITDEPENDENTE = SD.IDSITDEPENDENTE(+))'
      '  AND (PV.IDPLANOPREV     = PL.IDPLANOPREV)'
      '  AND (PV.FLGDESATIVADO   = 0)'
      '  AND (SP.IDSITPART       = PV.IDSITPART)'
      '  AND (PF.IDPESSOA        = NVL(NF.IDRESPONSAVEL,PE.IDPESSOA))'
      '  AND (NF.IDRESPONSAVEL   = PS.IDPESSOA(+))'
      '  AND (PF.IDPESSOA        = EP.IDPESSOA(+))'
      '  AND (PE.IDPESSOA        = CB.IDPESSOA(+))'
      '  AND (CB.FLGCONTAPREF(+) = 1)'
      '  AND (CB.IDAGENCIA       = AB.IDPESSOA(+))'
      '  AND (AB.IDBANCO         = BC.IDPESSOA(+))'
      '  AND (BC.IDPESSOA        = PB.IDPESSOA(+))'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 337
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 444
    Top = 419
  end
  object qryDet: TwwQuery
    Tag = 5
    CachedUpdates = True
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PS.IDPESSJUR, PS.SEQPROPOSTA, PS.IDPLANOPREV, PS.IDPESSOA' +
        ', PS.IDPLANASS,'
      
        '       PS.IDSITPART, PS.DATAENTRADA, PS.FLGINSCRICAOCANC, PS.INS' +
        'CRICAONUMERO,'
      
        '       PS.DATACANCELAMENTO, PS.INSCRICAOTIPO, PS.OBSCANCEL,  PS.' +
        'FLGPARTBENEF,'
      
        '       PS.OPCAOA, PS.OPCAOB, PS.IDFORNSERV2, PS.COMISSFORN, PS.C' +
        'OMISSFUND,'
      
        '       PS.FLGOPCAOA, PS.TIPOFORNSERV2, PS.FLGOPCAOB, PS.IDNUCLEO' +
        ','
      '       PL.NOME, SP.DESCRICAO,'
      '       VALORBASE1, VALORBASE2, VALORBASE3, VALORBASE4,'
      '       VALORBASE5, VALORBASE6, VALORBASE7, VALORBASE8'
      'FROM PARTASS PS, PLANASS PL, SITPLANOASS SP'
      'WHERE PS.IDPESSJUR     = :IDPESSJUR'
      '  AND PS.SEQPROPOSTA   = :SEQPROPOSTA'
      '  AND PS.IDPLANOPREV   = :IDPLANOPREV'
      '  AND PS.IDPESSOA      = :IDPESSOA'
      '  AND PL.IDPLANASS     = PS.IDPLANASS'
      '  AND PS.IDSITPART     = SP.IDSITPLANOASS(+)'
      ' '
      ' '
      ''
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 499
    Top = 419
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
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
      end>
  end
  object qryPlanos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPLANASS,'
      '   NOME,'
      '   OPCAOAIDENT,'
      '   OPCAOBDIF,'
      '   CODPORTFORMA'
      'FROM'
      '   PLANASS'
      'WHERE'
      '   FLGATIVO = 1 AND'
      '   IDPLANASS NOT IN (SELECT P.IDPLANASS'
      '                     FROM PARTASS P, BENEFASS BA,'
      '                          PLANPREV PP, PLANASS PA,'
      '                          SITPLANOASS S'
      '                     WHERE (P.IDPESSOA = :IDPESSOA)'
      '                       AND (P.FLGINSCRICAOCANC = 0)'
      '                       AND (P.IDPESSOA = BA.IDTITULAR(+))'
      '                       AND (P.IDPESSJUR = BA.IDPESSJUR(+))'
      '                       AND (P.IDPLANOPREV = BA.IDPLANOPREV(+))'
      '                       AND (P.IDPLANASS = BA.IDPLANASS(+))'
      '                       AND (P.IDPESSOA = BA.IDDEPENDENTE(+))'
      '                       AND (P.SEQPROPOSTA = BA.SEQPROPOSTA(+))'
      '                       AND (P.IDPLANASS = PA.IDPLANASS)'
      '                       AND (P.IDPLANOPREV = PP.IDPLANOPREV)'
      '                       AND (P.IDSITPART= S.IDSITPLANOASS)  )'
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 70
    Top = 419
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qrySitPlanoAss: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITPLANOASS, UPPER(DESCRICAO)'
      'FROM SITPLANOASS')
    ValidateWithMask = True
    Left = 14
    Top = 419
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update PARTASS'
      'set'
      '  IDSITPART = :IDSITPART,'
      '  DATAENTRADA = :DATAENTRADA,'
      '  FLGINSCRICAOCANC = :FLGINSCRICAOCANC,'
      '  INSCRICAONUMERO = :INSCRICAONUMERO,'
      '  DATACANCELAMENTO = :DATACANCELAMENTO,'
      '  INSCRICAOTIPO = :INSCRICAOTIPO,'
      '  OBSCANCEL = :OBSCANCEL,'
      '  FLGPARTBENEF = :FLGPARTBENEF,'
      '  OPCAOA = :OPCAOA,'
      '  OPCAOB = :OPCAOB,'
      '  IDFORNSERV2 = :IDFORNSERV2,'
      '  COMISSFORN = :COMISSFORN,'
      '  COMISSFUND = :COMISSFUND,'
      '  FLGOPCAOA = :FLGOPCAOA,'
      '  TIPOFORNSERV2 = :TIPOFORNSERV2,'
      '  FLGOPCAOB = :FLGOPCAOB,'
      '  IDNUCLEO = :IDNUCLEO,'
      '  VALORBASE1 = :VALORBASE1,'
      '  VALORBASE2 = :VALORBASE2,'
      '  VALORBASE3 = :VALORBASE3,'
      '  VALORBASE4 = :VALORBASE4,'
      '  VALORBASE5 = :VALORBASE5,'
      '  VALORBASE6 = :VALORBASE6,'
      '  VALORBASE7 = :VALORBASE7,'
      '  VALORBASE8 = :VALORBASE8'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANASS = :OLD_IDPLANASS'
      ' ')
    InsertSQL.Strings = (
      'insert into PARTASS'
      '  (IDPESSJUR, SEQPROPOSTA, IDPLANOPREV, IDPESSOA, IDPLANASS,'
      'IDSITPART,'
      '   DATAENTRADA, FLGINSCRICAOCANC, INSCRICAONUMERO,'
      'DATACANCELAMENTO, INSCRICAOTIPO,'
      '   OBSCANCEL, FLGPARTBENEF, OPCAOA, OPCAOB, IDFORNSERV2,'
      'COMISSFORN, COMISSFUND,'
      '   FLGOPCAOA, TIPOFORNSERV2, FLGOPCAOB, IDNUCLEO, VALORBASE1,'
      '   VALORBASE2, VALORBASE3, VALORBASE4, VALORBASE5, VALORBASE6,'
      'VALORBASE7,'
      '   VALORBASE8)'
      'values'
      
        '  (:IDPESSJUR, :SEQPROPOSTA, :IDPLANOPREV, :IDPESSOA, :IDPLANASS' +
        ','
      ':IDSITPART,'
      '   :DATAENTRADA, :FLGINSCRICAOCANC, :INSCRICAONUMERO,'
      ':DATACANCELAMENTO,'
      '   :INSCRICAOTIPO, :OBSCANCEL, :FLGPARTBENEF, :OPCAOA, :OPCAOB,'
      ':IDFORNSERV2,'
      '   :COMISSFORN, :COMISSFUND, :FLGOPCAOA, :TIPOFORNSERV2,'
      ':FLGOPCAOB, :IDNUCLEO,'
      '   :VALORBASE1, :VALORBASE2, :VALORBASE3,:VALORBASE4, '
      '   :VALORBASE5, :VALORBASE6, :VALORBASE7, :VALORBASE8)'
      ' ')
    DeleteSQL.Strings = (
      'delete from PARTASS'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANASS = :OLD_IDPLANASS')
    Left = 602
    Top = 419
  end
  object qryContass: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANASS, IDTITULAR, IDDEPENDENTE, IDPLANOPREV,'
      '       IDPESSJUR, IDCONTASS, FLGATIVO, RECPAG,'
      '       CODPORTFORMA, FLGCOBCARNE, IDPAGADOR, SEQPROPOSTA'
      'FROM CONTASS'
      'WHERE IDPLANOPREV  = :IDPLANOPREV'
      '  AND IDPESSJUR    = :IDPESSJUR'
      '  AND IDTITULAR    = :IDTITULAR'
      '  AND IDDEPENDENTE = :IDDEPENDENTE'
      '  AND SEQPROPOSTA  = :SEQPROPOSTA'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updContass
    ValidateWithMask = True
    Left = 155
    Top = 146
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDDEPENDENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object dsContass: TwwDataSource
    DataSet = qryContass
    Left = 225
    Top = 146
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 369
    Top = 146
  end
  object updContass: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTASS'
      'set'
      '  FLGATIVO = :FLGATIVO,'
      '  RECPAG = :RECPAG,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  FLGCOBCARNE = :FLGCOBCARNE,'
      '  IDPAGADOR = :IDPAGADOR,'
      '  SEQPROPOSTA = :SEQPROPOSTA'
      'where'
      '  IDPLANASS = :OLD_IDPLANASS and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDDEPENDENTE = :OLD_IDDEPENDENTE and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDCONTASS = :OLD_IDCONTASS')
    InsertSQL.Strings = (
      'insert into CONTASS'
      '  (IDPLANASS, IDTITULAR, IDDEPENDENTE, IDPLANOPREV, IDPESSJUR, '
      'IDCONTASS, '
      '   FLGATIVO, RECPAG, CODPORTFORMA, FLGCOBCARNE, IDPAGADOR, '
      'SEQPROPOSTA)'
      'values'
      
        '  (:IDPLANASS, :IDTITULAR, :IDDEPENDENTE, :IDPLANOPREV, :IDPESSJ' +
        'UR, '
      ':IDCONTASS, '
      '   :FLGATIVO, :RECPAG, :CODPORTFORMA, :FLGCOBCARNE, :IDPAGADOR, '
      ':SEQPROPOSTA)')
    DeleteSQL.Strings = (
      'delete from CONTASS'
      'where'
      '  IDPLANASS = :OLD_IDPLANASS and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDDEPENDENTE = :OLD_IDDEPENDENTE and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDCONTASS = :OLD_IDCONTASS')
    Left = 298
    Top = 146
  end
  object qryContribAss: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 433
    Top = 146
  end
  object qryPortForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODPORTFORMA, DESCRICAO, RECPAG FROM PORTADORFORMA'
      'WHERE RECPAG = '#39'R'#39
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 580
    Top = 2
  end
end
