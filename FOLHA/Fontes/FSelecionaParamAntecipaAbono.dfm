inherited frmSelecionaParamAntecipaAbono: TfrmSelecionaParamAntecipaAbono
  Left = 179
  Top = 114
  Caption = 'Parâmetros para Antecipação de Abono'
  ClientHeight = 488
  ClientWidth = 939
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 939
    Height = 449
    object pgcPatroPrevBenef: TPageControl
      Left = 1
      Top = 1
      Width = 937
      Height = 447
      ActivePage = TabSheetOpcoes
      Align = alClient
      TabOrder = 0
      object TabSheetOpcoes: TTabSheet
        Caption = 'Opções'
        object Splitter1: TSplitter
          Left = 345
          Top = 31
          Width = 4
          Height = 388
          Cursor = crHSplit
        end
        object pnlcheck: TPanel
          Left = 0
          Top = 0
          Width = 929
          Height = 31
          Align = alTop
          TabOrder = 0
          object chkSelTodos: TCheckBox
            Left = 14
            Top = 8
            Width = 475
            Height = 17
            Caption = 
              'Selecionar todas as Patrocinadoras, Planos Previdenciários e Ben' +
              'efícios'
            TabOrder = 0
            OnClick = chkSelTodosClick
          end
        end
        object PnlPatroPlano: TPanel
          Left = 0
          Top = 31
          Width = 345
          Height = 388
          Align = alLeft
          Caption = 'PnlPatroPlano'
          TabOrder = 1
          object LblPatro: TLabel
            Left = 13
            Top = 5
            Width = 66
            Height = 13
            Caption = 'Patrocinadora'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Splitter2: TSplitter
            Left = 1
            Top = 161
            Width = 343
            Height = 5
            Cursor = crVSplit
            Align = alTop
          end
          object PnlPlano: TPanel
            Left = 1
            Top = 166
            Width = 343
            Height = 221
            Align = alClient
            Caption = 'PnlPlano'
            TabOrder = 0
            object chklstPlano: TCheckListBox
              Left = 1
              Top = 23
              Width = 341
              Height = 197
              Hint = 'Planos Disponíveis para o Preparo da Folha de Benefícios'
              OnClickCheck = chklstPlanoClickCheck
              Align = alClient
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ItemHeight = 15
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object PnlPlanodesc: TPanel
              Left = 1
              Top = 1
              Width = 341
              Height = 22
              Align = alTop
              Alignment = taLeftJustify
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = '   Planos das Patrocinadoras selecionadas'
              TabOrder = 1
              object imgSelPlano: TImage
                Left = 322
                Top = 2
                Width = 17
                Height = 18
                Hint = 'Inverter seleção'
                Align = alRight
                ParentShowHint = False
                Picture.Data = {
                  07544269746D6170E6000000424DE60000000000000076000000280000000E00
                  00000E0000000100040000000000700000000000000000000000100000001000
                  0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
                  C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                  FF00333333333333330033333333333333003333333333333300333330003333
                  3300333330F033333300333330F033333300330000F000033300330FFFFFFF03
                  3300330000F000033300333330F033333300333330F033333300333330003333
                  330033333333333333003333333333333300}
                ShowHint = True
                Stretch = True
                OnClick = imgSelPlanoClick
              end
            end
          end
          object PnlPatrocinadora: TPanel
            Left = 1
            Top = 1
            Width = 343
            Height = 160
            Align = alTop
            Caption = 'PnlPatrocinadora'
            TabOrder = 1
            object chklstPatro: TCheckListBox
              Left = 1
              Top = 23
              Width = 341
              Height = 136
              Hint = 'Patrocinadoras Disponíveis para o Preparo'
              OnClickCheck = chklstPatroClickCheck
              Align = alClient
              Columns = 2
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ItemHeight = 15
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object PnlPatrocinadoradesc: TPanel
              Left = 1
              Top = 1
              Width = 341
              Height = 22
              Align = alTop
              Alignment = taLeftJustify
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = '    Patrocinadora com Assistidos'
              TabOrder = 1
              object imgSelPatro: TImage
                Left = 322
                Top = 2
                Width = 17
                Height = 18
                Hint = 'Inverter seleção'
                Align = alRight
                ParentShowHint = False
                Picture.Data = {
                  07544269746D6170E6000000424DE60000000000000076000000280000000E00
                  00000E0000000100040000000000700000000000000000000000100000001000
                  0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
                  C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                  FF00333333333333330033333333333333003333333333333300333330003333
                  3300333330F033333300333330F033333300330000F000033300330FFFFFFF03
                  3300330000F000033300333330F033333300333330F033333300333330003333
                  330033333333333333003333333333333300}
                ShowHint = True
                Stretch = True
                OnClick = imgSelPatroClick
              end
            end
          end
        end
        object PnlBeneficio: TPanel
          Left = 349
          Top = 31
          Width = 580
          Height = 388
          Align = alClient
          Caption = 'PnlBeneficio'
          TabOrder = 2
          object chklstBenef: TCheckListBox
            Left = 1
            Top = 23
            Width = 578
            Height = 364
            Hint = 'Benefícios disponiveis para o Preparo'
            OnClickCheck = chklstBenefClickCheck
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            ItemHeight = 15
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object PnlBeneficiodesc: TPanel
            Left = 1
            Top = 1
            Width = 578
            Height = 22
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = '   Benefícios'
            TabOrder = 1
            object imgSelBenef: TImage
              Left = 559
              Top = 2
              Width = 17
              Height = 18
              Hint = 'Inverter seleção'
              Align = alRight
              ParentShowHint = False
              Picture.Data = {
                07544269746D6170E6000000424DE60000000000000076000000280000000E00
                00000E0000000100040000000000700000000000000000000000100000001000
                0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
                C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF00333333333333330033333333333333003333333333333300333330003333
                3300333330F033333300333330F033333300330000F000033300330FFFFFFF03
                3300330000F000033300333330F033333300333330F033333300333330003333
                330033333333333333003333333333333300}
              ShowHint = True
              Stretch = True
              OnClick = imgSelBenefClick
            end
          end
        end
      end
      object TabSheetResultado: TTabSheet
        Caption = 'Resultado'
        ImageIndex = 1
        object PnlResult: TPanel
          Left = 0
          Top = 0
          Width = 967
          Height = 419
          Align = alClient
          Caption = 'PnlResult'
          TabOrder = 0
          object memResult: TMemo
            Left = 1
            Top = 1
            Width = 965
            Height = 417
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 449
    Width = 939
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnSair: TBitBtn
        ModalResult = 1
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 89
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 89
        Caption = '&Processar'
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 92
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 443
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT p.idpessoa, p.nome'
      'FROM patro pt'
      '     JOIN pessoa p ON pt.idpessoa = p.idpessoa'
      'WHERE EXISTS (SELECT 1'
      '              FROM Planprevpatro pp'
      
        '                   JOIN benefplanprev bpp ON pp.idplanoprev = bp' +
        'p.idplanoprev'
      '              WHERE pp.idpessjur = pt.idpessoa)'
      ' ORDER BY p.nome')
    ValidateWithMask = True
    Left = 29
    Top = 328
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 72
    Top = 328
  end
  object qryBenef: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 120
    Top = 328
  end
  object qryInsertReplicacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'INSERT INTO PARAMANTECIPABONO(MES,IDPESSJUR,IDPLANOPREV,IDBENEFI' +
        'CIO,IDREGRA,PERCENTUAL)'
      
        'VALUES (:PMES,:PIDPESSJUR,:PIDPLANOPREV,:PIDBENEFICIO,:PIDREGRA,' +
        ':PPERCENTUAL)')
    ValidateWithMask = True
    Left = 160
    Top = 327
    ParamData = <
      item
        DataType = ftString
        Name = 'PMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEFICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDREGRA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PPERCENTUAL'
        ParamType = ptInput
      end>
  end
  object qryUpdateReplicacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PARAMANTECIPABONO'
      '   SET IDREGRA = :PIDREGRA, PERCENTUAL = :PPERCENTUAL'
      ' WHERE MES = :PMES'
      '   AND IDPESSJUR = :PIDPESSJUR'
      '   AND IDPLANOPREV = :PIDPLANOPREV'
      '   AND IDBENEFICIO = :PIDBENEFICIO')
    ValidateWithMask = True
    Left = 240
    Top = 319
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDREGRA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PPERCENTUAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEFICIO'
        ParamType = ptInput
      end>
  end
end
