inherited frmSelEstBenef: TfrmSelEstBenef
  Left = 80
  Top = 136
  HelpContext = 710009
  Caption = 'Estatística de Benefícios Sociais'
  ClientWidth = 635
  Constraints.MinHeight = 399
  Constraints.MinWidth = 643
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 635
    inherited pnSelecao: TPanel
      Width = 627
      BevelOuter = bvNone
      inherited pnResult: TPanel
        Left = 0
        Top = 0
        Width = 627
        Height = 325
        object Chart1: TChartfx
          Left = 1
          Top = 1
          Width = 250
          Height = 323
          Align = alLeft
          TabOrder = 0
          ControlData = {
            D7190000622100006000000000000102410200FFFFFFFF320032002800280002
            00000000000000080001000000000000000000000000000000020000FFFF00C0
            C0C000C0C0C000FFFFFF00FF1FFF1F0000000000010000000000000000080000
            2008000060080000000800000008000000080000000800000008000000080000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000000000F0
            3F02000400000000000000000000000000000059400000000000000000000000
            000000000000000000}
        end
        object Chart2: TChartfx
          Left = 251
          Top = 1
          Width = 375
          Height = 323
          Align = alClient
          TabOrder = 1
          ControlData = {
            C2260000622100006000000000000102510200FFFFFFFF320032002800280002
            00000000000000080001000000000000000000000000000000020000FFFF00C0
            C0C000C0C0C000FFFFFF00FF1FFF1F0000000000010000000000000000080000
            2008000060080000000800000008000000080000000800000008000000080000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000000000F0
            3F02000400000000000000000000000000000059400000000000000000000000
            000000000000000000}
        end
      end
      inherited pgctrlPrincipal: TPageControl
        Left = 0
        Top = 0
        Width = 627
        Height = 325
        ActivePage = tbshGrafico
        object tbshGrafico: TTabSheet [0]
          Caption = 'Gráfico'
          ImageIndex = 4
          object gbxData: TGroupBox
            Left = 72
            Top = 16
            Width = 472
            Height = 46
            Caption = 'Benefícios Vigentes em'
            TabOrder = 0
            object cmbMes: TComboBox
              Left = 131
              Top = 16
              Width = 121
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ItemHeight = 13
              ParentFont = False
              TabOrder = 0
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
            object speAno: TSpinEdit
              Left = 264
              Top = 16
              Width = 68
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MaxValue = 0
              MinValue = 0
              ParentFont = False
              TabOrder = 1
              Value = 0
              OnChange = speAnoChange
            end
          end
          object gbxBenef: TGroupBox
            Left = 72
            Top = 66
            Width = 472
            Height = 205
            Caption = 'Benefícios a Considerar'
            TabOrder = 1
            object chklstBenef: TColorCheckListBox
              Left = 8
              Top = 15
              Width = 456
              Height = 152
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
            object bbtnInverteSel: TBitBtn
              Left = 294
              Top = 173
              Width = 169
              Height = 25
              Caption = '   Inverte Seleção'
              TabOrder = 1
              TabStop = False
              OnClick = bbtnInverteSelClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333000000003333333388888888333333330FFF
                FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
                FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
                FFF0333833338FFFFFF833333333000000003333333388888888000000003333
                333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
                00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
                033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
                3333888888877333333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
            object bbtnSelTodos: TBitBtn
              Left = 8
              Top = 173
              Width = 169
              Height = 25
              Caption = '   Seleciona Todos'
              TabOrder = 2
              TabStop = False
              OnClick = bbtnSelTodosClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333333333333333333333333300000
                0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
                FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
                9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
                00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
                993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
                3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
                3333388888887733333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
          end
        end
        inherited tsDadosFunc: TTabSheet
          inherited gbxTipoSal: TGroupBox
            TabOrder = 2
          end
          inherited gbxSalario: TGroupBox
            TabOrder = 3
          end
          inherited rgSequencia: TGroupBox
            TabOrder = 7
          end
          inherited gbxAdmissao: TGroupBox
            TabOrder = 8
          end
        end
        inherited tsDadosPess: TTabSheet
          inherited gbxCep: TGroupBox [2]
          end
          inherited gbxAniv: TGroupBox [3]
          end
          inherited gbxGrauInstr: TGroupBox [4]
          end
          inherited gbxProfis: TGroupBox [5]
          end
        end
        inherited tsDadosOutros: TTabSheet
          inherited rgSelCargo: TRadioGroup [1]
          end
          inherited gbxEstab: TGroupBox [3]
          end
          inherited gbxCargo: TGroupBox [4]
          end
          inherited rgSelRamo: TRadioGroup [5]
          end
          inherited gbxRamo: TGroupBox [6]
          end
          inherited gbxSindi: TGroupBox [7]
          end
        end
        inherited tbsDemit: TTabSheet
          inherited gbxDemitidos: TGroupBox
            Width = 619
            Height = 297
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Width = 635
    inherited tb97Fundo: TToolbar97
      Left = 373
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 205
      DockPos = 205
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 411
    Top = 195
  end
  inherited Cmp_Padrao: TCmParamReport
    Left = 408
    Top = 131
  end
  inherited CdsCCusto: TCMClientDataSet
    IndexDefs = <
      item
        Name = 'CdsCCustoIndex'
        Fields = 'TIPO;NOME'
        Options = [ixCaseInsensitive]
      end>
  end
  object dsHstBeneficios: TwwDataSource
    Left = 180
    Top = 145
  end
  object CdsHstBeneficios: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 180
    Top = 131
  end
  object sqlHstBeneficios: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PD.DESCRICAO, RI.ANOMESINICIO, RI.PARCELAS, RI.NUMOCORRENCIAS,'
      
        '  RI.FLGPERMANENTE, RI.IDREGRACALCULO, RI.VALORRUBRICA, RI.IDRUB' +
        'RICA'
      'FROM'
      '  RUBRICAINDIV RI, PROVDESC PD'
      'WHERE'
      '  (RI.IDPESSOA       = :IDPESSOA) AND'
      '  (PD.FLGCONSTAFOLHA = 0) AND'
      '  (PD.IDBENEFSALAR IS NOT NULL) AND'
      '  (RI.IDRUBRICA      = PD.IDPROVENTO) AND'
      '  (RI.ANOMESINICIO  <= :MESREF_LANC) AND'
      '  ((RI.FLGPERMANENTE  = 1) OR'
      '   (TO_NUMBER(SUBSTR(RI.ANOMESINICIO,1,4)) * 12 +'
      '    TO_NUMBER(SUBSTR(RI.ANOMESINICIO,6,2)) +'
      '    RI.NUMOCORRENCIAS >'
      '    TO_NUMBER(SUBSTR(:MESREF_LANC,1,4)) * 12 +'
      '    TO_NUMBER(SUBSTR(:MESREF_LANC,6,2))))'
      'UNION'
      'SELECT'
      
        '  PD.DESCRICAO, H.MES AS ANOMESINICIO, 0 AS PARCELAS, 0 AS NUMOC' +
        'ORRENCIAS,'
      
        '  1 AS FLGPERMANENTE, -99 AS IDREGRACALCULO, H.VALORPROVENTO AS ' +
        'VALORRUBRICA,'
      '  H.IDRUBRICA'
      'FROM'
      '  HISTRUBSAL H, PROVDESC PD'
      'WHERE'
      '  (H.IDPESSOA        = :IDPESSOA) AND'
      '  (H.MES             = :MESREF) AND'
      '  (PD.FLGCONSTAFOLHA = 1) AND'
      '  (PD.IDBENEFSALAR IS NOT NULL) AND'
      '  (H.IDRUBRICA       = PD.IDPROVENTO)'
      'ORDER BY'
      '  2 DESC')
    ClientDataSet = CdsHstBeneficios
    Left = 180
    Top = 117
  end
  object CdsRubrica: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 348
    Top = 131
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 268
    Top = 131
  end
  object sqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  MAX(H.MES) AS MESREF'
      'FROM'
      '  HISTRUBSAL H, PROVDESC PD, PARAMRH PR'
      'WHERE'
      '  (PD.IDBENEFSALAR IS NOT NULL) AND'
      '  (PR.IDMOTIVO      = H.IDMOTIVO) AND'
      '  (PD.IDPROVENTO    = H.IDRUBRICA)')
    ClientDataSet = CdsAux
    Left = 268
    Top = 117
  end
end
