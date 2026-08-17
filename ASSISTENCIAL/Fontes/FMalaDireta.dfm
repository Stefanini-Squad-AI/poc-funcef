inherited frmMalaDireta: TfrmMalaDireta
  Left = 105
  Top = 201
  Caption = 'Mala Direta'
  ClientHeight = 253
  ClientWidth = 609
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 609
    Height = 214
    TabOrder = 2
  end
  inherited Dock971: TDock97
    Top = 214
    Width = 609
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 214
    Width = 609
    Height = 41
    TabOrder = 3
  end
  object pgctrlConsulta: TPageControl [3]
    Left = 0
    Top = 3
    Width = 609
    Height = 208
    ActivePage = tbsPrincipal
    TabOrder = 0
    object tbsPrincipal: TTabSheet
      Caption = 'Dados Principais'
      object GroupBox1: TGroupBox
        Left = 3
        Top = 3
        Width = 241
        Height = 91
        TabOrder = 0
        object LABEL1: TLabel
          Left = 6
          Top = 12
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object label4: TLabel
          Left = 6
          Top = 51
          Width = 33
          Height = 13
          Caption = 'Plano'
        end
        object dblkpcmbPatro: TwwDBLookupCombo
          Left = 6
          Top = 27
          Width = 229
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEFANTASIA'#9'50'#9'NOMEFANTASIA'#9'No'
            'IDPESSJUR'#9'10'#9'IDPESSJUR'#9'No'
            'RAZAOSOCIAL'#9'50'#9'RAZAOSOCIAL'#9'No'
            'RADICALCGC'#9'10'#9'RADICALCGC'#9'No'
            'FLGCLIENTE'#9'10'#9'FLGCLIENTE'#9'No'
            'FLGPATROCINADORA'#9'10'#9'FLGPATROCINADORA'#9'No'
            'FLGADMINISTRADORFUNDO'#9'10'#9'FLGADMINISTRADORFUNDO'#9'No'
            'FLGADMINISTRADORA'#9'10'#9'FLGADMINISTRADORA'#9'No'
            'FLGEMPRESAEMITENTETITULOS'#9'10'#9'FLGEMPRESAEMITENTETITULOS'#9'No'
            'FLGFORNECEDORSERVICOS'#9'10'#9'FLGFORNECEDORSERVICOS'#9'No'
            'FLGBANCO'#9'10'#9'FLGBANCO'#9'No'
            'FLGBOLSA'#9'10'#9'FLGBOLSA'#9'No'
            'FLGAUTARQUIA'#9'10'#9'FLGAUTARQUIA'#9'No'
            'FLGSINDICATO'#9'10'#9'FLGSINDICATO'#9'No'
            'FLGOUTRO'#9'10'#9'FLGOUTRO'#9'No')
          LookupField = 'NOMEFANTASIA'
          Options = [loTitles]
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object dblkpcmbPlano: TwwDBLookupCombo
          Left = 6
          Top = 64
          Width = 229
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'50'#9'Plano')
          LookupField = 'NOME'
          Options = [loTitles]
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
      end
      object GroupBox5: TGroupBox
        Left = 251
        Top = 3
        Width = 332
        Height = 93
        Caption = 'Inscrição'
        TabOrder = 1
        object Label8: TLabel
          Left = 6
          Top = 15
          Width = 44
          Height = 13
          Caption = 'Número'
        end
        object Label9: TLabel
          Left = 135
          Top = 15
          Width = 28
          Height = 13
          Caption = 'Data'
        end
        object Label2: TLabel
          Left = 6
          Top = 53
          Width = 141
          Height = 13
          Caption = 'Situação do Participante'
        end
        object mskdlgDataInsc: TcmMaskEditDlg
          Left = 135
          Top = 27
          Width = 121
          Height = 21
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
          BtnNumGlyphs = 1
          BtnWidth = 17
        end
        object TEdit
          Left = 6
          Top = 27
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object dblkpcmbSituacao: TwwDBLookupCombo
          Left = 6
          Top = 66
          Width = 250
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'Situação do Participante')
          LookupField = 'DESCRICAO'
          Options = [loTitles]
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
      end
      object RadioGroup1: TRadioGroup
        Left = 4
        Top = 99
        Width = 240
        Height = 67
        Caption = 'Participante'
        Items.Strings = (
          'Assistido'
          'Contribuinte'
          'Todos')
        TabOrder = 2
      end
      object rgrpStatusInsc: TRadioGroup
        Left = 251
        Top = 99
        Width = 332
        Height = 67
        Caption = 'Situação da Inscrição'
        Columns = 2
        Items.Strings = (
          'Normal'
          'Cancelada por Inadimplência'
          'Suspensa'
          'Cancelada por Desistência')
        TabOrder = 3
      end
    end
    object tbsAvancada: TTabSheet
      Caption = 'Avançada'
      object lstTabelas: TListBox
        Left = 3
        Top = 3
        Width = 121
        Height = 172
        ItemHeight = 13
        Items.Strings = (
          'Participante'
          'Dependente'
          'Beneficiário'
          'Contribuição'
          'Benefício')
        TabOrder = 0
      end
      object pnlPesqAvanc: TPanel
        Left = 135
        Top = 3
        Width = 430
        Height = 172
        BevelOuter = bvLowered
        Caption = 'pnlPesqAvanc'
        TabOrder = 1
        object Label3: TLabel
          Left = 6
          Top = 3
          Width = 39
          Height = 13
          Caption = 'Campo'
        end
        object Label5: TLabel
          Left = 6
          Top = 132
          Width = 55
          Height = 13
          Caption = 'Conteúdo'
        end
        object sbtnOU: TSpeedButton
          Left = 180
          Top = 65
          Width = 25
          Height = 25
          Hint = 'OU'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
            00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
            70E337F3333F333337F3E0F33303333370E337F3337FF33337F3E0F333003333
            70E337F33377FF3337F3E0F33300033370E337F333777FF337F3E0F333000033
            70E337F33377773337F3E0F33300033370E337F33377733337F3E0F333003333
            70E337F33377333337F3E0F33303333370E337F33373333337F3E0F333333333
            70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
            00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
        end
        object sbtnE: TSpeedButton
          Left = 180
          Top = 30
          Width = 25
          Height = 25
          Hint = 'E '
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
            00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
            70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
            70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
            70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
            70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
            70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
            00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
        end
        object sbtnApagar: TSpeedButton
          Left = 180
          Top = 99
          Width = 25
          Height = 25
          Hint = 'Apagar linha'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
            00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
            70E337F33333333337F3E0F33333333370E337F3333F3FF337F3E0F333030033
            70E337F3337F77F337F3E0F33003003370E337F3377F77F337F3E0F300030033
            70E337F3777F77F337F3E0F33003003370E337F3377F77F337F3E0F333030033
            70E337F33373773337F3E0F33333333370E337F33333333337F3E0F333333333
            70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
            00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
        end
        object rgrpSinal: TRadioGroup
          Left = 6
          Top = 93
          Width = 163
          Height = 37
          Caption = 'rgrpSinal'
          Columns = 5
          Items.Strings = (
            '='
            '>'
            '<'
            '>='
            '<=')
          TabOrder = 0
        end
        object lstCampo: TListBox
          Left = 6
          Top = 15
          Width = 166
          Height = 76
          ItemHeight = 13
          TabOrder = 1
        end
        object edConteudo: TEdit
          Left = 6
          Top = 144
          Width = 166
          Height = 21
          TabOrder = 2
          Text = 'edConteudo'
        end
        object lstResult: TListBox
          Left = 213
          Top = 6
          Width = 208
          Height = 160
          ItemHeight = 13
          TabOrder = 3
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Configurações'
      object Label6: TLabel
        Left = 18
        Top = 8
        Width = 54
        Height = 13
        Caption = 'Etiquetas'
      end
      object Label15: TLabel
        Left = 282
        Top = 59
        Width = 46
        Height = 13
        Caption = 'Páginas'
      end
      object DBLookupListBox1: TDBLookupListBox
        Left = 2
        Top = 27
        Width = 223
        Height = 147
        TabOrder = 0
      end
      object GroupBox2: TGroupBox
        Left = 228
        Top = 79
        Width = 147
        Height = 97
        Caption = 'Por Página'
        TabOrder = 1
        object Label10: TLabel
          Left = 11
          Top = 24
          Width = 62
          Height = 13
          Caption = 'Etiquetas :'
        end
        object Label11: TLabel
          Left = 17
          Top = 40
          Width = 54
          Height = 13
          Caption = 'Colunas :'
        end
        object Label12: TLabel
          Left = 24
          Top = 56
          Width = 46
          Height = 13
          Caption = 'Linhas :'
        end
        object Edit1: TEdit
          Left = 73
          Top = 24
          Width = 49
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object Edit2: TEdit
          Left = 73
          Top = 40
          Width = 49
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
        object Edit3: TEdit
          Left = 73
          Top = 56
          Width = 49
          Height = 21
          ReadOnly = True
          TabOrder = 2
        end
      end
      object TEdit
        Left = 229
        Top = 54
        Width = 47
        Height = 21
        TabOrder = 2
      end
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 76
    Top = 211
  end
end
