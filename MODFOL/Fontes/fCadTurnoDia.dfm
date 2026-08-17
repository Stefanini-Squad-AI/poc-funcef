inherited frmCadTurnoDia: TfrmCadTurnoDia
  Left = 234
  Top = 158
  Width = 463
  Height = 393
  BorderStyle = bsSizeable
  Caption = 'Turnos por Dia'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 455
    Height = 280
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 447
      Height = 272
      object Label1: TLabel
        Left = 126
        Top = 34
        Width = 44
        Height = 13
        Caption = 'Código '
        FocusControl = dbedCodigo
      end
      object Label2: TLabel
        Left = 126
        Top = 64
        Width = 101
        Height = 13
        Caption = 'Início Expediente'
        FocusControl = dbedInicioExped
      end
      object Label3: TLabel
        Left = 126
        Top = 94
        Width = 79
        Height = 13
        Caption = 'Início Almoço'
        FocusControl = dbedInicioAlm
      end
      object Label4: TLabel
        Left = 126
        Top = 124
        Width = 73
        Height = 13
        Caption = 'Final Almoço'
        FocusControl = dbedFinalAlm
      end
      object Label5: TLabel
        Left = 126
        Top = 154
        Width = 95
        Height = 13
        Caption = 'Final Expediente'
        FocusControl = dbedFimExped
      end
      object dbedCodigo: TDBEdit
        Left = 251
        Top = 29
        Width = 60
        Height = 21
        DataField = 'IDTURNODIARIO'
        DataSource = ds
        TabOrder = 0
      end
      object dbedInicioExped: TDBEdit
        Left = 251
        Top = 59
        Width = 60
        Height = 21
        DataField = 'INICIOEXPEDIENTE'
        DataSource = ds
        TabOrder = 1
      end
      object dbedInicioAlm: TDBEdit
        Left = 251
        Top = 89
        Width = 60
        Height = 21
        DataField = 'INICIOALMOCO'
        DataSource = ds
        TabOrder = 2
      end
      object dbedFinalAlm: TDBEdit
        Left = 251
        Top = 119
        Width = 60
        Height = 21
        DataField = 'FINALALMOCO'
        DataSource = ds
        TabOrder = 3
      end
      object dbedFimExped: TDBEdit
        Left = 251
        Top = 149
        Width = 60
        Height = 21
        DataField = 'FINALEXPEDIENTE'
        DataSource = ds
        TabOrder = 4
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 447
      Height = 272
      Selected.Strings = (
        'IDTURNODIARIO'#9'6'#9'Código'
        'INICIOEXPEDIENTE'#9'8'#9'Início Expediente'
        'INICIOALMOCO'#9'8'#9'Início Almoço'
        'FINALALMOCO'#9'8'#9'Final Almoço'
        'FINALEXPEDIENTE'#9'8'#9'Final Expediente')
      Font.Height = -11
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 455
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 327
    Width = 455
    inherited tb97Fundo: TToolbar97
      Left = 275
      DockPos = 275
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 107
      DockPos = 107
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDTURNODIARIO, INICIOEXPEDIENTE, INICIOALMOCO,'
      '  FINALALMOCO, FINALEXPEDIENTE'
      'FROM'
      '  TURNODIA'
      'ORDER BY'
      '  IDTURNODIARIO')
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TURNODIA'
      'set'
      '  IDTURNODIARIO = :IDTURNODIARIO,'
      '  INICIOEXPEDIENTE = :INICIOEXPEDIENTE,'
      '  INICIOALMOCO = :INICIOALMOCO,'
      '  FINALALMOCO = :FINALALMOCO,'
      '  FINALEXPEDIENTE = :FINALEXPEDIENTE'
      'where'
      '  IDTURNODIARIO = :OLD_IDTURNODIARIO')
    InsertSQL.Strings = (
      'insert into TURNODIA'
      
        '  (IDTURNODIARIO, INICIOEXPEDIENTE, INICIOALMOCO, FINALALMOCO, F' +
        'INALEXPEDIENTE)'
      'values'
      
        '  (:IDTURNODIARIO, :INICIOEXPEDIENTE, :INICIOALMOCO, :FINALALMOC' +
        'O, :FINALEXPEDIENTE)')
    DeleteSQL.Strings = (
      'delete from TURNODIA'
      'where'
      '  IDTURNODIARIO = :OLD_IDTURNODIARIO')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Turnos por Dia'
    Colunas.Strings = (
      'TURNODIA.IDTURNODIARIO'
      'TURNODIA.INICIOEXPEDIENTE')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TURNODIA')
    CamposChave.Strings = (
      'TURNODIA.IDTURNODIARIO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '8')
  end
end
