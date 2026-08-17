inherited frmCadDescontoContrato: TfrmCadDescontoContrato
  Left = 267
  Top = 241
  Caption = 'Cadastro de Descontos Programados'
  ClientHeight = 436
  ClientWidth = 731
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 731
    Height = 403
    inherited Panel1: TPanel
      Width = 731
      Height = 56
      inline molContrato1: TmolContrato
        Left = 8
        Top = 8
        Width = 521
        inherited edtContrato: TEdit
          Width = 465
        end
        inherited btnBuscaContrato: TBitBtn
          Left = 472
          OnClick = molContrato1btnBuscaContratoClick
        end
        inherited btnLimpaContrato: TBitBtn
          Left = 496
        end
      end
    end
    inherited pgc: TPageControl
      Top = 56
      Width = 731
      Height = 347
      inherited tbs: TTabSheet
        inherited Dock973: TDock97
          Width = 723
        end
        inherited pnlControles: TPanel
          Width = 723
          Height = 106
          object Label2: TLabel
            Left = 392
            Top = 10
            Width = 103
            Height = 13
            Caption = 'Tipo de Alterador '
          end
          object Label1: TLabel
            Left = 16
            Top = 58
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object Label3: TLabel
            Left = 16
            Top = 10
            Width = 110
            Height = 13
            Caption = 'Descrição / Motivo'
          end
          object Label4: TLabel
            Left = 128
            Top = 58
            Width = 195
            Height = 13
            Caption = 'Mês e Ano de Competência (base)'
          end
          object lblRepetir: TLabel
            Left = 516
            Top = 76
            Width = 80
            Height = 13
            Caption = 'Repetir por:   '
          end
          object lblMeses: TLabel
            Left = 664
            Top = 76
            Width = 36
            Height = 13
            Caption = 'meses'
          end
          object DBcboAlterador: TwwDBLookupCombo
            Left = 392
            Top = 24
            Width = 313
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            DataField = 'CODALTERADOR'
            DataSource = ds
            LookupTable = dtmLookImobiliario.qryLookAlterador
            LookupField = 'CODALTERADOR'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
          object DBedtDescricao: TDBEdit
            Left = 16
            Top = 24
            Width = 361
            Height = 21
            DataField = 'DCCDESCRICAO'
            DataSource = ds
            TabOrder = 0
          end
          object DBedtVlr: TDBEdit
            Left = 16
            Top = 72
            Width = 97
            Height = 21
            DataField = 'DCCVLR'
            DataSource = ds
            TabOrder = 2
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 280
            Top = 72
            Width = 65
            Height = 21
            Increment = 1
            MaxValue = 2099
            MinValue = 1980
            DataField = 'DCCANOCOMPETENCIA'
            DataSource = ds
            TabOrder = 4
            UnboundDataType = wwDefault
          end
          object DBcboMes: TwwDBComboBox
            Left = 128
            Top = 72
            Width = 153
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = False
            DataField = 'DCCMESCOMPETENCIA'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Janeiro'#9'1'
              'Fevereiro'#9'2'
              'Março'#9'3'
              'Abril'#9'4'
              'Maio'#9'5'
              'Junho'#9'6'
              'Julho'#9'7'
              'Agosto'#9'8'
              'Setembro'#9'9'
              'Outubro'#9'10'
              'Novembro'#9'11'
              'Dezembro'#9'12')
            Sorted = False
            TabOrder = 3
            UnboundDataType = wwDefault
          end
          object DBspnRepetir: TwwDBSpinEdit
            Left = 592
            Top = 72
            Width = 65
            Height = 21
            Increment = 1
            MaxValue = 120
            MinValue = 1
            Value = 1
            TabOrder = 5
            UnboundDataType = wwDefault
          end
        end
        inherited pnlGrd: TPanel
          Top = 137
          Width = 723
          Height = 200
          inherited DBgrd: TwwDBGrid
            Top = 32
            Width = 689
            Height = 153
            Selected.Strings = (
              'DCCMESCOMPETENCIA'#9'5'#9'Mês'
              'DCCANOCOMPETENCIA'#9'5'#9'Ano'
              'DCCVLR'#9'13'#9'Valor'
              'DCCDESCRICAO'#9'40'#9'Motivo'
              'DESCRICAO'#9'27'#9'Alterador'#9'F')
          end
          object Panel5: TPanel
            Left = 16
            Top = 6
            Width = 689
            Height = 27
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Descontos'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 731
  end
  inherited ds: TwwDataSource
    Left = 432
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 576
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update DESCONTOCONTRATO'
      'set'
      '  IDDESCONTO = :IDDESCONTO,'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL,'
      '  DCCMESCOMPETENCIA = :DCCMESCOMPETENCIA,'
      '  DCCANOCOMPETENCIA = :DCCANOCOMPETENCIA,'
      '  CODALTERADOR = :CODALTERADOR,'
      '  DCCVLR = :DCCVLR,'
      '  FLGCONCEDIDO = :FLGCONCEDIDO,'
      '  DCCDESCRICAO = :DCCDESCRICAO'
      'where'
      '  IDDESCONTO = :OLD_IDDESCONTO')
    InsertSQL.Strings = (
      'insert into DESCONTOCONTRATO'
      
        '  (IDDESCONTO, IDCONTRATOIMOVEL, DCCMESCOMPETENCIA, DCCANOCOMPET' +
        'ENCIA, '
      '   CODALTERADOR, DCCVLR, FLGCONCEDIDO, DCCDESCRICAO)'
      'values'
      
        '  (:IDDESCONTO, :IDCONTRATOIMOVEL, :DCCMESCOMPETENCIA, :DCCANOCO' +
        'MPETENCIA, '
      '   :CODALTERADOR, :DCCVLR, :FLGCONCEDIDO, :DCCDESCRICAO)')
    DeleteSQL.Strings = (
      'delete from DESCONTOCONTRATO'
      'where'
      '  IDDESCONTO = :OLD_IDDESCONTO')
    Left = 368
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   D.IDDESCONTO,'
      '   D.IDCONTRATOIMOVEL,'
      '   D.DCCMESCOMPETENCIA,'
      '   D.DCCANOCOMPETENCIA,'
      '   D.CODALTERADOR,'
      '   D.DCCVLR,'
      '   D.FLGCONCEDIDO,'
      '   D.DCCDESCRICAO,'
      ''
      '   A.DESCRICAO'
      ''
      'FROM'
      '   DESCONTOCONTRATO D, TIPOALTERADOR A'
      ''
      'WHERE'
      '   ( D.IDCONTRATOIMOVEL =:PIDCONTRATOIMOVEL )'
      '   AND ( D.CODALTERADOR = A.CODALTERADOR(+) )'
      ' '
      ' ')
    Left = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryDCCMESCOMPETENCIA: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Mês'
      DisplayWidth = 5
      FieldName = 'DCCMESCOMPETENCIA'
      DisplayFormat = '00'
      EditFormat = '0'
    end
    object qryDCCANOCOMPETENCIA: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Ano'
      DisplayWidth = 5
      FieldName = 'DCCANOCOMPETENCIA'
      DisplayFormat = '0000'
      EditFormat = '0'
    end
    object qryDCCVLR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 13
      FieldName = 'DCCVLR'
      DisplayFormat = '#,##0.00'
      EditFormat = '#0'
    end
    object qryDCCDESCRICAO: TStringField
      DisplayLabel = 'Descrição / Motivo'
      DisplayWidth = 40
      FieldName = 'DCCDESCRICAO'
      Size = 50
    end
    object qryDESCRICAO: TStringField
      DisplayLabel = 'Alterador'
      DisplayWidth = 27
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryIDDESCONTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDDESCONTO'
      Visible = False
    end
    object qryIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryCODALTERADOR: TFloatField
      DisplayWidth = 10
      FieldName = 'CODALTERADOR'
      Visible = False
    end
    object qryFLGCONCEDIDO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGCONCEDIDO'
      Visible = False
    end
  end
  object qryInsertDesconto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO DESCONTOCONTRATO'
      '('
      'IDDESCONTO,'
      'IDCONTRATOIMOVEL,'
      'DCCMESCOMPETENCIA,'
      'DCCANOCOMPETENCIA,'
      'CODALTERADOR,'
      'DCCVLR,'
      'FLGCONCEDIDO,'
      'DCCDESCRICAO'
      ')'
      'VALUES'
      '('
      ':PIDDESCONTO,'
      ':PIDCONTRATOIMOVEL,'
      ':PDCCMESCOMPETENCIA,'
      ':PDCCANOCOMPETENCIA,'
      ':PCODALTERADOR,'
      ':PDCCVLR,'
      '0,'
      ':PDCCDESCRICAO'
      ')'
      '')
    ValidateWithMask = True
    Left = 400
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDESCONTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PDCCMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PDCCANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODALTERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PDCCVLR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PDCCDESCRICAO'
        ParamType = ptUnknown
      end>
  end
end
