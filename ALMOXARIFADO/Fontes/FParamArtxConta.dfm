inherited FrmParamArtxConta: TFrmParamArtxConta
  Left = 195
  Top = 189
  Caption = 'Artigos x Contas Contábeis'
  ClientHeight = 133
  ClientWidth = 356
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 356
    Height = 94
    object Label1: TLabel
      Left = 26
      Top = 27
      Width = 107
      Height = 13
      Caption = 'Grupo de Produtos'
    end
    object dblcGrp: TCMDBLookupCombo
      Left = 25
      Top = 41
      Width = 307
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCGRUPOPROD'#9'30'#9'Descrição'
        'CODGRUPOPROD'#9'10'#9'Código')
      LookupTable = qryGrupo
      LookupField = 'CODGRUPOPROD'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 94
    Width = 356
    inherited tb97Fundo: TToolbar97
      Left = 182
      DockPos = 182
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 14
      DockPos = 14
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object qryGrupo: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '           G.CODGRUPOPROD,'
      '           G.DESCGRUPOPROD'
      'FROM'
      '          GRUPPROD G'
      'ORDER BY 2'
      '    ')
    ValidateWithMask = True
    Left = 312
    Top = 6
  end
end
