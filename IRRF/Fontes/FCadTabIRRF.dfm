inherited frmCadTabIRRF: TfrmCadTabIRRF
  Left = 226
  Top = 183
  Caption = 'Tabela do IRRF para Pessoas Físicas'
  ClientWidth = 378
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 378
    inherited dbGrd: TwwDBGrid [0]
      Width = 368
      Selected.Strings = (
        'FAIXA_IRRF'#9'15'#9'Faixa Final'
        'ALIQUOTA_IRRF'#9'10'#9'Alíquota'
        'PARCDEDUZIRRF'#9'15'#9'Parcela a Deduzir')
    end
    inherited pnlControles: TPanel [1]
      Width = 368
      object lblAliq: TLabel
        Left = 126
        Top = 78
        Width = 82
        Height = 13
        Caption = 'Alíquota IRRF'
      end
      object lblParcDeduz: TLabel
        Left = 126
        Top = 138
        Width = 102
        Height = 13
        Caption = 'Parcela a Deduzir'
      end
      object lblFaixaIni: TLabel
        Left = 126
        Top = 24
        Width = 62
        Height = 13
        Caption = 'Faixa Final'
      end
      object dbrAliqIRRF: TDBRealEdit
        Left = 126
        Top = 93
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'ALIQUOTA_IRRF'
        DataSource = ds
      end
      object dbrFaixaIni: TDBRealEdit
        Left = 126
        Top = 39
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '    900,00')
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'FAIXA_IRRF'
        DataSource = ds
      end
      object dbrParcDeduz: TDBRealEdit
        Left = 126
        Top = 152
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PARCDEDUZIRRF'
        DataSource = ds
      end
    end
  end
  inherited Dock972: TDock97
    Width = 378
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Width = 378
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select * from irrf')
    Left = 324
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update irrf'
      'set'
      '  FAIXA_IRRF = :FAIXA_IRRF,'
      '  ALIQUOTA_IRRF = :ALIQUOTA_IRRF,'
      '  PARCDEDUZIRRF = :PARCDEDUZIRRF,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO'
      'where'
      '  FAIXA_IRRF = :OLD_FAIXA_IRRF')
    InsertSQL.Strings = (
      'insert into irrf'
      
        '  (FAIXA_IRRF, ALIQUOTA_IRRF, PARCDEDUZIRRF, TRGDTINCLUSAO, TRGU' +
        'SERINCLUSAO)'
      'values'
      
        '  (:FAIXA_IRRF, :ALIQUOTA_IRRF, :PARCDEDUZIRRF, :TRGDTINCLUSAO, ' +
        ':TRGUSERINCLUSAO)')
    DeleteSQL.Strings = (
      'delete from irrf'
      'where'
      '  FAIXA_IRRF = :OLD_FAIXA_IRRF')
    Left = 285
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'IRRF.FAIXA_IRRF'
      'IRRF.ALIQUOTA_IRRF'
      'IRRF.PARCDEDUZIRRF')
    TipodeDado.Strings = (
      'N'
      'N'
      'N')
    Descricao.Strings = (
      'Faixa IRRF'
      'Aliquota IRRF'
      'Parcela ')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'IRRF')
    CamposChave.Strings = (
      'IRRF.FAIXA_IRRF')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10')
    Left = 300
    Top = 124
  end
  inherited ds: TwwDataSource
    Left = 246
    Top = 11
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 182
    Top = 114
  end
end
