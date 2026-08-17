inherited frmCadFilial: TfrmCadFilial
  Left = 196
  Top = 307
  HelpContext = 160127
  Caption = 'Filial'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited tbcDetalhe: TTabControlDetalhe
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Geral')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        '')
      inherited pgctrlDetalhe: TPageControl
        ActivePage = tbsGeral
        object tbsGeral: TTabSheet
          Caption = 'Filial'
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 696
            Height = 251
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object lblNumFilial: TLabel
              Left = 17
              Top = 14
              Width = 92
              Height = 13
              Caption = 'Número da Filial'
            end
            object lblSigla: TLabel
              Left = 17
              Top = 56
              Width = 77
              Height = 13
              Caption = 'Sigla da Filial'
            end
            object dbedNumFilial: TDBEdit
              Left = 17
              Top = 30
              Width = 154
              Height = 21
              DataField = 'NUMFILIAL'
              DataSource = dsSubTipo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object RgTipo: TDBRadioGroup
              Left = 17
              Top = 100
              Width = 181
              Height = 38
              Caption = ' Tipo '
              Columns = 2
              DataField = 'FLGTIPO'
              DataSource = dsSubTipo
              Items.Strings = (
                '&Interior'
                '&Capital')
              TabOrder = 1
              Values.Strings = (
                'I'
                'C')
            end
            object dbeSigla: TwwDBEdit
              Left = 17
              Top = 72
              Width = 154
              Height = 21
              DataField = 'SIGLA'
              DataSource = dsSubTipo
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object DBRadioGroup1: TDBRadioGroup
              Left = 17
              Top = 142
              Width = 181
              Height = 38
              Columns = 2
              DataField = 'FLGATIVO'
              DataSource = dsSubTipo
              Items.Strings = (
                'Ativa'
                'Desativada')
              TabOrder = 3
              Values.Strings = (
                'S'
                'N')
            end
          end
        end
      end
    end
    inherited pnlMestre: TPanel
      inherited lblDocumento: TLabel
        Width = 26
        Caption = 'CGC'
      end
      inherited lblEMail: TLabel
        Left = 444
      end
      inherited lblPdGrupo: TLabel
        Left = 444
        Width = 134
        Caption = 'Grupo ( Patrocinadora )'
      end
      inherited LblHomePage_Padrao: TLabel
        Left = 577
      end
      inherited dbedemail: TwwDBEdit
        Left = 444
      end
      inherited edDBGrupo: TwwDBEdit
        Left = 444
        TabOrder = 6
      end
      inherited DbeHomePage_Padrao: TwwDBEdit
        Left = 577
        Width = 124
      end
      object DBEdit1: TDBEdit
        Left = 703
        Top = 23
        Width = 77
        Height = 21
        Color = clSilver
        DataField = 'IDPESSOA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'FILIALPESSOA.NUMFILIAL'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome da Filial')
    SensivelACaixa.Strings = (
      'S'
      'C')
    Tabelas.Strings = (
      'FILIALPESSOA'
      'PESSOA')
    CamposChave.Strings = (
      'FILIALPESSOA.IDFILIALPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = FILIALPESSOA.IDFILIALPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '60')
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 358
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 332
    Top = 58
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update FILIALPESSOA'
      'set'
      '  IDFILIALPESSOA = :IDFILIALPESSOA,'
      '  NUMFILIAL = :NUMFILIAL,'
      '  FLGATIVO = :FLGATIVO,'
      '  FLGTIPO = :FLGTIPO,'
      '  SIGLA = :SIGLA'
      'where'
      '  IDFILIALPESSOA = :OLD_IDFILIALPESSOA')
    InsertSQL.Strings = (
      'insert into FILIALPESSOA'
      '  (IDFILIALPESSOA, NUMFILIAL, FLGATIVO, FLGTIPO, SIGLA)'
      'values'
      '  (:IDFILIALPESSOA, :NUMFILIAL, :FLGATIVO, :FLGTIPO, :SIGLA)')
    DeleteSQL.Strings = (
      'delete from FILIALPESSOA'
      'where'
      '  IDFILIALPESSOA = :OLD_IDFILIALPESSOA')
    Left = 415
    Top = 439
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'SELECT FILIALPESSOA.'
      '               IDFILIALPESSOA,'
      '               NUMFILIAL,'
      '               FLGATIVO,'
      '               FLGTIPO,'
      '              SIGLA'
      'FROM FILIALPESSOA'
      'WHERE ( FILIALPESSOA.IDFILIALPESSOA =  :IdPessoa )')
    Left = 416
    Top = 437
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
    object qrySubTipoIDFILIALPESSOA: TFloatField
      FieldName = 'IDFILIALPESSOA'
      Origin = 'FILIALPESSOA.IDFILIALPESSOA'
    end
    object qrySubTipoNUMFILIAL: TStringField
      FieldName = 'NUMFILIAL'
      Origin = 'FILIALPESSOA.NUMFILIAL'
      Size = 15
    end
    object qrySubTipoFLGATIVO: TStringField
      FieldName = 'FLGATIVO'
      Origin = 'FILIALPESSOA.FLGATIVO'
      Size = 1
    end
    object qrySubTipoFLGTIPO: TStringField
      FieldName = 'FLGTIPO'
      Origin = 'FILIALPESSOA.FLGTIPO'
      Size = 1
    end
    object qrySubTipoSIGLA: TStringField
      FieldName = 'SIGLA'
      Origin = 'FILIALPESSOA.SIGLA'
      Size = 15
    end
  end
  inherited updPessoaFisica: TUpdateSQL
    Left = 757
    Top = 46
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 317
    Top = 124
  end
  inherited Pessoa: TPessoa
    SubTipo = stFilial
  end
  inherited MSGrupo: TMontaSelect
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PATRO')
    Filtro.Strings = (
      'PESSOA.TIPO = '#39'J'#39
      'PESSOA.IDPESSOA = PATRO.IDPESSOA')
    Left = 682
    Top = 8
  end
  inherited qryNaturalidade_Padrao: TwwQuery
    Left = 527
    Top = 161
  end
  inherited DsNaturalidade_Padrao: TwwDataSource
    Left = 640
    Top = 180
  end
end
