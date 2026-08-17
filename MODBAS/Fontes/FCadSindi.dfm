inherited frmCadSindi: TfrmCadSindi
  Left = 0
  Top = 28
  Caption = 'Sindicato'
  ClientHeight = 516
  ClientWidth = 793
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 793
    Height = 430
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 783
      Height = 315
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Dados do Sindicato'
        'Alíquotas')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        ''
        'dbgAliquotas')
      inherited pgctrlDetalhe: TPageControl
        Width = 685
        Height = 256
        ActivePage = tbsSindi
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 677
            Height = 228
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 677
            Height = 228
            inherited pnlItemsDoc: TPanel
              Height = 226
            end
            inherited pnlFoto: TPanel
              Width = 187
              Height = 226
              Visible = False
              inherited Bevel1: TBevel
                Height = 195
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 195
                Width = 187
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 185
                Height = 195
              end
            end
            inherited lstDocumentos: TListView
              Height = 226
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 677
            Height = 228
            inherited grpTipoEnd: TGroupBox
              Left = 480
              Height = 228
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 677
            Height = 228
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited dbgTelefone: TwwDBGrid
            Width = 677
            Height = 228
          end
          inherited Panel1: TPanel
            Width = 677
            Height = 228
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Width = 677
            Height = 228
          end
          inherited dbgContato: TwwDBGrid
            Width = 677
            Height = 228
          end
        end
        object tbsSindi: TTabSheet
          Caption = 'Dados do Sindicato'
          ImageIndex = 4
          object Label2: TLabel
            Left = 125
            Top = 15
            Width = 132
            Height = 13
            Caption = 'Mês Base da Categoria'
          end
          object Label13: TLabel
            Left = 125
            Top = 81
            Width = 174
            Height = 13
            Caption = 'Registro Ministério doTrabalho'
          end
          object Label14: TLabel
            Left = 125
            Top = 48
            Width = 147
            Height = 13
            Caption = 'Piso Salarial da Categoria'
          end
          object Label15: TLabel
            Left = 125
            Top = 114
            Width = 186
            Height = 13
            Caption = 'Mês da Contribuição Empresarial'
          end
          object Label17: TLabel
            Left = 125
            Top = 147
            Width = 198
            Height = 13
            Caption = 'Índice da Contribuição Empresarial'
          end
          object speMes: TwwDBSpinEdit
            Left = 335
            Top = 12
            Width = 50
            Height = 21
            Increment = 1
            MaxValue = 12
            MinValue = 1
            DataField = 'MESBASE'
            DataSource = dsSubTipo
            TabOrder = 0
            UnboundDataType = wwDefault
            OnChange = speMesChange
          end
          object dbedPiso: TwwDBEdit
            Left = 335
            Top = 45
            Width = 166
            Height = 21
            DataField = 'PISOSALARIAL'
            DataSource = dsSubTipo
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedMT: TwwDBEdit
            Left = 335
            Top = 78
            Width = 166
            Height = 21
            DataField = 'REGISTROMT'
            DataSource = dsSubTipo
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object edNomeMes: TEdit
            Left = 392
            Top = 12
            Width = 109
            Height = 21
            TabStop = False
            Color = clGray
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object speMesContr: TwwDBSpinEdit
            Left = 335
            Top = 111
            Width = 50
            Height = 21
            Increment = 1
            MaxValue = 12
            MinValue = 1
            DataField = 'MESCONTRIBUICAO'
            DataSource = dsSubTipo
            TabOrder = 4
            UnboundDataType = wwDefault
            OnChange = speMesContrChange
          end
          object edNomeMes2: TEdit
            Left = 392
            Top = 111
            Width = 109
            Height = 21
            TabStop = False
            Color = clGray
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object wwDBLookupCombo1: TwwDBLookupCombo
            Left = 335
            Top = 144
            Width = 166
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOEDESC'#9'20'#9'MOEDESC')
            DataField = 'MOECODIGO'
            DataSource = dsSubTipo
            LookupTable = qryMoeda
            LookupField = 'MOECODIGO'
            TabOrder = 6
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
        end
        object tbshAliquotas: TTabSheet
          Caption = 'Alíquotas'
          ImageIndex = 5
          object dbgAliquotas: TwwDBGrid
            Left = 0
            Top = 0
            Width = 677
            Height = 228
            Selected.Strings = (
              'IDFAIXAALIQSIND'#9'10'#9'Número da Faixa'
              'VALLIMITEFAIXA'#9'10'#9'Valor Limite da Faixa'
              'TAXADAFAIXA'#9'10'#9'Alíquota Desta Faixa')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAliq
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
        end
      end
      inherited Dock973: TDock97
        Width = 775
      end
      inherited Dock974: TDock97
        Left = 689
        Height = 256
      end
    end
    inherited pnlMestre: TPanel
      Width = 783
    end
  end
  inherited Dock972: TDock97
    Width = 793
  end
  inherited Dock971: TDock97
    Top = 477
    Width = 793
  end
  inherited qry: TwwQuery
    Left = 366
    Top = 1
  end
  inherited dsDet: TwwDataSource
    Left = 422
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 572
    Top = 2
  end
  inherited upd: TUpdateSQL
    Left = 338
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Sindicato'
    Colunas.Strings = (
      'PESSOA.NOME'
      'SINDICATO.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Nome'
      'Código')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'SINDICATO')
    CamposChave.Strings = (
      'SINDICATO.IDPESSOA')
    Filtro.Strings = (
      'SINDICATO.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '22')
    Left = 508
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 394
    Top = 1
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update SINDICATO'
      'set'
      '  MESBASE = :MESBASE,'
      '  MOECODIGO = :MOECODIGO,'
      '  REGISTROMT = :REGISTROMT,'
      '  PISOSALARIAL = :PISOSALARIAL,'
      '  MESCONTRIBUICAO = :MESCONTRIBUICAO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into SINDICATO'
      '  (IDPESSOA, MESBASE, MOECODIGO, REGISTROMT, PISOSALARIAL, '
      'MESCONTRIBUICAO)'
      'values'
      '  (:IDPESSOA, :MESBASE, :MOECODIGO, :REGISTROMT, :PISOSALARIAL, '
      ':MESCONTRIBUICAO)')
    DeleteSQL.Strings = (
      'delete from SINDICATO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 553
    Top = 297
  end
  inherited qrySubTipo: TwwQuery
    AfterScroll = qrySubTipoAfterScroll
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  SINDICATO'
      'WHERE'
      '  (IDPESSOA = :IDPESSOA)')
    UpdateMode = upWhereKeyOnly
    Left = 553
    Top = 311
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
  end
  inherited dsSubTipo: TwwDataSource
    Left = 553
    Top = 325
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 657
    Top = 183
  end
  inherited updPessoaFisica: TUpdateSQL
    Left = 657
    Top = 170
  end
  inherited qryPessoaFisica: TwwQuery
    UpdateMode = upWhereKeyOnly
    Left = 657
    Top = 156
  end
  inherited qryTelefone: TwwQuery
    Left = 545
    Top = 217
  end
  inherited dsEndereco: TwwDataSource
    Left = 114
    Top = 424
  end
  inherited updEndereco: TUpdateSQL
    Left = 63
    Top = 424
  end
  inherited qryContato: TwwQuery
    Left = 12
    Top = 424
  end
  inherited updContato: TUpdateSQL
    Left = 89
    Top = 424
  end
  inherited dsContato: TwwDataSource
    Left = 140
    Top = 424
  end
  inherited qryRamal: TwwQuery
    Left = 73
    Top = 339
  end
  inherited updRamal: TUpdateSQL
    Left = 37
    Top = 424
  end
  inherited dsRamal: TwwDataSource
    Left = 165
    Top = 424
  end
  inherited qryDocumento: TwwQuery
    Left = 641
    Top = 413
  end
  inherited updDocumento: TUpdateSQL
    Left = 193
    Top = 279
  end
  inherited qryEscolhePessoa: TwwQuery
    Left = 57
    Top = 270
  end
  inherited Pessoa: TPessoa
    SubTipo = stSindicato
    MostraFoto = False
    OnChangeSubtipo = PessoaChangeSubtipo
    OnSaveSubtipo = PessoaSaveSubtipo
    Left = 458
    Top = 1
  end
  inherited qryImagem: TwwQuery
    Left = 191
    Top = 424
  end
  inherited updImagem: TUpdateSQL
    Left = 216
    Top = 424
  end
  inherited updImagensDoc: TUpdateSQL
    Left = 121
    Top = 281
  end
  inherited qryImagensDoc: TwwQuery
    Left = 545
    Top = 416
  end
  inherited dsImagem: TwwDataSource
    Left = 242
    Top = 424
  end
  inherited MSGrupo: TMontaSelect
    Left = 626
    Top = 0
  end
  inherited qryEstado: TwwQuery
    Left = 473
    Top = 420
  end
  inherited qryCidade: TwwQuery
    Left = 417
    Top = 425
  end
  inherited qryNaturalidade_Padrao: TwwQuery
    Left = 327
    Top = 417
  end
  inherited DsNaturalidade_Padrao: TwwDataSource
    Left = 327
    Top = 404
  end
  object dsAliq: TwwDataSource
    DataSet = qryAliq
    Left = 571
    Top = 177
  end
  object qryAliq: TwwQuery
    CachedUpdates = True
    AfterInsert = qryAliqAfterInsert
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT * '
      'FROM'
      '    Aliquotasind '
      'WHERE'
      '    (IDSINDICATO =:IdPessoa)')
    UpdateMode = upWhereKeyOnly
    UpdateObject = updAliq
    ValidateWithMask = True
    Left = 571
    Top = 163
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
    object qryAliqIDFAIXAALIQSIND: TFloatField
      DisplayLabel = 'Número da Faixa'
      DisplayWidth = 10
      FieldName = 'IDFAIXAALIQSIND'
      Origin = 'ALIQUOTASIND.IDFAIXAALIQSIND'
    end
    object qryAliqVALLIMITEFAIXA: TFloatField
      DisplayLabel = 'Valor Limite da Faixa'
      DisplayWidth = 10
      FieldName = 'VALLIMITEFAIXA'
      Origin = 'ALIQUOTASIND.VALLIMITEFAIXA'
    end
    object qryAliqTAXADAFAIXA: TFloatField
      DisplayLabel = 'Alíquota Desta Faixa'
      DisplayWidth = 10
      FieldName = 'TAXADAFAIXA'
      Origin = 'ALIQUOTASIND.TAXADAFAIXA'
    end
    object qryAliqIDSINDICATO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSINDICATO'
      Origin = 'ALIQUOTASIND.IDSINDICATO'
      Visible = False
    end
  end
  object updAliq: TUpdateSQL
    ModifySQL.Strings = (
      'update Aliquotasind'
      'set'
      '  IDFAIXAALIQSIND = :IDFAIXAALIQSIND,'
      '  VALLIMITEFAIXA = :VALLIMITEFAIXA,'
      '  TAXADAFAIXA = :TAXADAFAIXA,'
      '  IDSINDICATO = :IDSINDICATO'
      'where'
      '  IDFAIXAALIQSIND = :OLD_IDFAIXAALIQSIND and'
      '  VALLIMITEFAIXA = :OLD_VALLIMITEFAIXA and'
      '  TAXADAFAIXA = :OLD_TAXADAFAIXA and'
      '  IDSINDICATO = :OLD_IDSINDICATO')
    InsertSQL.Strings = (
      'insert into Aliquotasind'
      '  (IDFAIXAALIQSIND, VALLIMITEFAIXA, TAXADAFAIXA, IDSINDICATO)'
      'values'
      
        '  (:IDFAIXAALIQSIND, :VALLIMITEFAIXA, :TAXADAFAIXA, :IDSINDICATO' +
        ')')
    DeleteSQL.Strings = (
      'delete from Aliquotasind'
      'where'
      '  IDFAIXAALIQSIND = :OLD_IDFAIXAALIQSIND and'
      '  VALLIMITEFAIXA = :OLD_VALLIMITEFAIXA and'
      '  TAXADAFAIXA = :OLD_TAXADAFAIXA and'
      '  IDSINDICATO = :OLD_IDSINDICATO')
    Left = 571
    Top = 149
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select MOECODIGO, MOEDESC from MOEDA order by MOEDESC')
    ValidateWithMask = True
    Left = 617
    Top = 238
  end
end
