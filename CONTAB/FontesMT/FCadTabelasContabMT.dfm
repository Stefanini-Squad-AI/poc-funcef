inherited frmCadTabelasContabMT: TfrmCadTabelasContabMT
  Left = 175
  Top = 43
  Caption = 'Cadastro de Tabelas da Contabilidade'
  ClientHeight = 554
  ClientWidth = 528
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 528
    Height = 468
    inherited pnlMestre: TPanel
      Width = 526
      Height = 160
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 94
        Height = 13
        Caption = 'Nome da Tabela'
      end
      object Label2: TLabel
        Left = 256
        Top = 16
        Width = 154
        Height = 13
        Caption = 'Campo do Plano de Contas'
      end
      object Label3: TLabel
        Left = 14
        Top = 98
        Width = 175
        Height = 13
        Caption = 'Tabela a que ela se Relaciona'
      end
      object Label4: TLabel
        Left = 254
        Top = 94
        Width = 211
        Height = 59
        AutoSize = False
        Caption = 
          'O Campo ao lado deve ser preenchido caso a Conta Contábil nessa ' +
          'Tabela não se relacione diretamente com a Tabela PLANOCONTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Image1: TImage
        Left = 248
        Top = 75
        Width = 16
        Height = 16
        AutoSize = True
        Picture.Data = {
          07544269746D6170F6000000424DF60000000000000076000000280000001000
          0000100000000100040000000000800000000000000000000000100000001000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00888888888888888888888888888888888888888778888888888888007888
          8888888880F07888888888880FF0777777788880FFF000000078880FFFFFFFFF
          F07880FFFFFFFFFFF078880FFFFFFFFFF0788880FFF00000008888880FF07888
          8888888880F07888888888888800888888888888888888888888888888888888
          8888}
      end
      object Label6: TLabel
        Left = 16
        Top = 58
        Width = 55
        Height = 13
        Caption = 'Exercício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 322
        Top = 56
        Width = 98
        Height = 13
        Caption = 'Data Atualização'
      end
      object Label10: TLabel
        Left = 168
        Top = 58
        Width = 110
        Height = 13
        Caption = 'A Partir do Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cboPlano: TComboBox
        Left = 256
        Top = 32
        Width = 209
        Height = 21
        ItemHeight = 13
        TabOrder = 0
      end
      object dblkTabelaRef: TwwDBLookupCombo
        Left = 16
        Top = 112
        Width = 225
        Height = 21
        AutoSize = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMETABELA'#9'25'#9'NOMETABELA')
        DataField = 'IDTABELAREF'
        DataSource = ds
        LookupTable = cdsTabelaRef
        LookupField = 'IDTABELADEPARA'
        DropDownWidth = 8
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object cboTabela: TwwDBLookupCombo
        Left = 16
        Top = 31
        Width = 225
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupTable = cdsTabelaContab
        LookupField = 'TABLE_NAME'
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnClick = cboTabelaClick
        OnExit = cboTabelaClick
      end
      object cbbExercicio: TComboBox
        Left = 16
        Top = 72
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        OnChange = cbbPeriodoChange
      end
      object cbbPeriodo: TComboBox
        Left = 168
        Top = 72
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 4
        OnChange = cbbPeriodoChange
      end
      object cbbDataAtualizacao: TComboBox
        Left = 320
        Top = 72
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 5
        OnChange = cbbDataAtualizacaoChange
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 161
      Width = 526
      Height = 306
      inherited pgctrlDetalhe: TPageControl
        Width = 428
        Height = 247
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 420
            Height = 219
            object Label5: TLabel
              Left = 16
              Top = 16
              Width = 144
              Height = 13
              Caption = 'Campo da Conta Contábil'
            end
            object cboConta: TComboBox
              Left = 16
              Top = 32
              Width = 281
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 420
            Height = 219
            Selected.Strings = (
              'NOMECAMPOCONTA'#9'46'#9'Nome do Campo da Conta Contábil'#9'F')
          end
        end
      end
      inherited Dock973: TDock97
        Width = 518
      end
      inherited Dock974: TDock97
        Left = 432
        Height = 247
      end
    end
  end
  inherited Dock972: TDock97
    Width = 528
  end
  inherited Dock971: TDock97
    Top = 515
    Width = 528
    inherited tb97Fundo: TToolbar97
      Left = 356
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 187
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 74
    Top = 399
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 15
  end
  inherited ImlPadrao: TImageList
    Left = 16
    Top = 399
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 448
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 324
    Top = 15
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TABELADEPARA.NOMETABELA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome da Tabela')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TABELADEPARA')
    CamposChave.Strings = (
      'TABELADEPARA.IDTABELADEPARA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '26')
    Left = 384
    Top = 15
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 116
    Top = 303
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 182
    Top = 303
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 109
    Top = 354
  end
  object cdsTabelaRef: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 141
    Top = 196
  end
  object cdsColunas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 229
    Top = 196
  end
  object cdsTabelaContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 301
    Top = 196
  end
  object cdsColunasDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 181
    Top = 354
  end
end
