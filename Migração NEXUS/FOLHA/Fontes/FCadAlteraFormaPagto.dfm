inherited FrmCadAlteraFormaPagto: TFrmCadAlteraFormaPagto
  Left = 223
  Top = 264
  HelpContext = 180034
  Caption = 'Alteração do Portador de Forma de Pagamento'
  ClientHeight = 447
  ClientWidth = 757
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 757
    Height = 361
    inherited pnlMestre: TPanel
      Width = 755
      Height = 60
      object Label1: TLabel
        Left = 8
        Top = 11
        Width = 37
        Height = 13
        Caption = 'Titular'
      end
      object dbeNomeTitular: TDBEdit
        Left = 8
        Top = 25
        Width = 721
        Height = 21
        Color = clSilver
        DataField = 'NOME'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 61
      Width = 755
      Height = 299
      inherited pgctrlDetalhe: TPageControl
        Width = 657
        Height = 240
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 649
            Height = 212
            Selected.Strings = (
              'NOME'#9'45'#9'Recebedor'
              'DESCRTIPO'#9'13'#9'Tipo'
              'DESCRPORTFORMA'#9'39'#9'Portador de Pagamento'#9'F')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
            ReadOnly = True
          end
          inherited pnlControlesDet: TPanel
            Width = 649
            Height = 212
            object Label2: TLabel
              Left = 6
              Top = 14
              Width = 63
              Height = 13
              Caption = 'Recebedor'
            end
            object GroupBox1: TGroupBox
              Left = 2
              Top = 63
              Width = 631
              Height = 60
              Caption = 
                'Portador Forma de Pagamento (Para pagamento eletrônico deixar em' +
                ' branco)'
              TabOrder = 0
              object cmbPortador: TwwDBLookupCombo
                Left = 7
                Top = 25
                Width = 616
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'50'#9'Banco Portador'#9'F')
                LookupTable = qryBancoPortador
                LookupField = 'CODPORTFORMA'
                TabOrder = 0
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
              end
            end
            object dbeNomeRecebedor: TDBEdit
              Left = 7
              Top = 30
              Width = 623
              Height = 21
              Color = clSilver
              DataField = 'NOME'
              DataSource = dsDet
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 747
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Visible = False
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Visible = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 661
        Height = 240
      end
    end
  end
  inherited Dock972: TDock97
    Width = 757
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 408
    Width = 757
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 262
    Top = 3
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 659
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 545
    Top = 3
  end
  inherited upd: TUpdateSQL
    Left = 577
    Top = 3
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    UsaDistinct = True
    Left = 455
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Left = 233
    Top = 338
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 390
    Top = 3
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      NOME'
      'FROM'
      '    PESSOA'
      'WHERE'
      '     IDPESSOA      = :IDPESSOA'
      ''
      ' '
      ' '
      ' ')
    Left = 513
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    RepetirInsert = False
    Left = 322
    Top = 3
  end
  object qryBancoPortador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODPORTFORMA, DESCRICAO'
      'FROM PORTADORFORMA'
      'WHERE RECPAG = '#39'P'#39
      'AND CODPORTFORMA NOT IN'
      '  (SELECT CODPORTFORMA'
      '   FROM BANCOPORTFORMA'
      '   WHERE IDMODULO = 18)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 336
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT P.NOME, V.IDRECEBEDOR,'
      '       V.IDTITULAR, V.TIPO,'
      
        '       DECODE(V.TIPO,'#39'R'#39','#39'Consignatário'#39','#39'B'#39','#39'Beneficiário'#39','#39'Tit' +
        'ular'#39') DESCRTIPO,'
      
        '       DECODE(V.TIPO,'#39'R'#39',PF1.CODPORTFORMA,PF2.CODPORTFORMA) CODP' +
        'ORTFORMA,'
      
        '       DECODE(V.TIPO,'#39'R'#39',PF1.DESCRICAO,PF2.DESCRICAO) DESCRPORTF' +
        'ORMA,'
      '       BF.IDSITBENEFICIO'
      'FROM VW_RECEBEDOR V, PESSOA P,'
      
        '     RUBRICAINDIV RI, PORTADORFORMA PF1, BENEFBFCIARIO BF, PORTA' +
        'DORFORMA PF2'
      'WHERE V.IDTITULAR = :IDTITULAR'
      'AND V.IDRECEBEDOR = :IDRECEBEDOR'
      'AND V.IDRECEBEDOR = P.IDPESSOA'
      'AND PF1.CODPORTFORMA(+) = RI.CODPORTFORMA'
      'AND RI.IDTITULAR(+) = V.IDTITULAR'
      'AND RI.IDFAVORECIDO(+) = V.IDRECEBEDOR'
      'AND RI.FLGPENSAOALIM(+) = 1'
      'AND PF2.CODPORTFORMA(+) = BF.CODPORTFORMA'
      'AND BF.IDTITULAR(+) = V.IDTITULAR'
      'AND BF.IDPESSOA(+) = V.IDRECEBEDOR'
      'AND ( (BF.IDSITBENEFICIO = 1) OR'
      '           (BF.IDSITBENEFICIO = 2) OR '
      '           (BF.IDSITBENEFICIO = 3)  OR  '
      '           (BF.IDSITBENEFICIO IS NULL) )'
      ''
      ' '
      ' '
      ''
      ''
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 622
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRECEBEDOR'
        ParamType = ptInput
      end>
    object qryDetNOME: TStringField
      DisplayLabel = 'Recebedor'
      DisplayWidth = 45
      FieldName = 'NOME'
      Size = 60
    end
    object qryDetDESCRTIPO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 13
      FieldName = 'DESCRTIPO'
      Size = 13
    end
    object qryDetDESCRPORTFORMA: TStringField
      DisplayLabel = 'Portador de Pagamento'
      DisplayWidth = 39
      FieldName = 'DESCRPORTFORMA'
      Size = 50
    end
    object qryDetIDRECEBEDOR: TFloatField
      FieldName = 'IDRECEBEDOR'
      Visible = False
    end
    object qryDetIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryDetTIPO: TStringField
      FieldName = 'TIPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object qryDetIDSITBENEFICIO: TFloatField
      FieldName = 'IDSITBENEFICIO'
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBRICAINDIV'
      'set'
      '  FLGUSAABONO = :FLGUSAABONO,'
      '  IDALIMENTADO = :IDALIMENTADO,'
      '  IDTITULAR = :IDTITULAR,'
      '  DATAINICIO = :DATAINICIO,'
      '  FLGBASEPA = :FLGBASEPA,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  NUMOCORRENCIAS = :NUMOCORRENCIAS,'
      '  SEQRUBRICAINDIV = :SEQRUBRICAINDIV,'
      '  IDFAVORECIDO = :IDFAVORECIDO,'
      '  IDREGRACALCULO = :IDREGRACALCULO,'
      '  VALORRUBRICA = :VALORRUBRICA,'
      '  ANOMESINICIO = :ANOMESINICIO,'
      '  FLGPERMANENTE = :FLGPERMANENTE,'
      '  PARCELAS = :PARCELAS,'
      '  FLGPERCENT = :FLGPERCENT,'
      '  FLGTPRUBMANUT = :FLGTPRUBMANUT,'
      '  FLGPENSAOALIM = :FLGPENSAOALIM,'
      '  RUBRICAPROVENTOPA = :RUBRICAPROVENTOPA,'
      '  DATAFINAL = :DATAFINAL,'
      '  ANOMESREF = :ANOMESREF,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  FLGDESATIVADO = :FLGDESATIVADO,'
      '  FLGUSADO = :FLGUSADO'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  SEQRUBRICAINDIV = :OLD_SEQRUBRICAINDIV')
    InsertSQL.Strings = (
      'insert into RUBRICAINDIV'
      '  (FLGUSAABONO, IDALIMENTADO, IDTITULAR, DATAINICIO, FLGBASEPA, '
      'IDPESSOA, '
      '   IDEMPRESA, IDRUBRICA, NUMOCORRENCIAS, SEQRUBRICAINDIV, '
      'IDFAVORECIDO, '
      '   IDREGRACALCULO, VALORRUBRICA, ANOMESINICIO, FLGPERMANENTE, '
      'PARCELAS, '
      '   FLGPERCENT, FLGTPRUBMANUT, FLGPENSAOALIM, RUBRICAPROVENTOPA, '
      'DATAFINAL, '
      '   ANOMESREF, CODPORTFORMA, FLGDESATIVADO, FLGUSADO)'
      'values'
      
        '  (:FLGUSAABONO, :IDALIMENTADO, :IDTITULAR, :DATAINICIO, :FLGBAS' +
        'EPA, '
      ':IDPESSOA, '
      '   :IDEMPRESA, :IDRUBRICA, :NUMOCORRENCIAS, :SEQRUBRICAINDIV, '
      ':IDFAVORECIDO, '
      
        '   :IDREGRACALCULO, :VALORRUBRICA, :ANOMESINICIO, :FLGPERMANENTE' +
        ', '
      ':PARCELAS, '
      '   :FLGPERCENT, :FLGTPRUBMANUT, :FLGPENSAOALIM, '
      ':RUBRICAPROVENTOPA, :DATAFINAL, '
      '   :ANOMESREF, :CODPORTFORMA, :FLGDESATIVADO, :FLGUSADO)')
    DeleteSQL.Strings = (
      'delete from RUBRICAINDIV'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  SEQRUBRICAINDIV = :OLD_SEQRUBRICAINDIV')
    Left = 696
    Top = 2
  end
  object qryAtualiza: TwwQuery
    DatabaseName = 'BaseDados'
    ParamCheck = False
    ValidateWithMask = True
    Left = 144
    Top = 337
  end
end
