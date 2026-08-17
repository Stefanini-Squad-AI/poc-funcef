inherited frmCadAntec13: TfrmCadAntec13
  Left = 60
  Top = 169
  HelpContext = 210071
  Caption = 'Registro e Histórico de Antecipações do Décimo Terceiro Salário'
  ClientHeight = 332
  ClientWidth = 666
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 666
    Height = 246
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 658
      Height = 34
      object Label1: TLabel
        Left = 7
        Top = 9
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label10: TLabel
        Left = 162
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object dbtxtSituacao: TDBText
        Left = 568
        Top = 8
        Width = 78
        Height = 21
        Alignment = taCenter
        DataField = 'SITUACAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbedMat: TwwDBEdit
        Left = 67
        Top = 7
        Width = 84
        Height = 21
        Color = clGray
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedNome: TwwDBEdit
        Left = 199
        Top = 7
        Width = 361
        Height = 21
        Color = clGray
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 38
      Width = 658
      Height = 204
      Tabs.Strings = (
        'Antecipações')
      inherited pgctrlDetalhe: TPageControl
        Width = 560
        Height = 145
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 552
            Height = 117
            ControlType.Strings = (
              'FLGOCORRIDA;CheckBox;1;0')
            Selected.Strings = (
              'MES'#9'10'#9'Mês de Referência'
              'ANO'#9'10'#9'Ano de Referência'
              'FLGOCORRIDA'#9'10'#9'Já Processada?')
            Font.Style = []
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 552
            Height = 117
            object Label15: TLabel
              Left = 118
              Top = 20
              Width = 117
              Height = 13
              Caption = 'Mês da Antecipação'
            end
            object Label3: TLabel
              Left = 118
              Top = 52
              Width = 107
              Height = 13
              Caption = 'Ano de Referência'
            end
            object speAnoAntec: TwwDBSpinEdit
              Left = 256
              Top = 49
              Width = 62
              Height = 21
              Increment = 1
              DataField = 'ANO'
              DataSource = dsDet
              TabOrder = 0
              UnboundDataType = wwDefault
            end
            object speMesAntec: TwwDBSpinEdit
              Left = 256
              Top = 17
              Width = 62
              Height = 21
              Increment = 1
              DataField = 'MES'
              DataSource = dsDet
              MaxLength = 2
              TabOrder = 1
              UnboundDataType = wwDefault
              OnChange = speMesAntecChange
            end
            object dbrgProc: TDBRadioGroup
              Left = 116
              Top = 79
              Width = 324
              Height = 35
              Caption = 'Antecipação Já Processada?'
              Columns = 2
              DataField = 'FLGOCORRIDA'
              DataSource = dsDet
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 2
              Values.Strings = (
                '1'
                '0')
              OnChange = dbrgProcChange
            end
            object edNomeMes: TEdit
              Left = 330
              Top = 18
              Width = 109
              Height = 21
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 650
      end
      inherited Dock974: TDock97
        Left = 564
        Height = 145
      end
    end
  end
  inherited Dock972: TDock97
    Width = 666
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 293
    Width = 666
    inherited tb97Fundo: TToolbar97
      Left = 496
      DockPos = 504
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 329
      DockPos = 337
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 576
    Top = 15
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 576
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    Left = 501
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Empregado'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'CARGO')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDCARGO      = CARGO.IDCARGO'
      'FUNCIONARIO.IDPESSOA    = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40')
    ExibePergunta = False
    Left = 416
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 501
    Top = 1
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    OnDataChange = dsDetDataChange
    Left = 353
    Top = 1
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'ANO'
        DataType = ftFloat
      end
      item
        Name = 'MES'
        DataType = ftFloat
      end
      item
        Name = 'FLGOCORRIDA'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'CdsDetIndex'
        DescFields = 'ANO;MES'
        Fields = 'ANO;MES'
        Options = [ixDescending]
      end>
    IndexName = 'CdsDetIndex'
    Params = <>
    StoreDefs = True
    BeforeInsert = CdsDetBeforeInsert
    AfterInsert = CdsDetAfterInsert
    Left = 319
    Top = 1
  end
end
