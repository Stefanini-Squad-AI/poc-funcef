inherited frmMTInvColPDT3100: TfrmMTInvColPDT3100
  Left = 290
  Top = 176
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FunCEF - Coletor de Dados Seal - PDT 3100 - 32 Bits'
  ClientHeight = 195
  ClientWidth = 370
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 370
    Height = 156
    object pnlStatus: TPanel
      Left = 1
      Top = 108
      Width = 368
      Height = 47
      Align = alBottom
      TabOrder = 1
      object lblStatus: TLabel
        Left = 8
        Top = 4
        Width = 44
        Height = 13
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object pnlprgBar: TPanel
        Left = 8
        Top = 18
        Width = 345
        Height = 17
        BevelOuter = bvLowered
        Caption = 'pnlprgBar'
        TabOrder = 0
        object prgBar: TGauge
          Left = 1
          Top = 1
          Width = 343
          Height = 15
          Align = alClient
          BackColor = clSilver
          BorderStyle = bsNone
          Color = clGray
          ForeColor = clBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Progress = 0
        end
      end
    end
    object gbConfig: TGroupBox
      Left = 165
      Top = 8
      Width = 196
      Height = 78
      Caption = 'Configuração'
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 21
        Width = 67
        Height = 13
        Caption = 'Porta Serial'
      end
      object Label2: TLabel
        Left = 10
        Top = 53
        Width = 64
        Height = 13
        Caption = 'Velocidade'
      end
      object cmbSerial: TComboBox
        Left = 87
        Top = 18
        Width = 97
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'COM1'
          'COM2'
          'COM3'
          'COM4'
          'COM5'
          'COM6'
          'COM7'
          'COM8')
      end
      object cmbVeloc: TComboBox
        Left = 87
        Top = 50
        Width = 97
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          '38400'
          '19200'
          '9600'
          '4800'
          '2400'
          '1200'
          '300')
      end
    end
    object pnlOperacao: TPanel
      Left = 11
      Top = 8
      Width = 150
      Height = 78
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 2
      object rdgpOper: TRadioGroup
        Left = 0
        Top = 0
        Width = 150
        Height = 78
        Align = alClient
        Caption = 'Operação'
        ItemIndex = 0
        Items.Strings = (
          'Transmissão'
          'Recepção')
        TabOrder = 0
      end
    end
    object ckbProcessoManual: TCheckBox
      Left = 40
      Top = 88
      Width = 287
      Height = 17
      Caption = 'Somente carga dos Arquivos Texto para o CAF'
      TabOrder = 3
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 156
    Width = 370
    inherited tb97Fundo: TToolbar97
      Left = 198
      DockPos = 224
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 29
      DockPos = 55
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Executar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
    object GroupBox1: TGroupBox
      Left = 160
      Top = 40
      Width = 185
      Height = 105
      Caption = 'GroupBox1'
      TabOrder = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 674
    Top = 423
  end
  object tblPatrim: TSdfDataSet
    FileMustExist = True
    ReadOnly = False
    FileName = 'C:\ProjetosCM5\CAF\Coletor - FunCEF\PATRIMON.TXT'
    Schema.Strings = (
      'Field1'
      'Field2'
      'Field3'
      'Field4'
      'Field5')
    Delimiter = ','
    FirstLineAsSchema = False
    Left = 56
    Top = 208
  end
  object tblNaoPatrim: TSdfDataSet
    FileMustExist = True
    ReadOnly = False
    FileName = 'C:\ProjetosCM5\CAF\Coletor - FunCEF\NAOPATRI.TXT'
    Schema.Strings = (
      'Field1'
      'Field2'
      'Field3'
      'Field4'
      'Field5')
    Delimiter = ','
    FirstLineAsSchema = False
    Left = 120
    Top = 208
  end
  object tblSessao: TSdfDataSet
    FileMustExist = True
    ReadOnly = False
    FileName = 'C:\ProjetosCM5\CAF\Coletor - FunCEF\SESSAO.TXT'
    Schema.Strings = (
      'Field1'
      'Field2'
      'Field3')
    Delimiter = ','
    FirstLineAsSchema = False
    Left = 192
    Top = 208
  end
  object tblLocais: TSdfDataSet
    FileMustExist = True
    ReadOnly = False
    FileName = 'C:\ProjetosCM5\CAF\Coletor - FunCEF\LOCAIS.TXT'
    Schema.Strings = (
      'Field1'
      'Field2'
      'Field3'
      'Field4')
    Delimiter = ','
    FirstLineAsSchema = False
    Left = 256
    Top = 208
  end
  object cdsBuscaBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 415
    Top = 24
  end
  object sqlBuscaBem: TCMSqlParams
    SQL.Strings = (
      
        'SELECT IDINVENTARIOBENS, IDEMPRESA, IIBPLACA, IIBLOCALATUAL, IIB' +
        'CONJUNTOATUAL,'
      
        '       IIBFLGPLACA, IIBLOCALNOVO, IIBCONJUNTONOVO, IIBFLGSITFISI' +
        'CA'
      'FROM ITENSINVBENS'
      'WHERE (IDINVENTARIOBENS = :IDINVENTARIOBENS)'
      '  AND (IDEMPRESA = :IDEMPRESA)'
      '  AND (IIBPLACA = :IIBPLACA)')
    ClientDataSet = cdsBuscaBem
    Left = 415
    Top = 10
  end
  object cdsBuscaConjunto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 88
  end
  object sqlBuscaConjunto: TCMSqlParams
    SQL.Strings = (
      'SELECT IDCONJUNTO'
      'FROM CONJUNTO'
      'WHERE (IDLOCALIZACAO = :IDLOCALIZACAO)'
      '  AND (IDPESSOA      = :IDPESSOA)')
    ClientDataSet = cdsBuscaConjunto
    Left = 416
    Top = 74
  end
  object cdsBuscaBens: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 152
  end
  object sqlBuscaBens: TCMSqlParams
    SQL.Strings = (
      'SELECT B.IDBEM, B.IDCONJUNTO, C.IDLOCALIZACAO'
      'FROM BEM B,'
      '     CONJUNTO C'
      'WHERE (B.PLACA = :PLACA)'
      '  AND (B.IDPESSOA = :IDPESSOA)'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)')
    ClientDataSet = cdsBuscaBens
    Left = 416
    Top = 138
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 32
  end
end
