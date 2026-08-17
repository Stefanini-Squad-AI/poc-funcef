inherited FRMCadCapSegAss: TFRMCadCapSegAss
  Left = 0
  Top = 57
  Caption = 'Cadastro de Capitais'
  ClientHeight = 444
  ClientWidth = 763
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 763
    Height = 358
    inherited pnlMestre: TPanel
      Width = 753
      Height = 60
      object Label1: TLabel
        Left = 9
        Top = 7
        Width = 104
        Height = 13
        Caption = 'Plano Assistencial'
      end
      object DbEdtPlanoAss: TwwDBEdit
        Left = 9
        Top = 22
        Width = 400
        Height = 21
        Color = clInactiveBorder
        Enabled = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 65
      Width = 753
      Height = 288
      inherited pgctrlDetalhe: TPageControl
        Width = 655
        Height = 229
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 647
            Height = 201
            Selected.Strings = (
              'ORDEM'#9'10'#9'Ordem'#9'F'
              'TIPOSEG'#9'7'#9'Tipo Seg.'
              'CAPITALMN'#9'10'#9'Capital MN'
              'CAPITALIP'#9'10'#9'Capital LIP'
              'CAPITALMA'#9'10'#9'Capital MA'
              'PREMIOFXA'#9'10'#9'Premio FXA'
              'PREMIOFXB'#9'10'#9'Premio FXB'
              'PREMIOFXC'#9'10'#9'Premio FXC'
              'PREMIOFXD'#9'10'#9'Premio FXD'
              'DTVIGENCIA'#9'18'#9'Vigente Desde'
              'FLGVIGENCIA'#9'1'#9'Em vigência')
          end
          inherited pnlControlesDet: TPanel
            Width = 647
            Height = 201
            object Label2: TLabel
              Left = 11
              Top = 18
              Width = 52
              Height = 13
              Caption = 'Tipo Seg'
            end
            object Label3: TLabel
              Left = 8
              Top = 57
              Width = 63
              Height = 13
              Caption = 'Capital MN'
            end
            object Label4: TLabel
              Left = 176
              Top = 56
              Width = 56
              Height = 13
              Caption = 'Capital IP'
            end
            object Label5: TLabel
              Left = 339
              Top = 56
              Width = 62
              Height = 13
              Caption = 'Capital MA'
            end
            object Label6: TLabel
              Left = 8
              Top = 96
              Width = 66
              Height = 13
              Caption = 'Prêmio FXA'
            end
            object Label7: TLabel
              Left = 176
              Top = 96
              Width = 66
              Height = 13
              Caption = 'Prêmio FXB'
            end
            object Label8: TLabel
              Left = 337
              Top = 96
              Width = 66
              Height = 13
              Caption = 'Prêmio FXC'
            end
            object Label9: TLabel
              Left = 8
              Top = 135
              Width = 67
              Height = 13
              Caption = 'Prêmio FXD'
            end
            object Label10: TLabel
              Left = 177
              Top = 135
              Width = 84
              Height = 13
              Caption = 'Vigente Desde'
            end
            object wwDBEdit2: TwwDBEdit
              Left = 489
              Top = 21
              Width = 129
              Height = 21
              DataField = 'TIPOSEG'
              DataSource = dsDet
              Enabled = False
              TabOrder = 9
              UnboundDataType = wwDefault
              Visible = False
              WantReturns = False
              WordWrap = False
            end
            object wwDBDateTimePicker1: TwwDBDateTimePicker
              Left = 174
              Top = 148
              Width = 129
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              DataField = 'DTVIGENCIA'
              DataSource = dsDet
              Epoch = 1950
              ShowButton = True
              TabOrder = 6
            end
            object wwDBComboBox1: TwwDBComboBox
              Left = 9
              Top = 32
              Width = 129
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = False
              AllowClearKey = False
              DataField = 'TIPOSEG'
              DataSource = dsDet
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'TITULAR   '
                'CONJUGE'
                'FILHOS     ')
              Sorted = False
              TabOrder = 0
              UnboundDataType = wwDefault
              OnChange = wwDBComboBox1Change
            end
            object dbreValorOutros: TDBRealEdit
              Left = 9
              Top = 109
              Width = 129
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PREMIOFXA'
              DataSource = dsDet
            end
            object DBRealEdit1: TDBRealEdit
              Left = 9
              Top = 70
              Width = 129
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'CAPITALMN'
              DataSource = dsDet
            end
            object DBRealEdit2: TDBRealEdit
              Left = 9
              Top = 148
              Width = 129
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PREMIOFXD'
              DataSource = dsDet
            end
            object DBRealEdit3: TDBRealEdit
              Left = 174
              Top = 70
              Width = 129
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 4
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'CAPITALIP'
              DataSource = dsDet
            end
            object DBRealEdit4: TDBRealEdit
              Left = 174
              Top = 109
              Width = 129
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 5
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PREMIOFXB'
              DataSource = dsDet
            end
            object DBRealEdit5: TDBRealEdit
              Left = 335
              Top = 70
              Width = 129
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 7
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'CAPITALMA'
              DataSource = dsDet
            end
            object DBRealEdit6: TDBRealEdit
              Left = 335
              Top = 109
              Width = 129
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 8
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PREMIOFXC'
              DataSource = dsDet
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 745
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnExcluiDet: TToolbarButton97
            Visible = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 659
        Height = 229
      end
    end
  end
  inherited Dock972: TDock97
    Width = 763
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
    Top = 405
    Width = 763
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select idplanass, nome from planass where idplanass = :idplanass')
    Left = 169
    Top = 114
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idplanass'
        ParamType = ptInput
      end>
    object qryIDPLANASS: TFloatField
      FieldName = 'IDPLANASS'
      Origin = 'BASEDADOS.PLANASS.IDPLANASS'
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANASS.NOME'
      Size = 40
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 291
    Top = 170
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 464
    Top = 114
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update planass'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPLANASS = :IDPLANASS')
    InsertSQL.Strings = (
      '')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PLANASS.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Plano Assistencial')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PLANASS')
    CamposChave.Strings = (
      'PLANASS.IDPLANASS'
      'PLANASS.NOME')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '40')
    Left = 291
    Top = 26
  end
  inherited ImlPadrao: TImageList
    Left = 457
    Top = 74
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    AfterConfirma = CmeCadastroAfterConfirma
  end
  inherited CmeDetalhe: TCmEventosCadastro
    RepetirInsert = False
    Left = 340
    Top = 114
  end
  object qryDet: TwwQuery
    Active = True
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM CAPSEGASS WHERE IDPLANASS = :IDPLANASS AND'
      'FLGVIGENCIA  = 1'
      'ORDER BY FLGVIGENCIA DESC, ORDEM ASC')
    UpdateObject = UpdDet
    ControlType.Strings = (
      'FLGVIGENCIA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 241
    Top = 174
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptInput
      end>
    object qryDetORDEM: TFloatField
      DisplayLabel = 'Ordem'
      DisplayWidth = 10
      FieldName = 'ORDEM'
      Origin = 'BASEDADOS.CAPSEGASS.ORDEM'
    end
    object qryDetTIPOSEG: TStringField
      DisplayLabel = 'Tipo Seg.'
      DisplayWidth = 7
      FieldName = 'TIPOSEG'
      Origin = 'BASEDADOS.CAPSEGASS.TIPOSEG'
      Size = 7
    end
    object qryDetCAPITALMN: TFloatField
      DisplayLabel = 'Capital MN'
      DisplayWidth = 10
      FieldName = 'CAPITALMN'
      Origin = 'BASEDADOS.CAPSEGASS.CAPITALMN'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryDetCAPITALIP: TFloatField
      DisplayLabel = 'Capital LIP'
      DisplayWidth = 10
      FieldName = 'CAPITALIP'
      Origin = 'BASEDADOS.CAPSEGASS.CAPITALIP'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryDetCAPITALMA: TFloatField
      DisplayLabel = 'Capital MA'
      DisplayWidth = 10
      FieldName = 'CAPITALMA'
      Origin = 'BASEDADOS.CAPSEGASS.CAPITALMA'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryDetPREMIOFXA: TFloatField
      DisplayLabel = 'Premio FXA'
      DisplayWidth = 10
      FieldName = 'PREMIOFXA'
      Origin = 'BASEDADOS.CAPSEGASS.PREMIOFXA'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryDetPREMIOFXB: TFloatField
      DisplayLabel = 'Premio FXB'
      DisplayWidth = 10
      FieldName = 'PREMIOFXB'
      Origin = 'BASEDADOS.CAPSEGASS.PREMIOFXB'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryDetPREMIOFXC: TFloatField
      DisplayLabel = 'Premio FXC'
      DisplayWidth = 10
      FieldName = 'PREMIOFXC'
      Origin = 'BASEDADOS.CAPSEGASS.PREMIOFXC'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryDetPREMIOFXD: TFloatField
      DisplayLabel = 'Premio FXD'
      DisplayWidth = 10
      FieldName = 'PREMIOFXD'
      Origin = 'BASEDADOS.CAPSEGASS.PREMIOFXD'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryDetDTVIGENCIA: TDateTimeField
      DisplayLabel = 'Vigente Desde'
      DisplayWidth = 18
      FieldName = 'DTVIGENCIA'
      Origin = 'BASEDADOS.CAPSEGASS.DTVIGENCIA'
    end
    object qryDetFLGVIGENCIA: TStringField
      DisplayLabel = 'Em vigência'
      DisplayWidth = 1
      FieldName = 'FLGVIGENCIA'
      Origin = 'BASEDADOS.CAPSEGASS.FLGVIGENCIA'
      FixedChar = True
      Size = 1
    end
    object qryDetDESCPLANO: TStringField
      DisplayWidth = 40
      FieldName = 'DESCPLANO'
      Origin = 'BASEDADOS.CAPSEGASS.DESCPLANO'
      Visible = False
      Size = 40
    end
    object qryDetTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.CAPSEGASS.TRGDTINCLUSAO'
      Visible = False
    end
    object qryDetTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.CAPSEGASS.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryDetIDCAPSEGASS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCAPSEGASS'
      Origin = 'BASEDADOS.CAPSEGASS.IDCAPSEGASS'
      Visible = False
    end
    object qryDetIDPLANASS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANASS'
      Origin = 'BASEDADOS.CAPSEGASS.IDPLANASS'
      Visible = False
    end
  end
  object UpdDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CAPSEGASS'
      'set'
      '  IDCAPSEGASS = :IDCAPSEGASS,'
      '  IDPLANASS = :IDPLANASS,'
      '  TIPOSEG = :TIPOSEG,'
      '  CAPITALMN = :CAPITALMN,'
      '  CAPITALIP = :CAPITALIP,'
      '  CAPITALMA = :CAPITALMA,'
      '  PREMIOFXA = :PREMIOFXA,'
      '  PREMIOFXB = :PREMIOFXB,'
      '  PREMIOFXC = :PREMIOFXC,'
      '  PREMIOFXD = :PREMIOFXD,'
      '  DESCPLANO = :DESCPLANO,'
      '  DTVIGENCIA = :DTVIGENCIA,'
      '  FLGVIGENCIA = :FLGVIGENCIA,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  ORDEM = :ORDEM'
      'where'
      '  IDCAPSEGASS = :OLD_IDCAPSEGASS')
    InsertSQL.Strings = (
      'insert into CAPSEGASS'
      
        '  (IDCAPSEGASS, IDPLANASS, TIPOSEG, CAPITALMN, CAPITALIP, CAPITA' +
        'LMA, '
      'PREMIOFXA, '
      '   PREMIOFXB, PREMIOFXC, PREMIOFXD, DESCPLANO, DTVIGENCIA, '
      'FLGVIGENCIA, '
      '   TRGDTINCLUSAO, TRGUSERINCLUSAO, ORDEM)'
      'values'
      '  (:IDCAPSEGASS, :IDPLANASS, :TIPOSEG, :CAPITALMN, :CAPITALIP, '
      ':CAPITALMA, '
      '   :PREMIOFXA, :PREMIOFXB, :PREMIOFXC, :PREMIOFXD, :DESCPLANO, '
      ':DTVIGENCIA, '
      '   :FLGVIGENCIA, :TRGDTINCLUSAO, :TRGUSERINCLUSAO, :ORDEM)')
    DeleteSQL.Strings = (
      'delete from CAPSEGASS'
      'where  IDCAPSEGASS = :OLD_IDCAPSEGASS')
    Left = 373
    Top = 183
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 565
    Top = 207
  end
end
