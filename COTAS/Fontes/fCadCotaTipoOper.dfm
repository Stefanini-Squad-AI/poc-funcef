inherited frmCadCotatipooper: TfrmCadCotatipooper
  Left = 262
  Top = 196
  HelpContext = 545020
  Caption = 'Receitas e Despesas Para Lançamento Manual'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited dbGrd: TwwDBGrid [0]
      Selected.Strings = (
        'DESCTIPOOPER'#9'45'#9'Descricão'
        'FLGCOTA'#9'10'#9'Rentabiliza /~Cotiza'
        'RECDES'#9'8'#9'Receitas /~Despesas'#9'F')
      Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
      TitleAlignment = taCenter
      TitleLines = 2
    end
    inherited pnlControles: TPanel [1]
      object Label1: TLabel
        Left = 72
        Top = 34
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object edDescricao: TwwDBEdit
        Left = 72
        Top = 48
        Width = 337
        Height = 21
        DataField = 'DESCTIPOOPER'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object rdDescReceita: TDBRadioGroup
        Left = 248
        Top = 80
        Width = 161
        Height = 73
        DataField = 'RECDES'
        DataSource = ds
        Items.Strings = (
          'Aumenta'
          'Diminui')
        TabOrder = 2
        Values.Strings = (
          'R'
          'D')
      end
      object rdDescCota: TDBRadioGroup
        Left = 72
        Top = 80
        Width = 161
        Height = 73
        DataField = 'FLGCOTA'
        DataSource = ds
        Items.Strings = (
          'Rentabiliza'
          'Cotiza')
        TabOrder = 1
        Values.Strings = (
          'R'
          'C')
      end
    end
  end
  inherited Dock972: TDock97
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 938
    Top = 15
  end
  inherited ds: TwwDataSource
    Left = 248
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 888
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 320
    Top = 24
  end
  inherited Cds: TCMClientDataSet
    Left = 280
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Tabelas.Strings = (
      '')
    Left = 368
    Top = 0
  end
end
