inherited FrmCadParamSal13: TFrmCadParamSal13
  Left = 28
  Top = 102
  Caption = 'Cadastro de Parâmetro para 13º Salário'
  ClientWidth = 708
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 708
    inherited pnlMestre: TPanel
      Width = 698
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
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 89
      Width = 698
      Height = 244
      inherited pgctrlDetalhe: TPageControl
        Width = 600
        Height = 185
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 592
            Height = 157
            Selected.Strings = (
              'EXERCICIO'#9'10'#9'Exercício'
              'MESREFERENCIA'#9'7'#9'Mês Referência'
              'NOME'#9'60'#9'Patrocinadora'
              'DESCRPROVDESC'#9'80'#9'Rubrica'#9'F'
              'NOMEREGRA'#9'60'#9'Regra')
          end
          inherited pnlControlesDet: TPanel
            Width = 592
            Height = 157
            object lblRubrica: TLabel
              Left = 9
              Top = 73
              Width = 45
              Height = 13
              Caption = 'Rubrica'
            end
            object lblRegra: TLabel
              Left = 9
              Top = 113
              Width = 35
              Height = 13
              Caption = 'Regra'
            end
            object grpMesAno: TGroupBox
              Left = 8
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
                MinValue = 2000
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
              Left = 8
              Top = 87
              Width = 577
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
              Left = 8
              Top = 127
              Width = 577
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
        Width = 690
      end
      inherited Dock974: TDock97
        Left = 604
        Height = 185
      end
    end
  end
  inherited Dock972: TDock97
    Width = 708
  end
  inherited Dock971: TDock97
    Width = 708
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
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 571
    Top = 53
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 248
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
      'PARAMSAL13'
      'PESSOA')
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
  inherited ds: TwwDataSource
    Left = 394
    Top = 10
  end
  inherited ImlPadrao: TImageList
    Left = 289
    Top = 10
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 380
    Top = 58
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
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 173
    Top = 60
  end
  object dsPatro: TwwDataSource
    DataSet = qryPatro
    Left = 205
    Top = 60
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
      '        PS.IDREGRA = RE.IDREGRA       '
      ''
      ''
      ''
      ''
      ''
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
    Left = 571
    Top = 84
  end
end
