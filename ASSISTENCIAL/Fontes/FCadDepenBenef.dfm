inherited frmCadDepenBenef: TfrmCadDepenBenef
  Left = 181
  Top = 414
  Caption = 'Cadastro de Dependentes Assistenciais'
  ClientHeight = 490
  ClientWidth = 762
  WindowState = wsMaximized
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 762
    Height = 404
    inherited pnlMestre: TPanel
      Width = 760
      Height = 84
      object lblParticipante: TLabel
        Left = 8
        Top = 1
        Width = 69
        Height = 13
        Caption = 'Participante'
      end
      object lblMatricula: TLabel
        Left = 304
        Top = 29
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object lblPatro: TLabel
        Left = 8
        Top = 29
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object lblInscricao: TLabel
        Left = 304
        Top = 56
        Width = 71
        Height = 13
        Caption = 'Inscrição Nº'
      end
      object lblPlanoPrev: TLabel
        Left = 8
        Top = 56
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object dbTNome: TDBText
        Left = 8
        Top = 14
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
      object dbTPatro: TDBText
        Left = 8
        Top = 42
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
      object dbTPlano: TDBText
        Left = 8
        Top = 69
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
      object dbTMatricula: TDBText
        Left = 304
        Top = 42
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
      object dbTInscricao: TDBText
        Left = 304
        Top = 69
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
      object Label2: TLabel
        Left = 305
        Top = 0
        Width = 104
        Height = 13
        Caption = 'Plano Assistencial'
      end
      object dbTPlanassist: TDBText
        Left = 304
        Top = 15
        Width = 80
        Height = 13
        AutoSize = True
        DataField = 'PLANASSIST'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 85
      Width = 760
      Height = 318
      Tabs.Strings = (
        'Dados do Dependente'
        'Endereços do Dependente'
        'Benefícios do Plano')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgrdEndPess'
        'dbgrdBfciarioTitAss')
      object TLabel [0]
        Left = 280
        Top = 72
        Width = 5
        Height = 13
      end
      object lblPdCEP: TLabel [1]
        Left = 408
        Top = 191
        Width = 37
        Height = 13
        Caption = 'C.E.P.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited pgctrlDetalhe: TPageControl
        Width = 662
        Height = 259
        inherited tbsDet: TTabSheet
          Caption = 'Dados do Dependente'
          inherited dbgrdDet: TwwDBGrid
            Width = 654
            Height = 231
            Selected.Strings = (
              'NUMSEQUENCIA'#9'4'#9'Seq.'
              'NOME'#9'40'#9'Dependente'
              'TIPODEPENDENCIA'#9'15'#9'Tipo de Dependência'
              'DATACADASTRO'#9'18'#9'Data de Cadastramento')
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 654
            Height = 231
            object lblNome: TLabel
              Left = 5
              Top = -2
              Width = 33
              Height = 13
              Caption = 'Nome'
            end
            object lblNumSequencia: TLabel
              Left = 562
              Top = 97
              Width = 79
              Height = 13
              Caption = 'Nº Sequência'
            end
            object lblTipoDepen: TLabel
              Left = 394
              Top = 97
              Width = 105
              Height = 13
              Caption = 'Tipo Dependência'
            end
            object lblSitDependente: TLabel
              Left = 215
              Top = 97
              Width = 124
              Height = 13
              Caption = 'Situação Dependente'
            end
            object Label1: TLabel
              Left = 8
              Top = 144
              Width = 134
              Height = 13
              Caption = 'Data de Cadastramento'
            end
            object Label3: TLabel
              Left = 5
              Top = 97
              Width = 68
              Height = 13
              Caption = 'Estado Civil'
            end
            object grpFiliacao: TGroupBox
              Left = 360
              Top = 0
              Width = 281
              Height = 88
              TabOrder = 2
              object lblNomePai: TLabel
                Left = 6
                Top = 8
                Width = 73
                Height = 13
                Caption = 'Nome do Pai'
              end
              object lblNomeMae: TLabel
                Left = 8
                Top = 47
                Width = 79
                Height = 13
                Caption = 'Nome da Mãe'
              end
              object dbeNomePai: TDBEdit
                Left = 6
                Top = 24
                Width = 267
                Height = 21
                DataField = 'NOMEPAI'
                DataSource = dsPF
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object dbeNomeMae: TDBEdit
                Left = 6
                Top = 62
                Width = 267
                Height = 21
                DataField = 'NOMEMAE'
                DataSource = dsPF
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
            end
            object dbeNome: TDBEdit
              Left = 5
              Top = 14
              Width = 235
              Height = 21
              DataField = 'NOME'
              DataSource = dsPessoa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object grpDataNasc: TGroupBox
              Left = 5
              Top = 37
              Width = 352
              Height = 52
              TabOrder = 3
              object lblDtNascimento: TLabel
                Left = 7
                Top = 8
                Width = 116
                Height = 13
                Caption = 'Data de Nascimento'
              end
              object lblTpSang: TLabel
                Left = 247
                Top = 8
                Width = 92
                Height = 13
                Caption = 'Tipo Sanguíneo'
              end
              object lblDataMorte: TLabel
                Left = 127
                Top = 8
                Width = 82
                Height = 13
                Caption = 'Data de Morte'
              end
              object dbeTipoSang: TDBEdit
                Left = 247
                Top = 22
                Width = 98
                Height = 21
                DataField = 'TIPOSANG'
                DataSource = dsPF
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object dtpDataNasc: TwwDBDateTimePicker
                Left = 8
                Top = 22
                Width = 115
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                DataField = 'DATANASC'
                DataSource = dsPF
                Epoch = 1950
                ShowButton = True
                TabOrder = 0
              end
              object dtpDataMorte: TwwDBDateTimePicker
                Left = 128
                Top = 22
                Width = 115
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                DataField = 'DATAMORTE'
                DataSource = dsPF
                Epoch = 1950
                ShowButton = True
                TabOrder = 1
              end
            end
            object dbeNumSequencia: TDBEdit
              Left = 562
              Top = 112
              Width = 79
              Height = 21
              Color = clScrollBar
              DataField = 'NUMSEQUENCIA'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 7
            end
            object dblkpcmbTipoDependencia: TCMDBLookupCombo
              Left = 394
              Top = 112
              Width = 118
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'15'#9'Descrição')
              DataField = 'IDDEPENDENCIA'
              DataSource = dsDet
              LookupTable = qryDependencia
              LookupField = 'IDDEPENDENCIA'
              Options = [loTitles]
              Style = csDropDownList
              ParentFont = False
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbrdgrpSexo: TDBRadioGroup
              Left = 244
              Top = 1
              Width = 113
              Height = 35
              Caption = 'Sexo'
              Columns = 2
              DataField = 'SEXO'
              DataSource = dsPF
              Items.Strings = (
                'Masc.'
                'Fem.')
              TabOrder = 1
              TabStop = True
              Values.Strings = (
                'M'
                'F')
            end
            object dblkpcmbSitDependente: TwwDBLookupCombo
              Left = 215
              Top = 112
              Width = 122
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'dESCRIÇÃO')
              DataField = 'IDSITDEPENDENTE'
              DataSource = dsDepen
              LookupTable = qrySitDependente
              LookupField = 'IDSITDEPENDENTE'
              ParentFont = False
              TabOrder = 5
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
            end
            object dbcEstCivil: TwwDBComboBox
              Left = 5
              Top = 112
              Width = 177
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = True
              AllowClearKey = False
              DataField = 'ESTCIVIL'
              DataSource = dsPF
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'Solteiro(a)'#9'S'
                'Casado(a)'#9'C'
                'Divorciado(a)'#9'D'
                'Viúvo(a)'#9'V'
                'Outros'#9'O')
              Sorted = False
              TabOrder = 4
              UnboundDataType = wwDefault
            end
            object dtpDataCadastro: TwwDBDateTimePicker
              Left = 8
              Top = 159
              Width = 132
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              DataField = 'DATACADASTRO'
              DataSource = dsDet
              Epoch = 1950
              ShowButton = True
              TabOrder = 8
            end
            object GroupBox3: TGroupBox
              Left = 176
              Top = 144
              Width = 465
              Height = 87
              Caption = 
                'Participação do Beneficiário no Plano Assistencial do Participan' +
                'te.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 9
              object Label7: TLabel
                Left = 8
                Top = 24
                Width = 55
                Height = 13
                Caption = 'Situação:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label8: TLabel
                Left = 8
                Top = 44
                Width = 78
                Height = 13
                Caption = 'Dt. Inscrição:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label9: TLabel
                Left = 8
                Top = 64
                Width = 106
                Height = 13
                Caption = 'Dt. Cancelamento:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblSituacao: TLabel
                Left = 72
                Top = 24
                Width = 64
                Height = 13
                Caption = 'lblSituacao'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblDtInscricao: TLabel
                Left = 96
                Top = 45
                Width = 79
                Height = 13
                Caption = 'lblDtInscricao'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblDtCanc: TLabel
                Left = 120
                Top = 64
                Width = 56
                Height = 13
                Caption = 'lblDtCanc'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object bbtnCancInscr: TButton
                Left = 256
                Top = 32
                Width = 100
                Height = 35
                Caption = 'Cancelar'
                TabOrder = 1
                OnClick = bbtnCancInscrClick
              end
              object bbtnInscrever: TButton
                Left = 256
                Top = 32
                Width = 100
                Height = 35
                Caption = 'Inscrever'
                TabOrder = 0
                OnClick = bbtnInscreverClick
              end
            end
          end
        end
        object tbsEndereco: TTabSheet
          Caption = 'Endereços do Dependente'
          object pnlControlesEndPess: TPanel
            Left = 0
            Top = 0
            Width = 654
            Height = 231
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblNumero: TLabel
              Left = 420
              Top = 20
              Width = 44
              Height = 13
              Caption = 'Número'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblCEP: TLabel
              Left = 420
              Top = 70
              Width = 37
              Height = 13
              Caption = 'C.E.P.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPais: TLabel
              Left = 421
              Top = 125
              Width = 25
              Height = 13
              Caption = 'Pais'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblEstado: TLabel
              Left = 241
              Top = 125
              Width = 40
              Height = 13
              Caption = 'Estado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblBairro: TLabel
              Left = 240
              Top = 70
              Width = 34
              Height = 13
              Caption = 'Bairro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblCidade: TLabel
              Left = 15
              Top = 125
              Width = 40
              Height = 13
              Caption = 'Cidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblComplemento: TLabel
              Left = 15
              Top = 70
              Width = 76
              Height = 13
              Caption = 'Complemento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblLogradouro: TLabel
              Left = 14
              Top = 20
              Width = 65
              Height = 13
              Caption = 'Logradouro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object GroupBox1: TGroupBox
              Left = 506
              Top = 24
              Width = 129
              Height = 135
              Caption = 'Tipo'
              TabOrder = 8
              object chkbxComercial: TCheckBox
                Left = 8
                Top = 16
                Width = 97
                Height = 17
                Caption = 'Comercial'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object chkbxEntrega: TCheckBox
                Left = 8
                Top = 64
                Width = 97
                Height = 17
                Caption = 'Entrega'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object chkbxCobranca: TCheckBox
                Left = 8
                Top = 88
                Width = 97
                Height = 17
                Caption = 'Cobrança'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object chkbxCorrespondencia: TCheckBox
                Left = 8
                Top = 112
                Width = 105
                Height = 17
                Caption = 'Correspondência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
              object chkbxResidencial: TCheckBox
                Left = 8
                Top = 40
                Width = 97
                Height = 17
                Caption = 'Residencial'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
            end
            object dbeNumero: TDBEdit
              Left = 420
              Top = 34
              Width = 70
              Height = 21
              DataField = 'NUMERO'
              DataSource = dsEndPess
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object cmbCidade: TCMDBLookupCombo
              Left = 15
              Top = 138
              Width = 211
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMECIDADE'#9'40'#9'Cidade')
              DataField = 'IDCIDADES'
              DataSource = dsEndPess
              LookupTable = qryCidade
              LookupField = 'IDCIDADES'
              Options = [loTitles]
              Style = csDropDownList
              ParentFont = False
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbeLogradouro: TDBEdit
              Left = 14
              Top = 34
              Width = 387
              Height = 21
              DataField = 'LOGRADOURO'
              DataSource = dsEndPess
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbeComplemento: TDBEdit
              Left = 15
              Top = 87
              Width = 211
              Height = 21
              DataField = 'COMPLEMENTO'
              DataSource = dsEndPess
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object dbeBairro: TDBEdit
              Left = 239
              Top = 87
              Width = 162
              Height = 21
              DataField = 'BAIRRO'
              DataSource = dsEndPess
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object dbeCEP: TDBEdit
              Left = 420
              Top = 87
              Width = 70
              Height = 21
              DataField = 'CEP'
              DataSource = dsEndPess
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object dbeEstado: TDBEdit
              Left = 239
              Top = 138
              Width = 162
              Height = 21
              Color = clBtnFace
              DataField = 'NOMEESTADO'
              DataSource = dsCidade
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
            end
            object dbePais: TDBEdit
              Left = 421
              Top = 138
              Width = 69
              Height = 21
              Color = clBtnFace
              DataField = 'NOMEPAIS'
              DataSource = dsCidade
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
            end
          end
          object dbgrdEndPess: TwwDBGrid
            Left = 0
            Top = 0
            Width = 654
            Height = 231
            Selected.Strings = (
              'LOGRADOURO'#9'60'#9'Logradouro'
              'NUMERO'#9'8'#9'Número'
              'COMPLEMENTO'#9'20'#9'Complemento'
              'BAIRRO'#9'20'#9'Bairro'
              'CEP'#9'8'#9'Cep')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsEndPess
            TabOrder = 1
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
        end
        object tbsBeneficios: TTabSheet
          Caption = 'Benefícios do Plano'
          ImageIndex = 2
          object pnlControleBfciarioTitAss: TPanel
            Left = 0
            Top = 0
            Width = 654
            Height = 231
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label4: TLabel
              Left = 72
              Top = 40
              Width = 129
              Height = 26
              Alignment = taCenter
              Caption = 'Total de Beneficiários a receber o benefício'
              WordWrap = True
            end
            object Label5: TLabel
              Left = 280
              Top = 40
              Width = 79
              Height = 26
              Alignment = taCenter
              Caption = 'Percentual Já Distribuido'
              WordWrap = True
            end
            object Label6: TLabel
              Left = 448
              Top = 40
              Width = 79
              Height = 26
              Alignment = taCenter
              Caption = 'Percentual p/ Beneficiário'
              WordWrap = True
            end
            object dbePercentual: TwwDBEdit
              Left = 448
              Top = 72
              Width = 81
              Height = 21
              DataField = 'PERCENTUAL'
              DataSource = dsBfciario
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnExit = dbePercentualExit
            end
            object edtTotalBenef: TEdit
              Left = 72
              Top = 72
              Width = 129
              Height = 21
              Color = clInactiveCaption
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object edtPercJaDist: TEdit
              Left = 280
              Top = 72
              Width = 81
              Height = 21
              Color = clInactiveCaption
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object dbgrdBfciarioTitAss: TwwDBGrid
            Left = 0
            Top = 0
            Width = 654
            Height = 231
            Selected.Strings = (
              'TOTALBENEF'#9'10'#9'Total de Beneficiários'
              'TOTALPERCENT'#9'10'#9'Percentual já distribuido'
              'PERCENTUAL'#9'10'#9'Percentual do Beneficiário')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsBfciario
            TabOrder = 1
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
        end
      end
      inherited Dock973: TDock97
        Width = 752
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
        Left = 666
        Height = 259
      end
    end
  end
  inherited Dock972: TDock97
    Width = 762
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Width = 61
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 451
    Width = 762
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 16
    Top = 410
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 96
    Top = 61
  end
  inherited ds: TwwDataSource
    Left = 51
    Top = 61
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
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 51
    Top = 77
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'EL.MATRICULA'
      'P.NOME'
      'PD.NOME'
      'PP.INSCRICAONUMERO'
      'PL.NOME'
      'PT.NOME'
      'PLA.NOME'
      'PA.DATAENTRADA'
      'PA.DATACANCELAMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      ''
      '')
    Descricao.Strings = (
      'Matrícula'
      'Titular'
      'Dependente'
      'Inscrição Nº'
      'Plano Previdenciário'
      'Patrocinadora'
      'Plano Assistencial'
      'Data Inscrição'
      'Data Cancelamento')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S'
      'S'
      'S'
      'S'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'PESSOA PT'
      'PESSOA PD'
      'ELEGPATRO EL'
      'PLANPREV PL'
      'PARTPREVPLAN PP'
      'DEPENTIT DT'
      'PLANPREVPATRO PPP'
      'PARTASS PA'
      'PLANASS PLA')
    CamposChave.Strings = (
      'PP.IDPESSOA'
      'PP.IDPESSJUR'
      'PP.IDPLANOPREV'
      'PP.SEQPROPOSTA'
      'DT.IDPESSOA'
      'PLA.IDPLANASS')
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
      'PP.FLGDESATIVADO = 0'
      'PA.IDPESSJUR = PP.IDPESSJUR'
      'PA.IDPESSOA = PP.IDPESSOA'
      'PA.SEQPROPOSTA = 1'
      'PA.IDPLANASS      = PLA.IDPLANASS'
      'NVL(PA.FLGINSCRICAOCANC, 0) = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '60'
      '60'
      '15'
      '60'
      '60'
      '40'
      '10'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
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
      ''
      ''
      '')
    Left = 398
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 57
    Top = 410
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Top = 65535
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT P.NOME,'
      '              PT.NOME AS NOMEPATRO, '
      '              PL.NOME AS NOMEPLANO,'
      '              PS.NOME AS PLANASSIST,'
      '              EL.MATRICULA,       '
      '              PP.INSCRICAONUMERO,   '
      '              PP.IDPESSJUR,         '
      '              PP.IDPLANOPREV,'
      '              PA.IDPLANASS,'
      '              PP.IDPESSOA,'
      '              PP.SEQPROPOSTA,'
      '              SP.FLGINTERNO,'
      '              PP.INSCRICAODATA,'
      '              PP.IDSITPART,'
      '              PF.DATANASC,'
      
        '              DECODE(SP.FLGINTERNO, '#39'MA'#39', PP.SALMANTIDO, PP.SALP' +
        'ARTICIPACAO) AS SALARIO'
      'FROM    PESSOA P, '
      '              PESSOA PT, '
      '              PESSOAFISICA PF, '
      '              PLANPREV PL, '
      '              PARTPREVPLAN PP,'
      '              ELEGPATRO EL, '
      '              SITPART SP ,'
      '              PLANASS PS,'
      '              PARTASS PA'
      'WHERE (PP.IDPESSJUR         = :IDPESSJUR)'
      'AND       (PP.IDPLANOPREV    = :IDPLANOPREV)'
      'AND       (PP.IDPESSOA           = :IDPESSOA)'
      'AND       (PP.SEQPROPOSTA  = :SEQPROPOSTA)'
      'AND       (PP.IDPLANOPREV    = PL.IDPLANOPREV)'
      'AND       (PP.IDPESSOA           = P.IDPESSOA)'
      'AND       (PP.IDPESSJUR         = PT.IDPESSOA)'
      'AND       (PP.IDPESSJUR         = EL.IDPESSJUR)'
      'AND       (PP.IDPESSOA           = EL.IDPESSOA)'
      'AND       (PP.IDSITPART          = SP.IDSITPART)'
      'AND       (EL.IDPESSOA            = PF.IDPESSOA)'
      'AND       (PA.IDPESSJUR = PP.IDPESSJUR)'
      'AND       (PA.IDPLANOPREV = PP.IDPLANOPREV)  '
      'AND       (PA.IDPESSOA = PP.IDPESSOA)'
      'AND       (PA.SEQPROPOSTA = 1)'
      'AND       (PA.IDPLANASS = PS.IDPLANASS) '
      'AND       (NVL(PA.FLGINSCRICAOCANC,0) = 0)'
      ' ')
    Left = 51
    Top = 45
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
    RepetirInsert = False
    Left = 297
    Top = 65535
  end
  object qryDet: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       PE.NOME,'
      '       PE.IDPESSOA,'
      '       DT.IDTITULAR,'
      '       DP.DESCRICAO AS TIPODEPENDENCIA,'
      '       DT.NUMSEQUENCIA,'
      '       DT.FLGCONTAIMPOSTOR,'
      '       DT.FLGCONTASALARIOF,'
      '       DT.FLGBENEFICIARIO,'
      '       DT.FLGDESIGNADO,'
      '       DT.FLGDEPLEGAL,'
      '       DT.IDDEPENDENCIA,'
      '       DT.DATACADASTRO,'
      '       DECODE(BE.IDDEPENDENTE, DT.IDPESSOA, 1, 0) FLGBENEFASS,'
      '       BE.FLGATIVO,'
      '       BE.DATAENTRADA,'
      '       BE.DTCANCELAMENTO'
      'FROM   PESSOA   PE,'
      '       PARTASS  PA,'
      
        #9'   (SELECT IDTITULAR, IDDEPENDENTE, FLGATIVO, DATAENTRADA, DTCA' +
        'NCELAMENTO'
      #9'    FROM BENEFASS'
      #9'    WHERE IDPESSJUR   = :IDPESSJUR'
      '              AND SEQPROPOSTA = :SEQPROPOSTA'
      '              AND IDPLANOPREV = :IDPLANOPREV'
      '              AND IDPLANASS   = :IDPLANASS'
      '              AND IDTITULAR   = :IDTITULAR) BE,'
      '       DEPEN    DP,'
      '       DEPENTIT DT'
      'WHERE PA.IDPESSJUR     = :IDPESSJUR'
      '  AND PA.SEQPROPOSTA   = :SEQPROPOSTA'
      '  AND PA.IDPLANOPREV   = :IDPLANOPREV'
      '  AND PA.IDPLANASS     = :IDPLANASS'
      '  AND PA.IDPESSOA      = :IDTITULAR'
      '  AND DT.IDTITULAR     = PA.IDPESSOA'
      '  AND DT.IDPESSOA      = PE.IDPESSOA'
      '  AND DT.IDDEPENDENCIA = DP.IDDEPENDENCIA'
      '  AND DT.IDDEPENDENCIA <> '#39'PRP'#39
      '  AND DT.IDTITULAR     = BE.IDTITULAR(+)'
      '  AND DT.IDPESSOA      = BE.IDDEPENDENTE(+)'
      'ORDER BY DT.NUMSEQUENCIA'
      ' '
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGCONTAIMPOSTOR;CheckBox;1;0'
      'FLGCONTASALARIOF;CheckBox;1;0'
      'FLGBENEFICIARIO;CheckBox;1;0'
      'FLGDESIGNADO;CheckBox;1;0'
      'FLGDEPLEGAL;CheckBox;1;0')
    ValidateWithMask = True
    Left = 96
    Top = 45
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
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
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
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update DEPENTIT'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDTITULAR = :IDTITULAR,'
      '  NUMSEQUENCIA = :NUMSEQUENCIA,'
      '  FLGCONTAIMPOSTOR = :FLGCONTAIMPOSTOR,'
      '  FLGCONTASALARIOF = :FLGCONTASALARIOF,'
      '  FLGBENEFICIARIO = :FLGBENEFICIARIO,'
      '  FLGDESIGNADO = :FLGDESIGNADO,'
      '  FLGDEPLEGAL = :FLGDEPLEGAL,'
      '  IDDEPENDENCIA = :IDDEPENDENCIA,'
      '  DATACADASTRO = :DATACADASTRO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDTITULAR = :OLD_IDTITULAR')
    InsertSQL.Strings = (
      'insert into DEPENTIT'
      '  (IDPESSOA, IDTITULAR, NUMSEQUENCIA, FLGCONTAIMPOSTOR, '
      'FLGCONTASALARIOF, '
      '   FLGBENEFICIARIO, FLGDESIGNADO, FLGDEPLEGAL, IDDEPENDENCIA,'
      'DATACADASTRO)'
      'values'
      '  (:IDPESSOA, :IDTITULAR, :NUMSEQUENCIA, :FLGCONTAIMPOSTOR, '
      ':FLGCONTASALARIOF, '
      
        '   :FLGBENEFICIARIO, :FLGDESIGNADO, :FLGDEPLEGAL, :IDDEPENDENCIA' +
        ','
      ':DATACADASTRO)')
    DeleteSQL.Strings = (
      'delete from DEPENTIT'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDTITULAR = :OLD_IDTITULAR')
    Left = 96
    Top = 77
  end
  object dsDepen: TwwDataSource
    AutoEdit = False
    DataSet = qryDepen
    Left = 490
    Top = 61
  end
  object qryDepen: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryDepenBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  D.IDPESSOA, '
      '                D.IDSITDEPENDENTE, '
      '                D.FLGDESIGNADO'#13
      'FROM      DEPENDENTE D,'
      '                DEPENTIT DP'
      'WHERE  (DP.IDTITULAR = :IDPESSOA)'
      'AND        (DP.IDPESSOA = D.IDPESSOA) '
      ''
      '')
    UpdateObject = updDepen
    ValidateWithMask = True
    Left = 490
    Top = 45
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updDepen: TUpdateSQL
    ModifySQL.Strings = (
      'update DEPENDENTE'
      'set'
      '  IDSITDEPENDENTE = :IDSITDEPENDENTE,'
      '  FLGDESIGNADO = :FLGDESIGNADO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into DEPENDENTE'
      '  (IDPESSOA, IDSITDEPENDENTE, FLGDESIGNADO)'
      'values'
      '  (:IDPESSOA, :IDSITDEPENDENTE, :FLGDESIGNADO)')
    DeleteSQL.Strings = (
      'delete from DEPENDENTE'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 490
    Top = 77
  end
  object dsPF: TwwDataSource
    AutoEdit = False
    DataSet = qryPF
    Left = 138
    Top = 61
  end
  object qryPF: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryPFBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  PF.IDPESSOA, '
      '                PF.IDPAIS, '
      #9'PF.NOMEPAI, '
      '                PF.NOMEMAE, '
      '                PF.DATAMORTE, '
      '                PF.DATANASC, '
      '                PF.SEXO, '
      #9'PF.TIPOSANG, '
      '                PF.ESTCIVIL, '
      '                PF.NUMDEPIRRF, '
      '                PF.NUMDEPSALF, '
      '                PF.NUMDEPTOT, '
      '                PF.FLGISENTOIRRF '
      'FROM      PESSOAFISICA PF,'
      '                DEPENTIT DP'
      'WHERE  (DP.IDTITULAR = :IDPESSOA)'
      'AND        (PF.IDPESSOA = DP.IDPESSOA)'
      ''
      '')
    UpdateObject = updPF
    ValidateWithMask = True
    Left = 138
    Top = 45
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updPF: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOAFISICA'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPAIS = :IDPAIS,'
      '  NOMEPAI = :NOMEPAI,'
      '  NOMEMAE = :NOMEMAE,'
      '  DATAMORTE = :DATAMORTE,'
      '  DATANASC = :DATANASC,'
      '  SEXO = :SEXO,'
      '  TIPOSANG = :TIPOSANG,'
      '  ESTCIVIL = :ESTCIVIL,'
      '  NUMDEPIRRF = :NUMDEPIRRF,'
      '  NUMDEPSALF = :NUMDEPSALF,'
      '  NUMDEPTOT = :NUMDEPTOT,'
      '  FLGISENTOIRRF = :FLGISENTOIRRF'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOAFISICA'
      
        '  (IDPESSOA, IDPAIS, NOMEPAI, NOMEMAE, DATAMORTE, DATANASC, SEXO' +
        ', '
      'TIPOSANG, '
      '   ESTCIVIL, NUMDEPIRRF, NUMDEPSALF, NUMDEPTOT, FLGISENTOIRRF)'
      'values'
      
        '  (:IDPESSOA, :IDPAIS, :NOMEPAI, :NOMEMAE, :DATAMORTE, :DATANASC' +
        ', '
      ':SEXO, '
      '   :TIPOSANG, :ESTCIVIL, :NUMDEPIRRF, :NUMDEPSALF, :NUMDEPTOT, '
      ':FLGISENTOIRRF)')
    DeleteSQL.Strings = (
      'delete from PESSOAFISICA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 138
    Top = 77
  end
  object dsPessoa: TwwDataSource
    AutoEdit = False
    DataSet = qryPessoa
    Left = 500
    Top = 65535
  end
  object qryPessoa: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryPessoaBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  PES.IDPESSOA,  '
      '                PES.NOME, '
      '                PES.TIPO, '
      '                PES.RAZAOSOCIAL,'
      '                PES.IDENDCORRESP,'
      '                PES.IDENDCOMERCIAL,'
      '                PES.IDENDENTREGA,'
      '                PES.IDENDRESIDENCIAL,'
      '                PES.IDENDCOBRANCA'
      'FROM      PESSOA PES,'
      '                 DEPENTIT D'
      'WHERE   (D.IDTITULAR = :IDPESSOA)'
      'AND         (PES.IDPESSOA = D.IDPESSOA)'
      ''
      ' ')
    UpdateObject = updPessoa
    ValidateWithMask = True
    Left = 449
    Top = 65535
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updPessoa: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME,'
      '  TIPO = :TIPO,'
      '  RAZAOSOCIAL = :RAZAOSOCIAL,'
      '  IDENDCORRESP = :IDENDCORRESP,'
      '  IDENDCOMERCIAL = :IDENDCOMERCIAL,'
      '  IDENDENTREGA = :IDENDENTREGA,'
      '  IDENDRESIDENCIAL = :IDENDRESIDENCIAL,'
      '  IDENDCOBRANCA = :IDENDCOBRANCA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      
        '  (IDPESSOA, NOME, TIPO, RAZAOSOCIAL, IDENDCORRESP, IDENDCOMERCI' +
        'AL, '
      'IDENDENTREGA, '
      '   IDENDRESIDENCIAL, IDENDCOBRANCA)'
      'values'
      '  (:IDPESSOA, :NOME, :TIPO, :RAZAOSOCIAL, :IDENDCORRESP, '
      ':IDENDCOMERCIAL, '
      '   :IDENDENTREGA, :IDENDRESIDENCIAL, :IDENDCOBRANCA)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 551
    Top = 65535
  end
  object dsEndPess: TwwDataSource
    DataSet = qryEndPess
    Left = 188
    Top = 61
  end
  object qryEndPess: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryEndPessBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  EP.IDPESSOA ,'
      '  EP.IDENDERECO ,'
      '  EP.IDCIDADES ,'
      '  EP.LOGRADOURO ,'
      '  EP.NUMERO ,'
      '  EP.COMPLEMENTO ,'
      '  EP.BAIRRO , '
      '  EP.CEP ,'
      '  EP.IDPAIS,'
      '  C.NOME AS NOMECIDADE,'
      '  E.NOMEESTADO,'
      '  P.NOMEPAIS'
      'FROM '
      '  ENDPESS EP,'
      '  CIDADES C,'
      '  ESTADO E,'
      '  PAIS P,'
      '  DEPENTIT D'
      'WHERE'
      '         (D.IDTITULAR = :IDTITULAR)'
      'AND (EP.IDPESSOA = D.IDPESSOA)'
      'AND (EP.IDCIDADES = C.IDCIDADES(+))'
      'AND (C.IDESTADO = E.IDESTADO(+))'
      'AND (E.IDPAIS = P.IDPAIS(+))'
      ''
      '')
    UpdateObject = updEndPess
    ValidateWithMask = True
    Left = 188
    Top = 45
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object updEndPess: TUpdateSQL
    ModifySQL.Strings = (
      'update ENDPESS'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDCIDADES = :IDCIDADES,'
      '  LOGRADOURO = :LOGRADOURO,'
      '  NUMERO = :NUMERO,'
      '  COMPLEMENTO = :COMPLEMENTO,'
      '  BAIRRO = :BAIRRO,'
      '  CEP = :CEP,'
      '  IDPAIS = :IDPAIS'
      'where'
      '  IDENDERECO = :OLD_IDENDERECO')
    InsertSQL.Strings = (
      'insert into ENDPESS'
      '  (IDPESSOA, IDENDERECO, IDCIDADES, LOGRADOURO, NUMERO, '
      'COMPLEMENTO, BAIRRO, '
      '   CEP, IDPAIS)'
      'values'
      '  (:IDPESSOA, :IDENDERECO, :IDCIDADES, :LOGRADOURO, :NUMERO, '
      ':COMPLEMENTO, '
      '   :BAIRRO, :CEP, :IDPAIS)')
    DeleteSQL.Strings = (
      'delete from ENDPESS'
      'where'
      '  IDENDERECO = :OLD_IDENDERECO')
    Left = 188
    Top = 77
  end
  object qryDependencia: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDDEPENDENCIA, DESCRICAO'
      'FROM DEPEN'
      'WHERE IDDEPENDENCIA <> '#39'PRP'#39
      'ORDER BY DESCRICAO'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 170
    Top = 132
  end
  object qrySeq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(NUMSEQUENCIA) AS PROXNUMSEQ'
      'FROM   DEPENTIT '
      'WHERE  IDTITULAR = :IDTITULAR ')
    ValidateWithMask = True
    Left = 674
    Top = 324
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object qryCidade: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  C.IDCIDADES,'
      '  C.NOME AS NOMECIDADE,'
      '  E.CODESTADO , '
      '  E.NOMEESTADO , '
      '  P.IDPAIS , '
      '  P.NOMEPAIS,'
      '  P.MASCARACPOSTAL,'
      '  E.IDESTADO'
      'FROM '
      '  CIDADES C,'
      '  ESTADO E, '
      '  PAIS P'
      'WHERE '
      '  ( C.IDESTADO = E.IDESTADO) AND'
      '  ( E.IDPAIS = P.IDPAIS )'
      'ORDER BY C.NOME'
      '')
    ValidateWithMask = True
    Left = 601
    Top = 65535
    object qryCidadeNOMECIDADE: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 40
      FieldName = 'NOMECIDADE'
      Origin = 'CIDADES.NOME'
      Size = 50
    end
    object qryCidadeCODESTADO: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Origin = 'ESTADO.CODESTADO'
      Visible = False
      Size = 3
    end
    object qryCidadeIDCIDADES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCIDADES'
      Origin = 'CIDADES.IDCIDADES'
      Visible = False
    end
    object qryCidadeNOMEESTADO: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEESTADO'
      Origin = 'ESTADO.NOMEESTADO'
      Visible = False
      Size = 30
    end
    object qryCidadeIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Origin = 'PAIS.IDPAIS'
      Visible = False
    end
    object qryCidadeNOMEPAIS: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEPAIS'
      Origin = 'PAIS.NOMEPAIS'
      Visible = False
      Size = 30
    end
  end
  object dsCidade: TDataSource
    DataSet = qryCidade
    Left = 652
    Top = 65535
  end
  object dsCBanco: TwwDataSource
    DataSet = qryCBanco
    Left = 544
    Top = 61
  end
  object qryCBanco: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryCBancoBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CB.IDCBANCARIA,'
      '               CB.CONTACORRENTE,'
      '               CB.IDAGENCIA,'
      '               CB.FLGCONTAPREF,'
      '               CB.IDPESSOA,'
      '               CB.TIPOCONTA,'
      '               CB.FLGCONTACONJUNTA,'
      '               PA.NOME AS AGENCIA,'
      '               PB.NOME AS BANCO'
      'FROM    CONTABANCARIA CB, '
      '               PESSOA PA,'
      '               PESSOA PB, '
      '               AGENCIABANCARIA AB,'
      '               DEPENTIT D'
      'WHERE D.IDTITULAR   = :IDTITULAR'
      'AND       D.IDPESSOA    = CB.IDPESSOA      '
      'AND       CB.IDAGENCIA = AB.IDPESSOA '
      'AND       AB.IDPESSOA  = PA.IDPESSOA  '
      'AND       AB.IDBANCO    = PB.IDPESSOA '
      ''
      ''
      ''
      '')
    UpdateObject = updCBanco
    ControlType.Strings = (
      'FLGCONTAPREF;CheckBox;1;0'
      'FLGCONTACONJUNTA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 544
    Top = 45
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object updCBanco: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTABANCARIA'
      'set'
      '  CONTACORRENTE = :CONTACORRENTE,'
      '  IDAGENCIA = :IDAGENCIA,'
      '  FLGCONTAPREF = :FLGCONTAPREF,'
      '  IDPESSOA = :IDPESSOA,'
      '  TIPOCONTA = :TIPOCONTA,'
      '  FLGCONTACONJUNTA = :FLGCONTACONJUNTA'
      'where'
      '  IDCBANCARIA = :OLD_IDCBANCARIA')
    InsertSQL.Strings = (
      'insert into CONTABANCARIA'
      
        '  (IDCBANCARIA, CONTACORRENTE, IDAGENCIA, FLGCONTAPREF, IDPESSOA' +
        ', '
      'TIPOCONTA, '
      '   FLGCONTACONJUNTA)'
      'values'
      '  (:IDCBANCARIA, :CONTACORRENTE, :IDAGENCIA, :FLGCONTAPREF, '
      ':IDPESSOA, '
      '   :TIPOCONTA, :FLGCONTACONJUNTA)')
    DeleteSQL.Strings = (
      'delete from CONTABANCARIA'
      'where'
      '  IDCBANCARIA = :OLD_IDCBANCARIA')
    Left = 544
    Top = 77
  end
  object dsBenef: TwwDataSource
    DataSet = qryBenef
    Left = 600
    Top = 61
  end
  object qryBenef: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  BTP.IDPESSJUR,'
      '        D.IDTITULAR,'
      '        BTP.IDPLANOPREV,'
      '        D.IDPESSOA,'
      '        BTP.IDBENEFICIO,'
      '        BTP.SEQPROPOSTA,'
      '        BTP.IDDEPENRESPON,'
      '        BTP.IDRESPONSAVEL,'
      '        BTP.IDNUCLEOFAMILIAR,'
      '        BTP.PRIORIDADE,'
      '        BTP.PERCENTUAL,'
      '        B.NOME AS BENEFICIO,'
      '        PRES.NOME AS RESPONSAVEL,'
      '        DP.DESCRICAO'
      ''
      'FROM    PESSOA PRES,'
      '        BFCIARIOTITPLAN BTP,'
      '        PARTPREVPLAN PPP,'
      '        BENEFICIO B,'
      '        DEPENTIT D,'
      '        DEPEN DP'
      'WHERE   BTP.IDTITULAR     = :IDTITULAR'
      'AND     BTP.SEQPROPOSTA   = 1'
      'AND     BTP.IDPESSJUR     = PPP.IDPESSJUR'
      'AND     BTP.IDPLANOPREV   = PPP.IDPLANOPREV'
      'AND     BTP.IDTITULAR     = PPP.IDPESSOA'
      'AND     BTP.SEQPROPOSTA   = PPP.SEQPROPOSTA'
      'AND     BTP.IDPESSOA      = D.IDPESSOA'
      'AND     BTP.IDTITULAR     = D.IDTITULAR'
      'AND     BTP.IDBENEFICIO   = B.IDBENEFICIO'
      'AND     BTP.IDDEPENRESPON = DP.IDDEPENDENCIA(+)'
      'AND     BTP.IDRESPONSAVEL = PRES.IDPESSOA(+)'
      '')
    UpdateObject = updBenef
    ValidateWithMask = True
    Left = 600
    Top = 45
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object updBenef: TUpdateSQL
    ModifySQL.Strings = (
      'update BFCIARIOTITPLAN'
      'set'
      '  IDDEPENRESPON = :IDDEPENRESPON,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL,'
      '  IDNUCLEOFAMILIAR = :IDNUCLEOFAMILIAR,'
      '  PRIORIDADE = :PRIORIDADE,'
      '  PERCENTUAL = :PERCENTUAL'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    InsertSQL.Strings = (
      'insert into BFCIARIOTITPLAN'
      
        '  (IDPESSJUR, IDTITULAR, IDPLANOPREV, IDPESSOA, IDBENEFICIO, SEQ' +
        'PROPOSTA, '
      
        '   IDDEPENRESPON, IDRESPONSAVEL, IDNUCLEOFAMILIAR, PRIORIDADE, P' +
        'ERCENTUAL)'
      'values'
      
        '  (:IDPESSJUR, :IDTITULAR, :IDPLANOPREV, :IDPESSOA, :IDBENEFICIO' +
        ', :SEQPROPOSTA, '
      
        '   :IDDEPENRESPON, :IDRESPONSAVEL, :IDNUCLEOFAMILIAR, :PRIORIDAD' +
        'E, :PERCENTUAL)')
    DeleteSQL.Strings = (
      'delete from BFCIARIOTITPLAN'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 600
    Top = 77
  end
  object MSResp: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome')
    SensivelACaixa.Strings = (
      'S')
    Tabelas.Strings = (
      'PESSOA'
      'RESPONSAVEL')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'RESPONSAVEL.IDRESPONSAVEL'
      'PESSOA.NOME')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = RESPONSAVEL.IDRESPONSAVEL')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    OperComparador.Strings = (
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 246
    Top = 65535
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
    Left = 250
    Top = 132
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryBanco: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  B.IDPESSOA,'
      '  P.NOME AS BANCO,'
      '  B.NUMBANCO'
      'FROM'
      '  PESSOA P,  BANCO B'
      'WHERE'
      '  P.IDPESSOA = B.IDPESSOA'
      'ORDER BY '
      '  P.NOME ')
    ValidateWithMask = True
    Left = 533
    Top = 408
  end
  object qryAgencia: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT AB.IDPESSOA,'
      '               AG.NOME AS AGENCIA,'
      '               AB.NUMAGENCIA'
      'FROM     AGENCIABANCARIA AB,'
      '                PESSOA AG'
      'WHERE AB.IDBANCO = :IDBANCO'
      'AND       AB.IDPESSOA = AG.IDPESSOA'
      '')
    ValidateWithMask = True
    Left = 674
    Top = 271
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBANCO'
        ParamType = ptUnknown
      end>
  end
  object qrySitDependente: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITDEPENDENTE, '
      '       DESCRICAO'
      'FROM SITDEPENDENTE'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 722
    Top = 271
  end
  object DsNucleoFam: TwwDataSource
    AutoEdit = False
    DataSet = QryNucleoFam
    Left = 660
    Top = 61
  end
  object QryNucleoFam: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NF.IDNUCLEOFAMILIAR, '
      '  NF.IDRESPNUCLEO,'
      '  NF.IDTITULAR'
      'FROM'
      '  NUCLEOFAMILIAR NF'
      'WHERE'
      '  (NF.IDTITULAR = :IDTITULAR)'
      '')
    UpdateObject = UpdNucleoFam
    ValidateWithMask = True
    Left = 660
    Top = 45
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
    object QryNucleoFamResponsavel: TStringField
      DisplayLabel = 'Responsável pelo Núcleo Familiar'
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'Responsavel'
      LookupDataSet = QryResponsavel
      LookupKeyFields = 'IDRESPONSAVEL'
      LookupResultField = 'NOME'
      KeyFields = 'IDRESPNUCLEO'
      Size = 60
      Lookup = True
    end
    object QryNucleoFamIDNUCLEOFAMILIAR: TFloatField
      DisplayWidth = 15
      FieldName = 'IDNUCLEOFAMILIAR'
      Visible = False
    end
    object QryNucleoFamIDRESPNUCLEO: TFloatField
      DisplayWidth = 12
      FieldName = 'IDRESPNUCLEO'
      Visible = False
    end
    object QryNucleoFamIDTITULAR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTITULAR'
      Origin = 'NUCLEOFAMILIAR.IDTITULAR'
      Visible = False
    end
  end
  object UpdNucleoFam: TUpdateSQL
    ModifySQL.Strings = (
      'update NUCLEOFAMILIAR'
      'set'
      '  IDRESPNUCLEO = :IDRESPNUCLEO,'
      '  IDTITULAR = :IDTITULAR'
      'where'
      '  IDNUCLEOFAMILIAR = :OLD_IDNUCLEOFAMILIAR')
    InsertSQL.Strings = (
      'insert into NUCLEOFAMILIAR'
      '  (IDNUCLEOFAMILIAR, IDRESPNUCLEO, IDTITULAR)'
      'values'
      '  (:IDNUCLEOFAMILIAR, :IDRESPNUCLEO, :IDTITULAR)')
    DeleteSQL.Strings = (
      'delete from NUCLEOFAMILIAR'
      'where'
      '  IDNUCLEOFAMILIAR = :OLD_IDNUCLEOFAMILIAR')
    Left = 660
    Top = 77
  end
  object QryResponsavel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  RE.IDRESPONSAVEL, PS.NOME '
      'FROM '
      '  PESSOA PS,'
      '  RESPONSAVEL RE'
      'WHERE '
      ' RE.IDRESPONSAVEL = PS.IDPESSOA    ')
    ValidateWithMask = True
    Left = 90
    Top = 132
  end
  object QryBuscaNucleo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  NF.IDNUCLEOFAMILIAR, '
      '  NF.IDRESPNUCLEO, PS.NOME, '
      '  NF.IDTITULAR'
      'FROM'
      '  PESSOA PS,'
      '  NUCLEOFAMILIAR NF'
      'WHERE'
      '  (NF.IDTITULAR    = :IDTITULAR) AND'
      '  (NF.IDRESPNUCLEO = PS.IDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 457
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 703
    Top = 65535
  end
  object qryInsResponsavel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 720
    Top = 45
  end
  object dsInsResp: TwwDataSource
    AutoEdit = False
    DataSet = qryInsResponsavel
    Left = 720
    Top = 61
  end
  object UpdInsResp: TUpdateSQL
    Left = 720
    Top = 77
  end
  object RegraInscBenef: TRegra
    QueryIn = qryRegraInscBenef
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 322
    Top = 132
  end
  object qryRegraInscBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' P.IDPESSOA,D.DESCRICAO, D.IDDEPENDENCIA, PF.CODESTADO,'
      ' PF.DATAMORTE, PF.DATANASC, PF.ESTCIVIL, PF.FLGISENTOIRRF,'
      ' PF.IDFONTRECR, PF.IDGRINSTR, PF.IDPAIS, PF.IDPESSOA,'
      ' PF.IDPROFISS, PF.IDSINDICATO, PF.NOMEMAE, PF.NOMEPAI,'
      ' PF.NUMDEPIRRF, PF.NUMDEPSALF, PF.NUMDEPTOT, PF.SEXO,'
      ' PF.TIPOSANG, EP.CODCENTROCUSTO, EP.DATAADMISSAO,'
      ' EP.DATADEMISSAO, EP.DATAFIMAFAST, EP.DATAINICIOAFAST,'
      ' EP.IDCARGOEXT, EP.IDEMPRESAPROP, EP.IDESTAB, EP.IDPESSJUR,'
      ' EP.IDPESSOA, EP.IDSITFUNC, EP.MATRICULA, EP.NIVEL,'
      ' EP.PARTICIPASSIST, EP.PARTICIPPREVID, EP.SALTOTAL,'
      ' EP.TEMPONAOCREDITADO, EP.TEMPOSERVANTERIOR,'
      ' EP.TEMPOSERVANTREAL, EP.TEMPOSERVTOTAL,'
      ' EP.TEMPOSITESPECIAL, EP.VALORBASE1, EP.VALORBASE2,'
      ' EP.VALORBASE3, SF.FLGINTERNO SITFUNC, SP.FLGINTERNO SITPART,'
      ' :DTINSCRICAO AS DATAREF'
      'FROM'
      ' PESSOA P, PESSOAFISICA PF, DEPEN D, DEPENTIT DT,'
      ' ELEGPATRO EP, SITFUNC SF, PARTASS PA, SITPLANOASS SP'
      'WHERE'
      ' (P.IDPESSOA = :IDDEPENDENTE) AND'
      ' (PF.IDPESSOA = P.IDPESSOA) AND'
      ' (DT.IDTITULAR = :IDTITULAR) AND'
      ' (DT.IDDEPENDENCIA = D.IDDEPENDENCIA) AND'
      ' (DT.IDPESSOA = P.IDPESSOA) AND'
      ' (EP.IDPESSOA = DT.IDTITULAR) AND'
      ' (EP.IDSITFUNC = SF.IDSITFUNC) AND'
      ' (PA.IDPESSOA = DT.IDTITULAR) AND'
      ' (PA.IDPESSJUR = :IDPESSJUR) AND'
      ' (PA.IDPLANOPREV = :IDPLANOPREV) AND'
      ' (PA.IDPLANASS = :IDPLANASS) AND'
      ' (PA.IDSITPART = SP.IDSITPLANOASS)')
    ValidateWithMask = True
    Left = 410
    Top = 132
    ParamData = <
      item
        DataType = ftString
        Name = 'DTINSCRICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDDEPENDENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
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
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
  end
  object RegraCancBenef: TRegra
    QueryIn = qryRegraCancBenef
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 498
    Top = 132
  end
  object qryRegraCancBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' H.DATA, H.DATAPREVISAO, H.IDCONTASS, H.IDDEPENDENTE,'
      ' H.IDMOTIVO, H.IDPAGADOR, H.IDPESSJUR, H.IDPLANASS,'
      ' H.IDPLANOPREV, H.IDTITULAR, H.MES, H.MESCOBRANCA,'
      ' H.NUMRECEBIMENTO, H.SEQPROPOSTA, H.SITRECEBIMENTO,'
      ' H.VALORESPERADO, H.VALORRECEBIDO,'
      ' EL.DATAADMISSAO, EL.DATADEMISSAO, EL.DATAFIMAFAST,'
      ' EL.DATAINICIOAFAST, EL.IDEMPRESAPROP, EL.IDESTAB,'
      ' EL.IDSITFUNC, EL.MATRICULA, EL.NIVEL, EL.PARTICIPASSIST,'
      ' EL.PARTICIPPREVID, EL.SALTOTAL, PT.DATACANCELAMENTO,'
      ' PT.DATAENTRADA, PT.FLGINSCRICAOCANC, PT.FLGPARTBENEF,'
      ' PT.IDSITPART, PT.INSCRICAONUMERO, PT.INSCRICAOTIPO,'
      ' PL.IDFORNSERV, PL.IDPLANASS, PL.IDPRODASS, PF.DATAMORTE,'
      ' PF.DATANASC, PF.ESTCIVIL, PF.FLGISENTOIRRF, PF.IDFONTRECR,'
      ' PF.NUMDEPIRRF, PF.NUMDEPSALF, PF.NUMDEPTOT,'
      ' :CONTATRASO CONTATRASO'
      'FROM'
      ' HSTCONTRIBASS H, ELEGPATRO EL, PARTASS PT, PLANASS PL,'
      ' PESSOAFISICA PF'
      'WHERE'
      ' (H.IDPLANASS = :IDPLANASS) AND'
      ' (H.IDPESSJUR = :IDPESSJUR) AND'
      ' (H.IDTITULAR = :IDTITULAR) AND'
      ' (H.IDDEPENDENTE = :IDDEPENDENTE) AND'
      ' (H.IDPLANOPREV = :IDPLANOPREV) AND'
      ' (EL.IDPESSOA = H.IDTITULAR) AND'
      ' (EL.IDPESSJUR = H.IDPESSJUR) AND'
      ' (PT.SEQPROPOSTA = H.SEQPROPOSTA) AND'
      ' (PT.IDPESSJUR = H.IDPESSJUR) AND'
      ' (PT.IDPLANOPREV = H.IDPLANOPREV) AND'
      ' (PT.IDPLANASS = H.IDPLANASS) AND'
      ' (PT.IDPESSOA = H.IDTITULAR) AND'
      ' (PL.IDPLANASS = H.IDPLANASS) AND'
      ' (PF.IDPESSOA = H.IDDEPENDENTE)'
      ' ')
    ValidateWithMask = True
    Left = 594
    Top = 132
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CONTATRASO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
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
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object updBenefAss: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFASS'
      'set'
      '  TIPO = :TIPO,'
      '  RESPONSAVELPAG = :RESPONSAVELPAG,'
      '  FLGATIVO = :FLGATIVO,'
      '  PERCPAGMTO = :PERCPAGMTO,'
      '  DATAENTRADA = :DATAENTRADA,'
      '  DTCANCELAMENTO = :DTCANCELAMENTO,'
      '  OBSCANCEL = :OBSCANCEL'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANASS = :OLD_IDPLANASS and'
      '  IDDEPENDENTE = :OLD_IDDEPENDENTE and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    InsertSQL.Strings = (
      'insert into BENEFASS'
      '  (IDPESSJUR, IDTITULAR, IDPLANOPREV, IDPLANASS, IDDEPENDENTE, '
      'SEQPROPOSTA, '
      '   TIPO, RESPONSAVELPAG, FLGATIVO, PERCPAGMTO, DATAENTRADA, '
      'DTCANCELAMENTO, '
      '   OBSCANCEL)'
      'values'
      
        '  (:IDPESSJUR, :IDTITULAR, :IDPLANOPREV, :IDPLANASS, :IDDEPENDEN' +
        'TE, '
      ':SEQPROPOSTA, '
      
        '   :TIPO, :RESPONSAVELPAG, :FLGATIVO, :PERCPAGMTO, :DATAENTRADA,' +
        ' '
        ' :DTCANCELAMENTO, '
      '   :OBSCANCEL)')
    DeleteSQL.Strings = (
      'delete from BENEFASS'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANASS = :OLD_IDPLANASS and'
      '  IDDEPENDENTE = :OLD_IDDEPENDENTE and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 241
    Top = 77
  end
  object dsBenefAss: TwwDataSource
    DataSet = qryBenefAss
    Left = 241
    Top = 61
  end
  object qryBenefAss: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryEndPessBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDPESSJUR, IDTITULAR, IDPLANOPREV, IDPLANASS, IDDEPENDENT' +
        'E, SEQPROPOSTA,'
      
        '       TIPO, RESPONSAVELPAG, FLGATIVO, PERCPAGMTO, DATAENTRADA, ' +
        'DTCANCELAMENTO,'
      '       OBSCANCEL'
      'FROM BENEFASS'
      'WHERE IDPESSJUR    = :IDPESSJUR'
      '  AND IDTITULAR    = :IDTITULAR'
      '  AND IDPLANOPREV  = :IDPLANOPREV'
      '  AND IDPLANASS    = :IDPLANASS'
      '  AND SEQPROPOSTA  = :SEQPROPOSTA')
    UpdateObject = updBenefAss
    ValidateWithMask = True
    Left = 241
    Top = 45
    ParamData = <
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
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object qryContAss: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryEndPessBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDPLANASS, IDTITULAR, IDDEPENDENTE, IDPLANOPREV, IDPESSJU' +
        'R,'
      '       IDCONTASS, FLGATIVO, RECPAG, CODPORTFORMA, FLGCOBCARNE,'
      '       IDPAGADOR, SEQPROPOSTA'
      'FROM CONTASS'
      'WHERE IDPLANASS    = :IDPLANASS'
      '  AND IDPLANOPREV  = :IDPLANOPREV'
      '  AND IDPESSJUR    = :IDPESSJUR'
      '  AND IDTITULAR    = :IDTITULAR'
      '  AND SEQPROPOSTA  = :SEQPROPOSTA')
    UpdateObject = updContAss
    ValidateWithMask = True
    Left = 291
    Top = 45
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
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
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object dsContAss: TwwDataSource
    DataSet = qryContAss
    Left = 291
    Top = 61
  end
  object updContAss: TUpdateSQL
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
      
        '  (IDPLANASS, IDTITULAR, IDDEPENDENTE, IDPLANOPREV, IDPESSJUR, I' +
        'DCONTASS, '
      
        '   FLGATIVO, RECPAG, CODPORTFORMA, FLGCOBCARNE, IDPAGADOR, SEQPR' +
        'OPOSTA)'
      'values'
      
        '  (:IDPLANASS, :IDTITULAR, :IDDEPENDENTE, :IDPLANOPREV, :IDPESSJ' +
        'UR, :IDCONTASS, '
      
        '   :FLGATIVO, :RECPAG, :CODPORTFORMA, :FLGCOBCARNE, :IDPAGADOR, ' +
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
    Left = 291
    Top = 77
  end
  object qryNucleo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT N.IDRESPONSAVEL, C.CODPORTFORMA'
      'FROM NUCLEOFAMASS N, CONTASS C'
      'WHERE C.IDTITULAR = :IDTITULAR'
      '  AND C.IDPLANASS = :IDPLANASS'
      '  AND N.IDTITULAR = C.IDTITULAR'
      ''
      ' ')
    ValidateWithMask = True
    Left = 721
    Top = 324
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
  end
  object qryBfciario: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BT.IDTITULAR, BT.IDPESSJUR, BT.IDPLANOPREV,'
      '       BT.IDDEPENDENTE, BT.SEQPROPOSTA, BT.IDPLANASS, '
      '       BT.PERCENTUAL, '
      #9'   NVL(B.TOTALBENEF, 0) TOTALBENEF,'
      #9'   NVL(B.TOTALPERCENT, 0) TOTALPERCENT '
      'FROM BFCIARIOTITASS BT,'
      
        '     (SELECT COUNT(B.IDTITULAR) TOTALBENEF, SUM(B.PERCENTUAL) TO' +
        'TALPERCENT'
      '      FROM BFCIARIOTITASS B'
      '      WHERE B.IDTITULAR    = :IDTITULAR'
      '        AND B.IDPESSJUR    = :IDPESSJUR'
      '        AND B.IDPLANOPREV  = :IDPLANOPREV'
      '        AND B.IDPLANASS    = :IDPLANASS'
      '        AND B.SEQPROPOSTA  = :SEQPROPOSTA) B'
      'WHERE BT.IDTITULAR    = :IDTITULAR'
      '  AND BT.IDPESSJUR    = :IDPESSJUR'
      '  AND BT.IDPLANOPREV  = :IDPLANOPREV'
      '  AND BT.IDPLANASS    = :IDPLANASS'
      '  AND BT.SEQPROPOSTA  = :SEQPROPOSTA'
      ' '
      ' ')
    UpdateObject = updBfciario
    ValidateWithMask = True
    Left = 435
    Top = 45
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
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
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
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
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object dsBfciario: TwwDataSource
    AutoEdit = False
    DataSet = qryBfciario
    Left = 435
    Top = 61
  end
  object updBfciario: TUpdateSQL
    ModifySQL.Strings = (
      'update BFCIARIOTITASS'
      'set'
      '  PERCENTUAL = :PERCENTUAL'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDDEPENDENTE = :OLD_IDDEPENDENTE and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPLANASS = :OLD_IDPLANASS')
    InsertSQL.Strings = (
      'insert into BFCIARIOTITASS'
      
        '  (IDTITULAR, IDPESSJUR, IDPLANOPREV, IDDEPENDENTE, SEQPROPOSTA,' +
        ' IDPLANASS, '
      '   PERCENTUAL)'
      'values'
      
        '  (:IDTITULAR, :IDPESSJUR, :IDPLANOPREV, :IDDEPENDENTE, :SEQPROP' +
        'OSTA, :IDPLANASS, '
      '   :PERCENTUAL)')
    DeleteSQL.Strings = (
      'delete from BFCIARIOTITASS'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDDEPENDENTE = :OLD_IDDEPENDENTE and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPLANASS = :OLD_IDPLANASS')
    Left = 435
    Top = 77
  end
end
