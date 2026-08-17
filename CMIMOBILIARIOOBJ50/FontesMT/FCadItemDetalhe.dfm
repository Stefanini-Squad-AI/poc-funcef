inherited frmCadItemDetalhe: TfrmCadItemDetalhe
  Left = 191
  Top = 223
  Caption = 'Detalhe do Item da Forma de Cálculo'
  ClientHeight = 228
  ClientWidth = 654
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 654
    Height = 195
    object lblNomeItem: TfcLabel
      Left = 16
      Top = 8
      Width = 139
      Height = 24
      Caption = 'Nome do Item'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
    end
    object lblSeqCalculo: TLabel
      Left = 393
      Top = 145
      Width = 133
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sequência de Cálculo: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object rdgTipoEvento: TDBRadioGroup
      Left = 16
      Top = 56
      Width = 233
      Height = 65
      Caption = ' Evento '
      DataField = 'TIPOEVENTO'
      DataSource = dsItem
      Items.Strings = (
        'Geração de Parcelas'
        'Descontos')
      TabOrder = 0
      Values.Strings = (
        '0'
        '1')
    end
    object chkCentraliza: TDBCheckBox
      Left = 16
      Top = 35
      Width = 193
      Height = 17
      Caption = 'Centralizador do Grupo'
      DataField = 'FLGCENTRALIZA'
      DataSource = dsItem
      Enabled = False
      TabOrder = 1
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object chkGravaZero: TDBCheckBox
      Left = 270
      Top = 102
      Width = 273
      Height = 17
      Caption = 'Grava histórico mesmo com valor ZERO'
      DataField = 'FLGGRAVAZERO'
      DataSource = dsItem
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object rdgTrataSaldoDev: TDBRadioGroup
      Left = 17
      Top = 131
      Width = 371
      Height = 36
      Caption = ' Tratamento quanto ao Saldo Devedor '
      Columns = 3
      DataField = 'TRATASALDODEV'
      DataSource = dsItem
      Items.Strings = (
        'Não tratar'
        'Abater'
        'Incorporar')
      TabOrder = 3
      Values.Strings = (
        '0'
        '1'
        '2')
    end
    object DBspnSeqCalculo: TwwDBSpinEdit
      Left = 528
      Top = 141
      Width = 49
      Height = 21
      Increment = 1
      MaxValue = 998
      DataField = 'SEQCALCULO'
      DataSource = dsItem
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      UnboundDataType = wwDefault
    end
    inline molRegraCalculo: TmolRegraDB
      Left = 262
      Top = 53
      TabOrder = 5
      inherited DBedtRegra: TDBEdit
        DataField = 'NOMEREGRA'
        DataSource = dsItem
      end
      inherited DBedtIDRegra: TDBEdit
        DataField = 'IDREGRA'
        DataSource = dsItem
      end
      inherited MS_Regra: TMontaSelect
        Left = 352
        Top = 16
      end
      inherited cdsRegra: TCMClientDataSet
        Left = 326
        Top = 15
      end
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = -8
      Top = 194
      Width = 233
      Height = 129
      Caption = ' Evento '
      DataField = 'TIPOEVENTO'
      DataSource = dsItem
      Enabled = False
      Items.Strings = (
        'Geração de Parcelas'
        'Antecipação de Parcelas'
        'Amortização Extra'
        'Atualização de Saldo Devedor')
      TabOrder = 6
      Values.Strings = (
        '0'
        '1'
        '2'
        '3')
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 195
    Width = 654
    inherited tb97Fundo: TToolbar97
      Left = 382
      inherited bbtnSair: TBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object dsItem: TDataSource
    DataSet = cds
    Left = 360
    Top = 8
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 8
  end
  object cdsVerificaSeq: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 448
    Top = 8
  end
end
