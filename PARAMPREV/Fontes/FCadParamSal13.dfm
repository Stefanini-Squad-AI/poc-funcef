inherited FrmCadParamSal13: TFrmCadParamSal13
  Left = 339
  Top = 59
  HelpContext = 160135
  Caption = 'Parâmetros de Salário de 13º'
  ClientHeight = 427
  ClientWidth = 648
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 648
    Height = 341
    inherited pnlMestre: TPanel
      Width = 646
      Height = 84
      object lblPatro: TLabel
        Left = 16
        Top = 27
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object lblExercicio: TLabel
        Left = 387
        Top = 27
        Width = 55
        Height = 13
        Caption = 'Exercício'
      end
      object dblkpcmbPatrocinadora: TwwDBLookupCombo
        Left = 16
        Top = 42
        Width = 335
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME'#9'F')
        LookupTable = qryPatro
        LookupField = 'IDPESSOA'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblkpcmbPatrocinadoraChange
      end
      object wwDBSpinEdtexercicio: TwwDBSpinEdit
        Left = 387
        Top = 42
        Width = 121
        Height = 21
        Increment = 1
        MaxValue = 3000
        MinValue = 1900
        Value = 2001
        TabOrder = 1
        UnboundDataType = wwDefault
        OnChange = wwDBSpinEdtexercicioChange
        BeforeUpClick = wwDBSpinEdtexercicioBeforeUpClick
        BeforeDownClick = wwDBSpinEdtexercicioBeforeDownClick
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 85
      Width = 646
      Height = 255
      Tabs.Strings = (
        'Meses de Pagamento de 13º')
      inherited pgctrlDetalhe: TPageControl
        Width = 548
        Height = 196
        inherited tbsDet: TTabSheet
          Caption = 'Meses de Pagamento de 13º'
          inherited dbgrdDet: TwwDBGrid
            Width = 540
            Height = 168
            Selected.Strings = (
              'MESREFERENCIA'#9'7'#9'Mês Referência'
              'DESCRPROVDESC'#9'50'#9'Rubrica'#9'F'
              'NOMEREGRA'#9'60'#9'Regra')
          end
          inherited pnlControlesDet: TPanel
            Width = 540
            Height = 168
            object lblRubrica: TLabel
              Left = 4
              Top = 73
              Width = 45
              Height = 13
              Caption = 'Rubrica'
            end
            object lblRegra: TLabel
              Left = 4
              Top = 113
              Width = 35
              Height = 13
              Caption = 'Regra'
            end
            object grpMesAno: TGroupBox
              Left = 4
              Top = 7
              Width = 299
              Height = 59
              Caption = 'Informe o Mês e o Ano '
              TabOrder = 0
              object lblAnoMes: TLabel
                Left = 182
                Top = 15
                Width = 27
                Height = 13
                Caption = 'Ano '
              end
              object lblMes: TLabel
                Left = 8
                Top = 15
                Width = 24
                Height = 13
                Caption = 'Mês'
              end
              object seAno: TSpinEdit
                Left = 182
                Top = 31
                Width = 89
                Height = 22
                MaxValue = 3000
                MinValue = 1900
                TabOrder = 0
                Value = 2001
              end
              object cboxMes: TComboBox
                Left = 8
                Top = 31
                Width = 145
                Height = 21
                ItemHeight = 13
                TabOrder = 1
                Items.Strings = (
                  'Janeiro'
                  'Fevereiro'
                  'Março'
                  'Abril'
                  'Maio'
                  'Junho'
                  'Julho'
                  'Agosto'
                  'Setembro'
                  'Outubro'
                  'Novembro'
                  'Dezembro')
              end
            end
            object dblkpcmbRubrica: TwwDBLookupCombo
              Left = 3
              Top = 87
              Width = 526
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
              DataField = 'IDRUBRICA'
              DataSource = dsDet
              LookupTable = qryRubrica
              LookupField = 'IDRUBRICA'
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object dblkpcmbRegra: TwwDBLookupCombo
              Left = 3
              Top = 127
              Width = 526
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Nome Regra'#9'F')
              DataField = 'IDREGRA'
              DataSource = dsDet
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              TabOrder = 2
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 638
      end
      inherited Dock974: TDock97
        Left = 552
        Height = 196
      end
    end
  end
  inherited Dock972: TDock97
    Width = 648
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 388
    Width = 648
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 248
    Top = 10
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 571
    Top = 53
  end
  inherited ds: TwwDataSource
    Left = 394
    Top = 10
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMSAL13'
      'set'
      '  IDPESSJUR = :IDPESSJUR,'
      '  EXERCICIO = :EXERCICIO,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  IDREGRA = :IDREGRA'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  EXERCICIO = :OLD_EXERCICIO and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA')
    InsertSQL.Strings = (
      'insert into PARAMSAL13'
      '  (IDPESSJUR, EXERCICIO, MESREFERENCIA, IDRUBRICA, IDREGRA)'
      'values'
      '  (:IDPESSJUR, :EXERCICIO, :MESREFERENCIA, :IDRUBRICA, :IDREGRA)')
    DeleteSQL.Strings = (
      'delete from PARAMSAL13'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  EXERCICIO = :OLD_EXERCICIO and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA')
    Left = 362
    Top = 10
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME'
      'PARAMSAL13.EXERCICIO')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Patrocinadora'
      'Exercício')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PARAMSAL13')
    CamposChave.Strings = (
      'PARAMSAL13.IDPESSJUR'
      'PARAMSAL13.EXERCICIO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = PARAMSAL13.IDPESSJUR')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '10')
    Left = 451
    Top = 10
  end
  inherited ImlPadrao: TImageList
    Left = 289
    Top = 10
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT IDPESSJUR,'
      '               EXERCICIO,'
      '               MESREFERENCIA,'
      '               IDRUBRICA,'
      '              IDREGRA'
      'FROM  PARAMSAL13'
      'WHERE  IDPESSJUR  = :IDPESSJUR AND'
      '                EXERCICIO = :EXERCICIO')
    Left = 329
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EXERCICIO'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 479
    Top = 46
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDRUBRICA,'
      '        IDPESSOA,'
      '        CODPROVDESC,'
      '        DESCRPROVDESC'
      'FROM RUBRICAXPESS'
      'WHERE IDPESSOA  = :idpessjur'
      'ORDER BY  DESCRPROVDESC'
      ' ')
    ValidateWithMask = True
    Left = 541
    Top = 143
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpessjur'
        ParamType = ptUnknown
      end>
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        IDREGRA,'
      '        NOMEREGRA,'
      '        IDTIPOREGRA,'
      '        DESCRICAOREGRA,'
      '        PUBLICADA'
      'FROM REGRA'
      'ORDER BY NOMEREGRA'
      ' ')
    ValidateWithMask = True
    Left = 541
    Top = 175
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PATRO.IDPESSOA, P.NOME'
      'FROM PESSOA P, PATRO PATRO'
      'WHERE P.IDPESSOA = PATRO.IDPESSOA'
      'AND   PATRO.IDFUNDACAO =:IDFUNDACAO'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 614
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object dsPatro: TwwDataSource
    DataSet = qryPatro
    Left = 535
    Top = 9
  end
  object dsrubrica: TwwDataSource
    DataSet = qryRubrica
    Left = 573
    Top = 143
  end
  object dsRegra: TwwDataSource
    DataSet = qryRegra
    Left = 573
    Top = 175
  end
  object qryDet: TwwQuery
    Tag = 5
    CachedUpdates = True
    AfterPost = qryDetAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PS.IDPESSJUR,'
      '       PS.EXERCICIO,'
      '       PS.MESREFERENCIA,'
      '       PS.IDRUBRICA,'
      '       PS.IDREGRA,'
      '       P.NOME,'
      '       R.DESCRPROVDESC,'
      '       RE.NOMEREGRA'
      'FROM PESSOA P ,  PARAMSAL13 PS , RUBRICAXPESS R, REGRA RE'
      'WHERE   IDPESSJUR  = :IDPESSJUR AND'
      '        EXERCICIO = :EXERCICIO AND       '
      '        P.IDPESSOA = PS.IDPESSJUR AND       '
      '        PS.IDRUBRICA = R.IDRUBRICA AND       '
      '        R.IDPESSOA = PS.IDPESSJUR AND       '
      '        PS.IDREGRA = RE.IDREGRA(+)       '
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 537
    Top = 53
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'EXERCICIO'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMSAL13'
      'set'
      '  IDRUBRICA = :IDRUBRICA,'
      '  IDREGRA = :IDREGRA'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  EXERCICIO = :OLD_EXERCICIO and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA'
      ' ')
    InsertSQL.Strings = (
      'insert into PARAMSAL13'
      '  (IDPESSJUR, EXERCICIO, MESREFERENCIA, IDRUBRICA, IDREGRA)'
      'values'
      '  (:IDPESSJUR, :EXERCICIO, :MESREFERENCIA, :IDRUBRICA, :IDREGRA)')
    DeleteSQL.Strings = (
      'delete from PARAMSAL13'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  EXERCICIO = :OLD_EXERCICIO and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA')
    Left = 571
    Top = 84
  end
end
