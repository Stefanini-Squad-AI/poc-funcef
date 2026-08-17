inherited RptCAFBalPatBem: TRptCAFBalPatBem
  Left = 504
  Top = 409
  Width = 289
  Height = 133
  Caption = 'Balancete Patrimonial por Bem'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Balancete Patrimonial por Bem'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Movimento Atualizado até'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = True
      end
      item
        Caption = 'Grupo Contábil'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CLASSE, NOME, IDGRUPO'
          'FROM GRUPO'
          'WHERE TIPO = '#39'A'#39
          'ORDER BY CLASSE')
        LookupSettings.Chave = 'IDGRUPO'
        LookupSettings.Display = 'NOME|CLASSE'
        LookupSettings.Descricao = 'Grupo Contábil|Código'
        LookupSettings.Tamanho = '40|8'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
      end
      item
        Caption = 'Seleção'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Completo'
          'Totalmente Depreciados'
          'Parcialmente Depreciados')
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 60
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
      end
      item
        Caption = 'Incluir os Bens com Controle Físico'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
      end
      item
        Caption = 'Excluir os Bens Baixados'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
      end>
    Formheight = 240
    Left = 16
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    DataBaseName = 'BaseDados'
    LabelSistema = LblSistema
    Left = 80
  end
  object qryBalPatBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT B.IDBEM, B.PLACA, G.NOME, B.DESBEM, B.DTAINCLUSAO, B.TAXA' +
        'DEP, B.IDNOTA, B.COMPLNOTA,'
      
        '       B.DATAULTDEP, B.VALHISTORICO, B.FLGDEPREC, C.DESCCONJUNTO' +
        ', P.NOME AS NOMEFORN,'
      '       ('
      '       (NVL(BEMACUM.VALBEMACUM,0) +'
      '        NVL(REAVACUM.VALREAVACUM,0) +'
      '        NVL(ACRESACUM.VALACRESACUM,0)) -'
      '       (NVL(BXBEMACUM.BXVALBEMACUM,0) +'
      '        NVL(BXREAVACUM.BXVALREAVACUM,0) +'
      '        NVL(BXACRESACUM.BXVALACRESACUM,0))) AS VALORG0,'
      ''
      '       (NVL(CMBEMACUM.VALCMBEMACUM,0) +'
      '        NVL(CMREAVACUM.VALCMREAVACUM,0) +'
      '        NVL(CMACRESACUM.VALCMACRESACUM,0) -'
      '        NVL(BXCMBEMACUM.BXVALCMBEMACUM,0) -'
      '        NVL(BXCMREAVACUM.BXVALCMREAVACUM,0) -'
      '        NVL(BXCMACRESACUM.BXVALCMACRESACUM,0)) AS CMBEM0,'
      ''
      '       (NVL(DEPBEMACUM.VALDEPBEMACUM,0) +'
      '        NVL(DEPREAVACUM.VALDEPREAVACUM,0) +'
      '        NVL(DEPACRESACUM.VALDEPACRESACUM,0) -'
      '        NVL(BXDEPBEMACUM.BXVALDEPBEMACUM,0) -'
      '        NVL(BXDEPREAVACUM.BXVALDEPREAVACUM,0) -'
      '        NVL(BXDEPACRESACUM.BXVALDEPACRESACUM,0)) AS DEPLANC0,'
      ''
      '       (NVL(DEPBEMATU.VALDEPBEMATU,0) +'
      '        NVL(DEPREAVATU.VALDEPREAVATU,0) +'
      '        NVL(DEPACRESATU.VALDEPACRESATU,0) -'
      '        NVL(BXDEPBEMATU.BXVALDEPBEMATU,0) -'
      '        NVL(BXDEPREAVATU.BXVALDEPREAVATU,0) -'
      '        NVL(BXDEPACRESATU.BXVALDEPACRESATU,0)) AS DEPLANCATU0,'
      ''
      '       (NVL(CMDEPBEMACUM.VALCMDEPBEMACUM,0) +'
      '        NVL(CMDEPREAVACUM.VALCMDEPREAVACUM,0) +'
      '        NVL(CMDEPACRESACUM.VALCMDEPACRESACUM,0) -'
      '        NVL(BXCMDEPBEMACUM.BXVALCMDEPBEMACUM,0) -'
      '        NVL(BXCMDEPREAVACUM.BXVALCMDEPREAVACUM,0) -'
      '        NVL(BXCMDEPACRESACUM.BXVALCMDEPACRESACUM,0)) AS CMDEP0,'
      '       (('
      '       (NVL(BEMACUM.VALBEMACUM,0) +'
      '        NVL(REAVACUM.VALREAVACUM,0) +'
      '        NVL(ACRESACUM.VALACRESACUM,0) +'
      '        NVL(CMBEMACUM.VALCMBEMACUM,0) +'
      '        NVL(CMREAVACUM.VALCMREAVACUM,0) +'
      '        NVL(CMACRESACUM.VALCMACRESACUM,0) ) -'
      ''
      '       (NVL(DEPBEMACUM.VALDEPBEMACUM,0) +'
      '        NVL(DEPREAVACUM.VALDEPREAVACUM,0) +'
      '        NVL(DEPACRESACUM.VALDEPACRESACUM,0) +'
      '        NVL(CMDEPBEMACUM.VALCMDEPBEMACUM,0) +'
      '        NVL(CMDEPREAVACUM.VALCMDEPREAVACUM,0) +'
      '        NVL(CMDEPACRESACUM.VALCMDEPACRESACUM,0) )'
      '       ) -'
      '       ('
      '       (NVL(BXBEMACUM.BXVALBEMACUM,0) +'
      '        NVL(BXREAVACUM.BXVALREAVACUM,0) +'
      '        NVL(BXACRESACUM.BXVALACRESACUM,0) +'
      '        NVL(BXCMBEMACUM.BXVALCMBEMACUM,0) +'
      '        NVL(BXCMREAVACUM.BXVALCMREAVACUM,0) +'
      '        NVL(BXCMACRESACUM.BXVALCMACRESACUM,0) ) -'
      ''
      '       (NVL(BXDEPBEMACUM.BXVALDEPBEMACUM,0) +'
      '        NVL(BXDEPREAVACUM.BXVALDEPREAVACUM,0) +'
      '        NVL(BXDEPACRESACUM.BXVALDEPACRESACUM,0) +'
      '        NVL(BXCMDEPBEMACUM.BXVALCMDEPBEMACUM,0) +'
      '        NVL(BXCMDEPREAVACUM.BXVALCMDEPREAVACUM,0) +'
      
        '        NVL(BXCMDEPACRESACUM.BXVALCMDEPACRESACUM,0) ))) AS VALCT' +
        'B0'
      ''
      'FROM BEM B, GRUPO G, CONJUNTO C, PESSOA P,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (01,41))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BEMACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (08,32,45))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) REAVACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (09,49))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ACRESACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (15,42))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMREAVACU' +
        'M'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMACRESAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (34,50))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPBEMACU' +
        'M'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (14,17,43))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPREAVAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (18,33,47))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPACRESA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (35,51))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPACRESACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (14,17,43))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPBEMATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPREAVAT' +
        'U'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (18,33,47))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPREAVATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPACRESA' +
        'TU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (35,51))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPACRESATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPBEMA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (21,44))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPREAV' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (19,48))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPACRE' +
        'SACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (36,52))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPACRESACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 6)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALREAVACU' +
        'M'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 20)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALACRESAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 37)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMBEMAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 25)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMREAVA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 28)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMACRES' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 38)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPBEMA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 24)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPREAV' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 27)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPACRE' +
        'SACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 39)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPBEMA' +
        'TU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 24)'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPBEMATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPREAV' +
        'ATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 27)'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPREAVATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPACRE' +
        'SATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 39)'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPACRESATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPBE' +
        'MACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 26)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPRE' +
        'AVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 29)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPAC' +
        'RESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 40)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPACRESACUM'
      ''
      'WHERE ((B.DTAINCLUSAO <= :PDATAMOV) OR (B.DTAINCLUSAO IS NULL))'
      ''
      '  AND ((B.FLGDEPREC = :PDEPREC) OR (B.FLGDEPREC = :PNOTDEPREC))'
      ''
      ''
      '  AND (B.IDBEM = BEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = REAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = ACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = CMREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPREAVATU.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = BXCMREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPREAVATU.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPACRESACUM.IDBEM(+))'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      '  AND (B.IDFORNSERV = P.IDPESSOA(+))'
      ''
      'ORDER BY G.CLASSE, B.DTAINCLUSAO')
    ValidateWithMask = True
    Left = 214
    Top = 48
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PDEPREC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PNOTDEPREC'
        ParamType = ptUnknown
      end>
    object qryBalPatBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryBalPatBemPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryBalPatBemNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryBalPatBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryBalPatBemDTAINCLUSAO: TDateTimeField
      FieldName = 'DTAINCLUSAO'
    end
    object qryBalPatBemTAXADEP: TFloatField
      FieldName = 'TAXADEP'
    end
    object qryBalPatBemDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object qryBalPatBemVALHISTORICO: TFloatField
      FieldName = 'VALHISTORICO'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatBemFLGDEPREC: TFloatField
      FieldName = 'FLGDEPREC'
    end
    object qryBalPatBemDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object qryBalPatBemVALORG0: TFloatField
      FieldName = 'VALORG0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatBemCMBEM0: TFloatField
      FieldName = 'CMBEM0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatBemDEPLANC0: TFloatField
      FieldName = 'DEPLANC0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatBemDEPLANCATU0: TFloatField
      FieldName = 'DEPLANCATU0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatBemCMDEP0: TFloatField
      FieldName = 'CMDEP0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatBemVALCTB0: TFloatField
      FieldName = 'VALCTB0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatBemNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      Size = 60
    end
    object qryBalPatBemIDNOTA: TStringField
      FieldName = 'IDNOTA'
      Size = 18
    end
    object qryBalPatBemCOMPLNOTA: TStringField
      FieldName = 'COMPLNOTA'
      Size = 5
    end
  end
  object dsBalPatBem: TwwDataSource
    DataSet = qryBalPatBem
    Left = 215
    Top = 35
  end
  object ppBalPatBem: TppBDEPipeline
    DataSource = dsBalPatBem
    UserName = 'BalPatBem'
    Left = 215
    Top = 21
    object ppBalPatBemppField1: TppField
      FieldAlias = 'IDBEM'
      FieldName = 'IDBEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBalPatBemppField2: TppField
      FieldAlias = 'PLACA'
      FieldName = 'PLACA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBalPatBemppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBalPatBemppField4: TppField
      FieldAlias = 'DESBEM'
      FieldName = 'DESBEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBalPatBemppField5: TppField
      FieldAlias = 'DTAINCLUSAO'
      FieldName = 'DTAINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBalPatBemppField6: TppField
      FieldAlias = 'TAXADEP'
      FieldName = 'TAXADEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBalPatBemppField7: TppField
      FieldAlias = 'DATAULTDEP'
      FieldName = 'DATAULTDEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBalPatBemppField8: TppField
      FieldAlias = 'VALHISTORICO'
      FieldName = 'VALHISTORICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBalPatBemppField9: TppField
      FieldAlias = 'FLGDEPREC'
      FieldName = 'FLGDEPREC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBalPatBemppField10: TppField
      FieldAlias = 'DESCCONJUNTO'
      FieldName = 'DESCCONJUNTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppBalPatBemppField11: TppField
      FieldAlias = 'VALORG0'
      FieldName = 'VALORG0'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppBalPatBemppField12: TppField
      FieldAlias = 'CMBEM0'
      FieldName = 'CMBEM0'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppBalPatBemppField13: TppField
      FieldAlias = 'DEPLANC0'
      FieldName = 'DEPLANC0'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppBalPatBemppField14: TppField
      FieldAlias = 'DEPLANCATU0'
      FieldName = 'DEPLANCATU0'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppBalPatBemppField15: TppField
      FieldAlias = 'CMDEP0'
      FieldName = 'CMDEP0'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppBalPatBemppField16: TppField
      FieldAlias = 'VALCTB0'
      FieldName = 'VALCTB0'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppBalPatBemppField17: TppField
      FieldAlias = 'NOMEFORN'
      FieldName = 'NOMEFORN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppBalPatBemppField18: TppField
      FieldAlias = 'IDNOTA'
      FieldName = 'IDNOTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppBalPatBemppField19: TppField
      FieldAlias = 'COMPLNOTA'
      FieldName = 'COMPLNOTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
  end
  object qryParamCaf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MASCCODGRUPO, IDPESSOA'
      'FROM    PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDPESSOA)')
    ValidateWithMask = True
    Left = 24
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamCafMASCCODGRUPO: TStringField
      FieldName = 'MASCCODGRUPO'
      Origin = '"CM.PARAMETROSCAFMANUT".MASCCODGRUPO'
    end
    object qryParamCafIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.PARAMETROSCAFMANUT".IDPESSOA'
    end
  end
  object rpBalPatBem: TppReport
    AutoStop = False
    DataPipeline = ppBalPatBem
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 12000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 215
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21696
      mmPrintPosition = 0
      object ppLabel60: TppLabel
        UserName = 'ppLabel60'
        Caption = 'Balancete Patrimonial por Bem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 69850
        mmTop = 8731
        mmWidth = 62706
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'ppLine13'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 21431
        mmWidth = 197300
        BandType = 0
      end
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84931
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object rpBalPatBemLabel2: TppLabel
        UserName = 'rpBalPatBemLabel2'
        Caption = 'Movimentação até '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 76729
        mmTop = 15081
        mmWidth = 28840
        BandType = 0
      end
      object rpBalPatBemLabel3: TppLabel
        UserName = 'rpBalPatBemLabel3'
        Caption = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 105569
        mmTop = 15081
        mmWidth = 20108
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 21960
      mmPrintPosition = 0
      object rpBemResumLabel2: TppLabel
        UserName = 'rpBemResumLabel2'
        Caption = 'Patrimônio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object rpBemResumLabel3: TppLabel
        UserName = 'rpBemResumLabel3'
        Caption = 'Bem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 10319
        mmWidth = 6615
        BandType = 4
      end
      object rpBemResumLabel4: TppLabel
        UserName = 'rpBemResumLabel4'
        Caption = 'Ultima Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 6879
        mmWidth = 27517
        BandType = 4
      end
      object rpBemResumLabel5: TppLabel
        UserName = 'rpBemResumLabel5'
        Caption = 'Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3440
        mmWidth = 14288
        BandType = 4
      end
      object rpBemResumLabel6: TppLabel
        UserName = 'rpBemResumLabel6'
        Caption = 'Taxa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 60325
        mmTop = 6879
        mmWidth = 6615
        BandType = 4
      end
      object rpBemResumLabel7: TppLabel
        UserName = 'rpBemResumLabel7'
        Caption = 'Valor  Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object rpBemResumLabel8: TppLabel
        UserName = 'rpBemResumLabel8'
        Caption = 'Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 3440
        mmWidth = 17727
        BandType = 4
      end
      object rpBemResumLabel9: TppLabel
        UserName = 'rpBemResumLabel9'
        Caption = 'Depr.Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 6879
        mmWidth = 19050
        BandType = 4
      end
      object rpBemResumLabel10: TppLabel
        UserName = 'rpBemResumLabel10'
        Caption = 'C.M.Bem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 150284
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object rpBemResumLabel11: TppLabel
        UserName = 'rpBemResumLabel11'
        Caption = 'C.M. Deprec.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 150284
        mmTop = 3440
        mmWidth = 18256
        BandType = 4
      end
      object rpBemResumLabel12: TppLabel
        UserName = 'rpBemResumLabel12'
        Caption = 'Vl Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 150284
        mmTop = 6879
        mmWidth = 15610
        BandType = 4
      end
      object rpBemResumDBText2: TppDBText
        UserName = 'rpBemResumDBText2'
        AutoSize = True
        DataField = 'PLACA'
        DataPipeline = ppBalPatBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 18785
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object rpBemResumDBText4: TppDBText
        UserName = 'rpBemResumDBText4'
        DataField = 'DATAULTDEP'
        DataPipeline = ppBalPatBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 28310
        mmTop = 6879
        mmWidth = 19315
        BandType = 4
      end
      object rpBemResumDBText5: TppDBText
        UserName = 'rpBemResumDBText5'
        AutoSize = True
        DataField = 'DTAINCLUSAO'
        DataPipeline = ppBalPatBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 18785
        mmTop = 3440
        mmWidth = 20108
        BandType = 4
      end
      object rpBemResumDBText6: TppDBText
        UserName = 'rpBemResumDBText6'
        DataField = 'TAXADEP'
        DataPipeline = ppBalPatBem
        DisplayFormat = '0.000000 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 67469
        mmTop = 6879
        mmWidth = 21960
        BandType = 4
      end
      object rpBemResumDBText7: TppDBText
        UserName = 'rpBemResumDBText7'
        DataField = 'VALORG0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 0
        mmWidth = 26458
        BandType = 4
      end
      object rpBemResumDBText8: TppDBText
        UserName = 'rpBemResumDBText8'
        DataField = 'DEPLANC0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 3440
        mmWidth = 26458
        BandType = 4
      end
      object rpBemResumDBText9: TppDBText
        UserName = 'rpBemResumDBText9'
        DataField = 'DEPLANCATU0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 6879
        mmWidth = 26458
        BandType = 4
      end
      object rpBemResumDBText10: TppDBText
        UserName = 'rpBemResumDBText10'
        DataField = 'CMBEM0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170392
        mmTop = 0
        mmWidth = 26723
        BandType = 4
      end
      object rpBemResumDBText11: TppDBText
        UserName = 'rpBemResumDBText11'
        DataField = 'CMDEP0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170392
        mmTop = 3440
        mmWidth = 26723
        BandType = 4
      end
      object rpBemResumDBText12: TppDBText
        UserName = 'rpBemResumDBText12'
        DataField = 'VALCTB0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170392
        mmTop = 6879
        mmWidth = 26723
        BandType = 4
      end
      object rpBemResumDBText3: TppDBText
        UserName = 'rpBemResumDBText3'
        DataField = 'DESBEM'
        DataPipeline = ppBalPatBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 18785
        mmTop = 10319
        mmWidth = 178330
        BandType = 4
      end
      object rpBemResumLine1: TppLine
        UserName = 'rpBemResumLine1'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20638
        mmWidth = 197115
        BandType = 4
      end
      object rpBemResumLabel27: TppLabel
        UserName = 'rpBemResumLabel27'
        Caption = 'Conjunto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 13758
        mmWidth = 13229
        BandType = 4
      end
      object rpBemResumDBText14: TppDBText
        UserName = 'rpBemResumDBText14'
        DataField = 'DESCCONJUNTO'
        DataPipeline = ppBalPatBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 18785
        mmTop = 13758
        mmWidth = 178330
        BandType = 4
      end
      object rpBemResumLabel28: TppLabel
        UserName = 'rpBemResumLabel28'
        Caption = 'a.a.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 89694
        mmTop = 6879
        mmWidth = 4763
        BandType = 4
      end
      object rpBalPatBemLabel1: TppLabel
        UserName = 'rpBalPatBemLabel1'
        Caption = 'Valor Original'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 46567
        mmTop = 3440
        mmWidth = 19579
        BandType = 4
      end
      object rpBalPatBemDBText1: TppDBText
        UserName = 'rpBalPatBemDBText1'
        DataField = 'VALHISTORICO'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 71438
        mmTop = 3440
        mmWidth = 25665
        BandType = 4
      end
      object rpBalPatBemLabel4: TppLabel
        UserName = 'rpBalPatBemLabel4'
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 17198
        mmWidth = 16933
        BandType = 4
      end
      object rpBalPatBemDBText2: TppDBText
        UserName = 'rpBalPatBemDBText2'
        DataField = 'NOMEFORN'
        DataPipeline = ppBalPatBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 18785
        mmTop = 17198
        mmWidth = 112184
        BandType = 4
      end
      object rpBalPatBemLabel5: TppLabel
        UserName = 'rpBalPatBemLabel5'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 133350
        mmTop = 17198
        mmWidth = 16669
        BandType = 4
      end
      object rpBalPatBemDBText3: TppDBText
        UserName = 'rpBalPatBemDBText3'
        DataField = 'IDNOTA'
        DataPipeline = ppBalPatBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 151607
        mmTop = 17198
        mmWidth = 26458
        BandType = 4
      end
      object rpBalPatBemDBText4: TppDBText
        UserName = 'rpBalPatBemDBText4'
        DataField = 'COMPLNOTA'
        DataPipeline = ppBalPatBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 179917
        mmTop = 17198
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppLine14: TppLine
        UserName = 'ppLine14'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197380
        BandType = 8
      end
      object LblSistema: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 794
        mmWidth = 75406
        BandType = 8
      end
      object ppCalc13: TppSystemVariable
        UserName = 'Calc13'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 78317
        mmTop = 794
        mmWidth = 39952
        BandType = 8
      end
      object ppCalc14: TppSystemVariable
        UserName = 'Calc14'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 168805
        mmTop = 794
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpBemResumSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object rpBemResumLabel20: TppLabel
        UserName = 'rpBemResumLabel20'
        Caption = 'Totalização do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 32015
        BandType = 7
      end
      object rpBemResumLabel21: TppLabel
        UserName = 'rpBemResumLabel21'
        Caption = 'Vl Corrigido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 0
        mmWidth = 17463
        BandType = 7
      end
      object rpBemResumLabel22: TppLabel
        UserName = 'rpBemResumLabel22'
        Caption = 'Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 3440
        mmWidth = 17727
        BandType = 7
      end
      object rpBemResumLabel23: TppLabel
        UserName = 'rpBemResumLabel23'
        Caption = 'Depr.Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 6879
        mmWidth = 19050
        BandType = 7
      end
      object rpBemResumDBCalc7: TppDBCalc
        UserName = 'rpBemResumDBCalc7'
        DataField = 'DEPLANCATU0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 120650
        mmTop = 6879
        mmWidth = 23813
        BandType = 7
      end
      object rpBemResumDBCalc8: TppDBCalc
        UserName = 'rpBemResumDBCalc8'
        DataField = 'DEPLANC0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 120650
        mmTop = 3440
        mmWidth = 23813
        BandType = 7
      end
      object rpBemResumDBCalc9: TppDBCalc
        UserName = 'rpBemResumDBCalc9'
        DataField = 'VALORG0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 120650
        mmTop = 0
        mmWidth = 23813
        BandType = 7
      end
      object rpBemResumLabel24: TppLabel
        UserName = 'rpBemResumLabel24'
        Caption = 'C.M.Bem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 147638
        mmTop = 0
        mmWidth = 12965
        BandType = 7
      end
      object rpBemResumLabel25: TppLabel
        UserName = 'rpBemResumLabel25'
        Caption = 'C.M. Deprec.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 147638
        mmTop = 3440
        mmWidth = 18256
        BandType = 7
      end
      object rpBemResumLabel26: TppLabel
        UserName = 'rpBemResumLabel26'
        Caption = 'Vl Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 147638
        mmTop = 6879
        mmWidth = 15610
        BandType = 7
      end
      object rpBemResumDBCalc10: TppDBCalc
        UserName = 'rpBemResumDBCalc10'
        DataField = 'VALCTB0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 6879
        mmWidth = 23813
        BandType = 7
      end
      object rpBemResumDBCalc11: TppDBCalc
        UserName = 'rpBemResumDBCalc11'
        DataField = 'CMDEP0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 3440
        mmWidth = 23813
        BandType = 7
      end
      object rpBemResumDBCalc12: TppDBCalc
        UserName = 'rpBemResumDBCalc12'
        DataField = 'CMBEM0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 0
        mmWidth = 23813
        BandType = 7
      end
      object rpBemResumLine4: TppLine
        UserName = 'rpBemResumLine4'
        ParentWidth = True
        Position = lpBottom
        Style = lsDouble
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 11113
        mmWidth = 197300
        BandType = 7
      end
    end
    object rpBemResumGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppBalPatBem
      NewPage = True
      UserName = 'rpBemResumGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpBemResumGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object rpBemResumLabel1: TppLabel
          UserName = 'rpBemResumLabel1'
          Caption = 'GRUPO  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object rpBemResumDBText1: TppDBText
          UserName = 'rpBemResumDBText1'
          DataField = 'NOME'
          DataPipeline = ppBalPatBem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 4763
          mmLeft = 17727
          mmTop = 0
          mmWidth = 166423
          BandType = 3
          GroupNo = 0
        end
        object rpBemResumLine2: TppLine
          UserName = 'rpBemResumLine2'
          ParentWidth = True
          Position = lpBottom
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 4498
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object rpBemResumGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object rpBemResumLabel13: TppLabel
          UserName = 'rpBemResumLabel13'
          Caption = 'Totalização do Grupo '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 0
          mmWidth = 31221
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumDBText13: TppDBText
          UserName = 'rpBemResumDBText13'
          DataField = 'NOME'
          DataPipeline = ppBalPatBem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsItalic]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 3440
          mmWidth = 96044
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumDBCalc1: TppDBCalc
          UserName = 'rpBemResumDBCalc1'
          DataField = 'VALORG0'
          DataPipeline = ppBalPatBem
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpBemResumGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 120915
          mmTop = 0
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumDBCalc2: TppDBCalc
          UserName = 'rpBemResumDBCalc2'
          DataField = 'DEPLANC0'
          DataPipeline = ppBalPatBem
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpBemResumGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 120915
          mmTop = 3440
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumDBCalc3: TppDBCalc
          UserName = 'rpBemResumDBCalc3'
          DataField = 'DEPLANCATU0'
          DataPipeline = ppBalPatBem
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpBemResumGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 120915
          mmTop = 6879
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumDBCalc4: TppDBCalc
          UserName = 'rpBemResumDBCalc4'
          DataField = 'CMBEM0'
          DataPipeline = ppBalPatBem
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpBemResumGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 171715
          mmTop = 0
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumDBCalc5: TppDBCalc
          UserName = 'rpBemResumDBCalc5'
          DataField = 'CMDEP0'
          DataPipeline = ppBalPatBem
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpBemResumGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 171715
          mmTop = 3440
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumDBCalc6: TppDBCalc
          UserName = 'rpBemResumDBCalc6'
          DataField = 'VALCTB0'
          DataPipeline = ppBalPatBem
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpBemResumGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 171715
          mmTop = 6879
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLabel14: TppLabel
          UserName = 'rpBemResumLabel14'
          Caption = 'Vl Corrigido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 97102
          mmTop = 0
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLabel15: TppLabel
          UserName = 'rpBemResumLabel15'
          Caption = 'Depreciação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 97102
          mmTop = 3440
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLabel16: TppLabel
          UserName = 'rpBemResumLabel16'
          Caption = 'Depr.Periodo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 97102
          mmTop = 6879
          mmWidth = 19050
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLabel17: TppLabel
          UserName = 'rpBemResumLabel17'
          Caption = 'C.M.Bem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 147902
          mmTop = 0
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLabel18: TppLabel
          UserName = 'rpBemResumLabel18'
          Caption = 'C.M. Deprec.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 147902
          mmTop = 3440
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLabel19: TppLabel
          UserName = 'rpBemResumLabel19'
          Caption = 'Vl Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 147902
          mmTop = 6879
          mmWidth = 15610
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLine3: TppLine
          UserName = 'rpBemResumLine3'
          ParentWidth = True
          Position = lpBottom
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 10583
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
