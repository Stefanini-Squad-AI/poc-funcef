inherited FrmConfigRptPersonalisado: TFrmConfigRptPersonalisado
  Left = 369
  Top = 367
  Caption = 'Configuração de Relatório Com Tabela Personalisada'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited PnlImprime: TPanel
      inherited CmbModelo: TCMDBLookupCombo
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'Descrição'#9'F')
        LookupField = 'IDMODELOPERSONALISADO'
      end
    end
    inherited PnlCadastro: TPanel
      inherited DeRelatorio: TwwDBEdit
        DataField = 'DESCRICAO'
      end
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'MODELOPERSONALISADO.DESCRICAO')
    Descricao.Strings = (
      'Nome do Modelo')
    Tabelas.Strings = (
      'MODELOPERSONALISADO')
    CamposChave.Strings = (
      'MODELOPERSONALISADO.IDMODELOPERSONALISADO')
    Larguras.Strings = (
      '10')
  end
  inherited Sql: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  MODELOPERSONALISADO'
      'WHERE'
      '  (IDMODELOPERSONALISADO= :IDMODELOPERSONALISADO)')
  end
  inherited RptModelo: TppReport
    inherited ppDetailBand2: TppDetailBand
      mmHeight = 4763
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CODTIPDOC'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DEBCRE'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 19315
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'RECPAG'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 38894
        mmTop = 265
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 55033
        mmTop = 265
        mmWidth = 21167
        BandType = 4
      end
    end
  end
  inherited SqlModelo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  MODELOPERSONALISADO')
  end
  inherited SqlDados: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM TIPODOCRECPAG')
  end
end
