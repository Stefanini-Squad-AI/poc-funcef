unit FPRelRubrica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FReports_Folha, Db, StdCtrls, Wwdatsrc, DBTables, Wwquery, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, wwdblook, Spin,
  ExtCtrls, usistema, dbasedados, uObjFolha;

type
  TFrmPRelRubrica = class(TFrmReports_Folha)
    GroupBox1: TGroupBox;
    dblkRubricas: TwwDBLookupCombo;
    GrbPatrocinadora: TGroupBox;
    dblkPatrocinadora: TwwDBLookupCombo;
    ChkConsolidar: TCheckBox;
    GrbPlano: TGroupBox;
    dblkPlano: TwwDBLookupCombo;
    qryPlano: TwwQuery;
    qryPatro: TwwQuery;
    qryRubFolha: TwwQuery;
    RdoTipoOrdem: TRadioGroup;
    chkMostraEstornado: TCheckBox;
    lblPlanoPrev: TLabel;
    lblPlanoContabil: TLabel;
    dblkPlanoContabil: TwwDBLookupCombo;
    qryPlanoPrev: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblkPatrocinadoraChange(Sender: TObject);
    procedure dblkLoteouVersaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormShow(Sender: TObject);
    procedure RdoTipoFolhaClick(Sender: TObject);
    procedure RdoTipoFiltroClick(Sender: TObject);
    procedure SpnedAnoChange(Sender: TObject);
    procedure CmbMesChange(Sender: TObject);
    procedure MontaQryPatro;
    procedure MontaQryPlano;
    procedure MontaQryPlanoPrev;
    procedure dblkPlanoChange(Sender: TObject);

  private
    { Private declarations }
    procedure MontaQuery;
    procedure ControlClick;
  public
    { Public declarations }
    sMesRef : String;
    sSql : String;
    iOpEscolha : Integer;
    //1-Previa e Lote 2-Previa e Mês 3-Efetivada e Versão 4-Efetivada e Mês
  end;

var
  FrmPRelRubrica: TFrmPRelRubrica;

implementation

uses dRelRubricas, fAguarde, uAdmPrevFB;

{$R *.DFM}

procedure TFrmPRelRubrica.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  // verifica se foi prenchido o histórico.
  Case iOpEscolha Of
    1:  If (dblkLoteouVersao.LookupValue <> '') Then
        Begin
          If (dblkRubricas.LookupValue <> '') Then
          Begin
            MontaQuery;
            dtmRelRubricas.qrlblMesRef.caption := qryPreviaouEfetivada.FieldByName('DESCRICAO').AsString; 
          End
          Else
          Begin
            MessageDlg('A rubrica é obrigatória.',mtInformation,[mbOk],0);
            dblkRubricas.SetFocus; 
            ModalResult := mrNone;
            Exit;
          End;
        End
        Else
        Begin
          MessageDlg('O Lote é obrigatório.',mtInformation,[mbOk],0);
          dblkLoteouVersao.SetFocus;
          ModalResult := mrNone;
          Exit;
        End;

    2:  If (CmbMes.Text <> '') and (SpnedAno.Text <> '') Then
        Begin
          If (dblkRubricas.LookupValue <> '') Then
          Begin
            MontaQuery;
            dtmRelRubricas.qrlblMesRef.caption := sMesRef; 
          End
          Else
          Begin
            MessageDlg('A rubrica é obrigatória.',mtInformation,[mbOk],0);
            dblkRubricas.SetFocus; 
            ModalResult := mrNone;
            Exit;
          End;
        End
        Else
        Begin
          MessageDlg('O Mês e o Ano são campos obrigatórios.',mtInformation,[mbOk],0);
          CmbMes.SetFocus;
          ModalResult := mrNone;
          Exit;
        End;

    3:  If (dblkLoteouVersao.LookupValue <> '') Then
        Begin
          If (dblkRubricas.LookupValue <> '') Then
          Begin
            MontaQuery;
            dtmRelRubricas.qrlblMesRef.caption := qryPreviaouEfetivada.FieldByName('DESCRICAO').AsString; 
          End
          Else
          Begin
            MessageDlg('A rubrica é obrigatória.',mtInformation,[mbOk],0);
            dblkRubricas.SetFocus; 
            ModalResult := mrNone;
            Exit;
          End;
        End
        Else
        Begin
          MessageDlg('O Histórico é obrigatório.',mtInformation,[mbOk],0);
          dblkLoteouVersao.SetFocus;
          ModalResult := mrNone;
          Exit;
        End;

    4:  If (CmbMes.Text <> '') and (SpnedAno.Text <> '') Then
        Begin
          If (dblkRubricas.LookupValue <> '') Then
          Begin
            MontaQuery;
            dtmRelRubricas.qrlblMesRef.caption := sMesRef;
          End
          Else
          Begin
            MessageDlg('A rubrica é obrigatória.',mtInformation,[mbOk],0);
            dblkRubricas.SetFocus; 
            ModalResult := mrNone;
            Exit;
          End;
        End
        Else
        Begin
          MessageDlg('O Mês e o Ano são campos obrigatórios.',mtInformation,[mbOk],0);
          CmbMes.SetFocus;
          ModalResult := mrNone;
          Exit;
        End;
  End;

  If dblkPlano.Text <> '' Then
    dtmRelRubricas.qrLblPlano.caption  := dblkPlano.Text
  else
    dtmRelRubricas.qrLblPlano.caption := 'Todos';

  If dblkPlanoContabil.Text <> '' Then
    dtmRelRubricas.pplblPlanoContabil.caption  := dblkPlanoContabil.Text
  else
    dtmRelRubricas.pplblPlanoContabil.caption := 'Todos';

  If ChkConsolidar.Checked Then
  Begin
    dtmRelRubricas.ppRubricasGroupFooterBand1.Visible := False;
    dtmRelRubricas.ppLine65.Visible                   := True;
  End
  Else
  Begin
    dtmRelRubricas.ppRubricasGroupFooterBand1.Visible := True;
    dtmRelRubricas.ppLine65.Visible                   := False;
  End;
end;

procedure TFrmPRelRubrica.MontaQuery;
begin
  If (cmbMes.ItemIndex+1) > 9 Then
    sMesRef := IntToStr(spnedAno.Value)+'/'+IntToStr(cmbMes.ItemIndex+1)
  Else
    sMesRef := IntToStr(spnedAno.Value)+'/0'+IntToStr(cmbMes.ItemIndex+1);

  With dtmRelRubricas.qryRubricas Do
  Begin 
    Sql.Clear;
    If (ChkConsolidar.Checked) Then // consolidada
      Sql.Add(
        'SELECT ''Todas'' AS NOMEPATRO, HS.MES, HS.MESCOBRANCA, HS.IDRESPONSAVEL, PPP.INSCRICAONUMERO, D.MATRICULA, P.NOME, '+
        '       DECODE(NVL(HS.FLGDESCONTO, PD.FLGDESCONTO) ,0,''Rubrica de Crédito : '',1,''Rubrica de Débito : '')|| ')

    Else // agrupada
      Sql.Add(
        'SELECT PJR.NOME AS NOMEPATRO, HS.MESCOBRANCA, HS.MES, HS.IDPATRO, P.NOME, HS.IDRESPONSAVEL, PPP.INSCRICAONUMERO, D.MATRICULA, P.NOME, '+
        ' DECODE(NVL(HS.FLGDESCONTO, PD.FLGDESCONTO) ,0,''Rubrica de Crédito : '',1,''Rubrica de Débito : '')|| ');

    If SistemaFolha.FlgUsaCodRubExt = 0 Then
      Sql.Add('PD.IDPROVENTO||'' - ''||PD.DESCRICAO AS TIPORUB, ')
    Else
      Sql.Add('DECODE(PD.CODPROVDESC, NULL, TO_CHAR(PD.IDPROVENTO, ''999999999''), PD.CODPROVDESC)||'' - ''||'+
              'DECODE(PD.DESCRPROVDESC, NULL, PD.DESCRICAO, PD.DESCRPROVDESC) AS TIPORUB, ');

    Sql.Add('DECODE(NVL(HS.FLGDESCONTO, PD.FLGDESCONTO) ,0,''Recebedor Creditado'',1,''Recebedor Debitado'') AS TITULO1, '+
            'DECODE(NVL(HS.FLGDESCONTO, PD.FLGDESCONTO) ,0,''Valor do Crédito'',1,''Valor do Débito'') AS TITULO2, '+
            'DECODE(NVL(HS.FLGDESCONTO, PD.FLGDESCONTO) ,0,'''',1,''Resíduo'') AS TITULO3, '+
            'HS.VALORPROVENTO, '+
            'HS.VALORRECEBIDO, '+
            '(HS.VALORRECEBIDO-HS.VALORPROVENTO) AS RESIDUO ');

    If ChkConsolidar.Checked Then // consolidada
      Sql.Add('FROM '+Tabela+' HS, PROVDESC PD, PESSOA P, DEPENTIT D, PARTPREVPLAN PPP ')
    Else
      Sql.Add('FROM '+Tabela+' HS, PROVDESC PD, PESSOA P, PESSOA PJR, DEPENTIT D, PARTPREVPLAN PPP ');

    Sql.Add('WHERE ');

    case RdoTipoFolha.ItemIndex of
      0: If RdoTipoFiltro.ItemIndex = 0 Then
           Sql.Add(' HS.IDLOTE = '+qryPreviaouEfetivada.FieldByName('IDLOTE').AsString)
         else
           Sql.Add(' HS.MESCOBRANCA = ' + QuotedStr(sMesRef));

      1: If RdoTipoFiltro.ItemIndex = 0 Then
           Sql.Add(' HS.IDHSTFOLHABENEF = '+qryPreviaouEfetivada.FieldByName('IDHSTFOLHABENEF').AsString)
         else
           Sql.Add(' HS.MESCOBRANCA = ' + QuotedStr(sMesRef));
    end;

    If dblkRubricas.Text <> '' Then 
      Sql.Add(' AND HS.IDRUBRICA = '+dblkRubricas.LookupValue); 

    If Tabela = 'HISTRUBSAL' Then 
      If Not chkMostraEstornado.Checked Then   
        Sql.Add(' AND (HS.FLGESTORNO = 0 OR HS.FLGESTORNO IS NULL) ');

    If dblkPatrocinadora.Text <> '' Then
      Sql.Add(' AND HS.IDPATRO = '+dblkPatrocinadora.LookupValue);

    If (dblkPlano.LookupValue <> '') Then
      Sql.Add(' AND HS.IDPLANOPREV = '+dblkPlano.LookupValue);

    If (dblkPlanoContabil.LookupValue <> '') Then
      Sql.Add(' AND HS.IDPLANOCONTABIL = '+dblkPlanoContabil.LookupValue);

    Sql.Add(' AND PD.IDPROVENTO   = HS.IDRUBRICA     '+
            ' AND PPP.IDPESSJUR   = HS.IDPATRO       '+
            ' AND ((PPP.IDPLANOPREV = HS.IDPLANOPREV AND HS.IDTITULAR = HS.IDPESSOA) '+
              ' OR (PPP.IDPLANOPREV = HS.IDPLANOORIGEM AND HS.IDTITULAR <> HS.IDPESSOA)) '+
            ' AND PPP.IDPESSOA    = HS.IDTITULAR     '+
            ' AND D.IDTITULAR(+)  = HS.IDTITULAR     '+ 
            ' AND D.IDPESSOA(+)   = HS.IDPESSOA      '+ 
            ' AND P.IDPESSOA      = HS.IDRESPONSAVEL ');

    If Not ChkConsolidar.Checked Then // consolidada
      Sql.add(' AND PJR.IDPESSOA = HS.IDPATRO ');

    If (ChkConsolidar.Checked) Or (dblkPatrocinadora.Text <> '') Then
    Begin
      Case RdoTipoOrdem.ItemIndex Of
        0: Sql.Add(' ORDER BY D.MATRICULA ');
        1: Sql.Add(' ORDER BY PPP.INSCRICAONUMERO ');
        2: Sql.Add(' ORDER BY P.NOME ');
      End;
    End
    Else
    Begin
      Case RdoTipoOrdem.ItemIndex Of
        0: Sql.Add(' ORDER BY NOMEPATRO, D.MATRICULA ');
        1: Sql.Add(' ORDER BY NOMEPATRO, PPP.INSCRICAONUMERO ');
        2: Sql.Add(' ORDER BY NOMEPATRO, P.NOME ');
      End;
    End;

    If dblkPlano.text <> '' Then
      dtmRelRubricas.qrLblPlano.Caption := dblkPlano.Text;

    frmAguarde.Mostra('Aguarde... Montando Relatório.');
    frmAguarde.Repaint;
    Open;
    frmAguarde.Apaga;
  end 
end;

procedure TFrmPRelRubrica.FormCreate(Sender: TObject);
begin
  inherited;
  qryPatro.Open;
  qryPlano.Open;
end;

procedure TFrmPRelRubrica.dblkPatrocinadoraChange(Sender: TObject);
begin
  inherited;
  If dblkPatrocinadora.Text <> '' Then
  Begin
    ChkConsolidar.Enabled := False;
    ChkConsolidar.Checked := False;
  End
  Else
    ChkConsolidar.Enabled := True;
  MontaQryPlano;
  MontaQryPlanoPrev;
end;

procedure TFrmPRelRubrica.dblkLoteouVersaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  With qryRubFolha Do
  Begin
    Close;
    Prepare;
    If dblkLoteouVersao.LookupValue = '' Then
      Exit;

    Case iOpEscolha of
      1: ParamByName('IDLOTE').AsInteger          := StrToInt(dblkLoteouVersao.LookupValue);
      3: ParamByName('IDHSTFOLHABENEF').AsInteger := StrToInt(dblkLoteouVersao.LookupValue);
    End;

    frmAguarde.Mostra('Verificando rubricas. Aguarde...');
    frmAguarde.Repaint;
    Open;
    frmAguarde.Apaga;
    dblkRubricas.Enabled := not IsEmpty;
  End;
  dblkPatrocinadora.Enabled := True;
  MontaQryPlano;
  MontaQryPlanoPrev;
end;

procedure TFrmPRelRubrica.FormShow(Sender: TObject);
begin
  ControlClick;
  inherited;
end;

procedure TFrmPRelRubrica.RdoTipoFolhaClick(Sender: TObject);
begin
  If RdoTipoFiltro.ItemIndex = 0 Then
    ControlClick
  Else
  Begin
    ControlClick;
    SpnedAnoChange(Self);
  End;
  inherited;
  dblkPatrocinadora.Clear;
  dblkPlano.Clear;
  dblkPlanoContabil.Clear;
end;

procedure TFrmPRelRubrica.RdoTipoFiltroClick(Sender: TObject);
begin
  ControlClick;
  inherited;
  dblkPatrocinadora.Clear;
  dblkPlano.Clear;
  dblkPlanoContabil.Clear;
end;

procedure TFrmPRelRubrica.ControlClick;
begin
  If RdoTipoFolha.ItemIndex = 0 Then
  Begin
    If RdoTipoFiltro.ItemIndex = 0 Then
    Begin
      iOpEscolha := 1;
      sSql := ' SELECT DISTINCT '+
              ' PD.IDPROVENTO AS IDRUBRICA, ';

      If SistemaFolha.FlgUsaCodRubExt = 0 Then
        ssql:=ssql+
              ' PD.IDPROVENTO||'' - ''||PD.DESCRICAO AS DESCRICAO '
      else
        ssql:=ssql+
              ' DECODE(PD.CODPROVDESC, NULL, TO_CHAR(PD.IDPROVENTO, ''999999999''), PD.CODPROVDESC)||'' - ''|| '+
              ' DECODE(PD.DESCRPROVDESC, NULL, PD.DESCRICAO, PD.DESCRPROVDESC) AS DESCRICAO ';

      ssql:=ssql+
              ' FROM PREVIA HRS, PROVDESC PD '+
              ' WHERE HRS.IDLOTE = :IDLOTE '+
              ' AND PD.IDPROVENTO = HRS.IDRUBRICA '+
              ' ORDER BY DESCRICAO ';

      qryRubFolha.Close;
      qryRubFolha.SQL.Clear;
      qryRubFolha.SQL.Add(sSql);
      dblkRubricas.Enabled     := False; 
      dblkRubricas.LookupField := '';
      dblkRubricas.LookupField := 'IDRUBRICA';
      dblkRubricas.Selected.add('DESCRICAO'+#9+'80'+#9+'Descrição');
      dblkRubricas.Refresh;
    End
    Else
    Begin
      iOpEscolha := 2;
      sSql := ' SELECT DISTINCT '+
              ' PD.IDPROVENTO AS IDRUBRICA, ';

      If SistemaFolha.FlgUsaCodRubExt = 0 Then
        ssql:=ssql+
              ' PD.IDPROVENTO||'' - ''||PD.DESCRICAO AS DESCRICAO '
      else
        ssql:=ssql+
              ' DECODE(PD.CODPROVDESC, NULL, TO_CHAR(PD.IDPROVENTO, ''999999999''), PD.CODPROVDESC)||'' - ''|| '+
              ' DECODE(PD.DESCRPROVDESC, NULL, PD.DESCRICAO, PD.DESCRPROVDESC) AS DESCRICAO ';

      ssql:=ssql+
              ' FROM PREVIA HRS, PROVDESC PD '+
              ' WHERE HRS.MESCOBRANCA = :MESREF '+
              ' AND PD.IDPROVENTO = HRS.IDRUBRICA '+
              ' ORDER BY DESCRICAO ';

      qryRubFolha.Close;
      qryRubFolha.SQL.Clear;
      qryRubFolha.SQL.Add(sSql);
      dblkRubricas.Enabled     := False; 
      dblkRubricas.LookupField := '';
      dblkRubricas.LookupField := 'IDRUBRICA';
      dblkRubricas.Selected.add('DESCRICAO'+#9+'80'+#9+'Descrição');
      dblkRubricas.Refresh;
    End
  End
  Else
  Begin
    If RdoTipoFiltro.ItemIndex = 0 Then
    Begin
      iOpEscolha := 3;
      sSql := ' SELECT DISTINCT '+
              ' PD.IDPROVENTO AS IDRUBRICA, ';

      If SistemaFolha.FlgUsaCodRubExt = 0 Then
        ssql:=ssql+
              ' PD.IDPROVENTO||'' - ''||PD.DESCRICAO AS DESCRICAO '
      else
        ssql:=ssql+
              ' DECODE(PD.CODPROVDESC, NULL, TO_CHAR(PD.IDPROVENTO, ''999999999''), PD.CODPROVDESC)||'' - ''|| '+
              ' DECODE(PD.DESCRPROVDESC, NULL, PD.DESCRICAO, PD.DESCRPROVDESC) AS DESCRICAO ';

      ssql:=ssql+
              ' FROM HISTRUBSAL HRS, PROVDESC PD '+
              ' WHERE HRS.IDHSTFOLHABENEF = :IDHSTFOLHABENEF '+
              ' AND PD.IDPROVENTO = HRS.IDRUBRICA '+
              ' ORDER BY DESCRICAO ';

      qryRubFolha.Close;
      qryRubFolha.SQL.Clear;
      qryRubFolha.SQL.Add(sSql);
      dblkRubricas.Enabled     := False; 
      dblkRubricas.LookupField := '';
      dblkRubricas.LookupField := 'IDRUBRICA';
      dblkRubricas.Selected.add('DESCRICAO'+#9+'80'+#9+'Descrição');
      dblkRubricas.Refresh;
    End
    Else
    Begin
      iOpEscolha := 4;
      sSql := ' SELECT DISTINCT '+
              ' PD.IDPROVENTO AS IDRUBRICA, ';

      If SistemaFolha.FlgUsaCodRubExt = 0 Then
        ssql:=ssql+
              ' PD.IDPROVENTO||'' - ''||PD.DESCRICAO AS DESCRICAO '
      else
        ssql:=ssql+
              ' DECODE(PD.CODPROVDESC, NULL, TO_CHAR(PD.IDPROVENTO, ''999999999''), PD.CODPROVDESC)||'' - ''|| '+
              ' DECODE(PD.DESCRPROVDESC, NULL, PD.DESCRICAO, PD.DESCRPROVDESC) AS DESCRICAO ';

      ssql:=ssql+
              ' FROM HISTRUBSAL HRS, PROVDESC PD '+
              ' WHERE HRS.MESCOBRANCA = :MESREF '+ 
              ' AND PD.IDPROVENTO = HRS.IDRUBRICA '+
              ' ORDER BY DESCRICAO ';

      qryRubFolha.Close;
      qryRubFolha.SQL.Clear;
      qryRubFolha.SQL.Add(sSql);
      dblkRubricas.Enabled     := False; 
      dblkRubricas.LookupField := '';
      dblkRubricas.LookupField := 'IDRUBRICA';
      dblkRubricas.Selected.add('DESCRICAO'+#9+'80'+#9+'Descrição');
      dblkRubricas.Refresh;
    End
  End;
end;

procedure TFrmPRelRubrica.SpnedAnoChange(Sender: TObject);
begin
  inherited;
  If SpnedAno.Value = 0 Then
    Exit;

  With qryRubFolha Do
  Begin
    Close;
    Prepare;
    Case iOpEscolha of
      2: If (CmbMes.Text <> '') And (SpnedAno.Text <> '') Then
         Begin
           If (cmbMes.ItemIndex+1) > 9 Then
             sMesRef := IntToStr(spnedAno.Value)+'/'+IntToStr(cmbMes.ItemIndex+1)
           Else
             sMesRef := IntToStr(spnedAno.Value)+'/0'+IntToStr(cmbMes.ItemIndex+1);
           ParamByName('MESREF').AsString := sMesRef;
         End;

      4: If (CmbMes.Text <> '') And (SpnedAno.Text <> '') Then
         Begin
           If (cmbMes.ItemIndex+1) > 9 Then
             sMesRef := IntToStr(spnedAno.Value)+'/'+IntToStr(cmbMes.ItemIndex+1)
           Else
             sMesRef := IntToStr(spnedAno.Value)+'/0'+IntToStr(cmbMes.ItemIndex+1);
           ParamByName('MESREF').AsString := sMesRef;
         End;
    End;
    frmAguarde.Mostra('Verificando rubricas. Aguarde...');
    frmAguarde.Repaint;
    Open;
    frmAguarde.Apaga;
    dblkRubricas.Enabled := not IsEmpty;
  End;
  dblkPatrocinadora.Enabled := True;
end;

procedure TFrmPRelRubrica.CmbMesChange(Sender: TObject);
begin
  inherited;
  With qryRubFolha Do
  Begin
    Close;
    Prepare;
    Case iOpEscolha of
      2: If (CmbMes.Text <> '') And (SpnedAno.Text <> '') Then
         Begin
           If (cmbMes.ItemIndex+1) > 9 Then
             sMesRef := IntToStr(spnedAno.Value)+'/'+IntToStr(cmbMes.ItemIndex+1)
           Else
             sMesRef := IntToStr(spnedAno.Value)+'/0'+IntToStr(cmbMes.ItemIndex+1);
           ParamByName('MESREF').AsString := sMesRef;
         End;

      4: If (CmbMes.Text <> '') And (SpnedAno.Text <> '') Then
         Begin
           If (cmbMes.ItemIndex+1) > 9 Then
             sMesRef := IntToStr(spnedAno.Value)+'/'+IntToStr(cmbMes.ItemIndex+1)
           Else
             sMesRef := IntToStr(spnedAno.Value)+'/0'+IntToStr(cmbMes.ItemIndex+1);
           ParamByName('MESREF').AsString := sMesRef;
         End;
    End;
    frmAguarde.Mostra('Verificando rubricas. Aguarde...');
    frmAguarde.Repaint;
    Open;
    frmAguarde.Apaga;
    dblkRubricas.Enabled := not IsEmpty;
  End;
  dblkPatrocinadora.Enabled := True;
  MontaQryPlano;
  MontaQryPlanoPrev;
end;

procedure TFrmPRelRubrica.MontaQryPlano;
begin
  qryPlano.Close;
  //Relatório exibido a partir da prévia
  If RdoTipoFolha.ItemIndex = 0 Then
  Begin
    If RdoTipoFiltro.ItemIndex = 0 Then
    Begin
      If Trim(dblkLoteouVersao.Text) <> '' Then
      Begin
        qryPlano.Sql.Clear;
        qryPlano.Sql.Add('SELECT DISTINCT P.IDPLANOPREV, P.NOME '+
                         'FROM PLANPREVCONTABIL P, PREVIA H ');

        If dblkPlano.LookupValue <> '' Then
          qryPlano.Sql.Add(', PLANPREV PP ');

        qryPlano.Sql.Add('WHERE P.IDPLANOPREV = H.IDPLANOCONTABIL '+
                         ' AND H.IDLOTE = '+qryPreviaouEfetivada.FieldByName('IDLOTE').AsString);

        If dblkPlano.LookupValue <> '' Then
          qryPlano.Sql.Add(' AND H.IDPLANOPREV = '+dblkPlano.LookupValue);

        If dblkPatrocinadora.LookupValue <> '' Then
          qryPlano.Sql.Add(' AND H.IDPATRO = '+dblkPatrocinadora.LookupValue);

        qryPlano.Sql.Add(' ORDER BY P.NOME ');
      End;
    End
    Else
    Begin
      //Relatório exibido a partir da prévia e filtrado pelo mês
      qryPlano.Sql.Clear;
      qryPlano.Sql.Add('SELECT DISTINCT P.IDPLANOPREV, P.NOME '+
                       'FROM PLANPREVCONTABIL P, PREVIA H ');

      If dblkPlano.LookupValue <> '' Then
        qryPlano.Sql.Add(', PLANPREV PP ');

      qryPlano.Sql.Add('WHERE P.IDPLANOPREV = H.IDPLANOCONTABIL '+
                       ' AND H.MESCOBRANCA = '+QuotedStr(sMesRef));

      If dblkPlano.LookupValue <> '' Then
        qryPlano.Sql.Add(' AND H.IDPLANOPREV = '+dblkPlano.LookupValue);

      If dblkPatrocinadora.LookupValue <> '' Then
        qryPlano.Sql.Add(' AND H.IDPATRO = '+dblkPatrocinadora.LookupValue);

      qryPlano.Sql.Add(' ORDER BY P.NOME ');
    End;
  End
  Else
  Begin
    //Relatório exibido a partir da histrubsal
    If RdoTipoFiltro.ItemIndex = 0 Then
    Begin
      If Trim(dblkLoteouVersao.Text) <> '' Then
      Begin
        qryPlano.Sql.Clear;
        qryPlano.Sql.Add('SELECT DISTINCT P.IDPLANOPREV, P.NOME '+
                         'FROM PLANPREVCONTABIL P, HISTRUBSAL H ');

        If dblkPlano.LookupValue <> '' Then
          qryPlano.Sql.Add(', PLANPREV PP ');

        qryPlano.Sql.Add('WHERE P.IDPLANOPREV = H.IDPLANOCONTABIL '+
                         ' AND H.IDHSTFOLHABENEF = '+qryPreviaouEfetivada.FieldByName('IDHSTFOLHABENEF').AsString);

        If dblkPlano.LookupValue <> '' Then
          qryPlano.Sql.Add(' AND H.IDPLANOPREV = '+dblkPlano.LookupValue);

        If dblkPatrocinadora.LookupValue <> '' Then
          qryPlano.Sql.Add(' AND H.IDPATRO = '+dblkPatrocinadora.LookupValue);

        qryPlano.Sql.Add(' ORDER BY P.NOME ');
      End;
    End
    Else
    Begin
      //Relatório exibido a partir da histrubsal e filtrado pelo mês
      qryPlano.Sql.Clear;
      qryPlano.Sql.Add('SELECT DISTINCT P.IDPLANOPREV, P.NOME '+
                       'FROM PLANPREVCONTABIL P, HISTRUBSAL H ');

      If dblkPlano.LookupValue <> '' Then
        qryPlano.Sql.Add(', PLANPREV PP ');

      qryPlano.Sql.Add('WHERE P.IDPLANOPREV = H.IDPLANOCONTABIL '+
                       ' AND H.MESCOBRANCA = '+QuotedStr(sMesRef));

      If dblkPlano.LookupValue <> '' Then
        qryPlano.Sql.Add(' AND H.IDPLANOPREV = '+dblkPlano.LookupValue);

      If dblkPatrocinadora.LookupValue <> '' Then
        qryPlano.Sql.Add(' AND H.IDPATRO = '+dblkPatrocinadora.LookupValue);

      qryPlano.Sql.Add(' ORDER BY P.NOME ');
    End;
  End;
  qryPlano.Open;
  dblkPlanoContabil.Enabled := not qryPlano.IsEmpty;
end;

procedure TFrmPRelRubrica.MontaQryPlanoPrev;
begin
  qryPlanoPrev.Close;
  //Relatório exibido a partir da prévia
  If RdoTipoFolha.ItemIndex = 0 Then
  Begin
    If RdoTipoFiltro.ItemIndex = 0 Then  
    Begin
      If Trim(dblkLoteouVersao.Text) <> '' Then
      Begin
        qryPlanoPrev.Sql.Clear;
        qryPlanoPrev.Sql.Add('SELECT DISTINCT P.IDPLANOPREV, P.NOME '+
                             'FROM PLANPREV P, PREVIA H '+
                             'WHERE P.IDPLANOPREV = H.IDPLANOPREV '+
                              ' AND H.IDLOTE = '+qryPreviaouEfetivada.FieldByName('IDLOTE').AsString);

        If dblkPatrocinadora.LookupValue <> '' Then
          qryPlanoPrev.Sql.Add(' AND H.IDPATRO = '+dblkPatrocinadora.LookupValue);

        qryPlanoPrev.Sql.Add(' ORDER BY P.NOME ');
      End;
    End
    Else
    Begin
      qryPlanoPrev.Sql.Clear;
      qryPlanoPrev.Sql.Add('SELECT DISTINCT P.IDPLANOPREV, P.NOME '+
                           'FROM PLANPREV P, PREVIA H '+
                           'WHERE P.IDPLANOPREV = H.IDPLANOPREV '+
                            ' AND H.MESCOBRANCA = '+QuotedStr(sMesRef));

      If dblkPatrocinadora.LookupValue <> '' Then
        qryPlanoPrev.Sql.Add(' AND H.IDPATRO = '+dblkPatrocinadora.LookupValue);

      qryPlanoPrev.Sql.Add(' ORDER BY P.NOME ');
    End;
  End
  Else
  Begin
    //Relatório exibido a partir da histrubsal e filtrado pelo idhstfolhabenef
    If RdoTipoFiltro.ItemIndex = 0 Then  
    Begin
      If Trim(dblkLoteouVersao.Text) <> '' Then
      Begin
        qryPlanoPrev.Sql.Clear;
        qryPlanoPrev.Sql.Add('SELECT DISTINCT P.IDPLANOPREV, P.NOME '+
                             'FROM PLANPREV P, HISTRUBSAL H '+
                             'WHERE P.IDPLANOPREV = H.IDPLANOPREV '+
                              ' AND H.IDHSTFOLHABENEF = '+qryPreviaouEfetivada.FieldByName('IDHSTFOLHABENEF').AsString);

        If dblkPatrocinadora.LookupValue <> '' Then
          qryPlanoPrev.Sql.Add(' AND H.IDPATRO = '+dblkPatrocinadora.LookupValue);

        qryPlanoPrev.Sql.Add(' ORDER BY P.NOME ');
      End;
    End
    Else
    Begin
      qryPlanoPrev.Sql.Clear;
      qryPlanoPrev.Sql.Add('SELECT DISTINCT P.IDPLANOPREV, P.NOME '+
                           'FROM PLANPREV P, HISTRUBSAL H '+
                           'WHERE P.IDPLANOPREV = H.IDPLANOPREV '+
                            ' AND H.MESCOBRANCA = '+QuotedStr(sMesRef));

      If dblkPatrocinadora.LookupValue <> '' Then
        qryPlanoPrev.Sql.Add(' AND H.IDPATRO = '+dblkPatrocinadora.LookupValue);

      qryPlanoPrev.Sql.Add(' ORDER BY P.NOME ');
    End;
  End;
  qryPlanoPrev.Open;
  dblkPlano.Enabled         := not qryPlanoPrev.IsEmpty;
end;

procedure TFrmPRelRubrica.dblkPlanoChange(Sender: TObject);
begin
  inherited;
  MontaQryPlano;
end;

procedure TFrmPRelRubrica.MontaQryPatro;
begin
  qryPatro.close;
  If RdoTipoFolha.ItemIndex = 0 Then
  Begin
    If dblkLoteouVersao.Text <> '' Then
    Begin
      qryPatro.SQL.Clear;
      qryPatro.SQL.Add('SELECT DISTINCT P.IDPESSOA, P.NOME '+
                       'FROM PESSOA P, PATRO PT, PREVIA H '+
                       'WHERE (PT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+
                        ' AND (P.IDPESSOA = PT.IDPESSOA) '+
                        ' AND (P.IDPESSOA = H.IDPATRO) '+
                        ' AND (H.IDLOTE = '+qryPreviaouEfetivada.FieldByName('IDLOTE').AsString+') '+
                       'ORDER BY P.NOME ');
    End
    Else
    Begin
      qryPatro.SQL.Clear;
      qryPatro.SQL.Add('SELECT DISTINCT P.IDPESSOA, P.NOME '+
                       'FROM PESSOA P, PATRO PT, PREVIA H '+
                       'WHERE (PT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+
                        ' AND (P.IDPESSOA = PT.IDPESSOA) '+
                        ' AND (P.IDPESSOA = H.IDPATRO) '+
                        ' AND (H.MESCOBRANCA = '+QuotedStr(sMesRef)+') '+
                       'ORDER BY P.NOME ');
    End;
  End
  Else
  Begin
    If dblkLoteouVersao.Text <> '' Then
    Begin
      qryPatro.close;
      qryPatro.SQL.Clear;
      qryPatro.SQL.Add('SELECT DISTINCT P.IDPESSOA, P.NOME '+
                       'FROM PESSOA P, PATRO PT, HISTRUBSAL H '+
                       'WHERE (PT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+
                        ' AND (P.IDPESSOA = PT.IDPESSOA) '+
                        ' AND (P.IDPESSOA = H.IDPATRO) '+
                        ' AND (H.IDHSTFOLHABENEF = '+qryPreviaouEfetivada.FieldByName('IDHSTFOLHABENEF').AsString+') '+
                       'ORDER BY P.NOME ');
    End
    Else
    Begin
      qryPatro.SQL.Clear;
      qryPatro.SQL.Add('SELECT DISTINCT P.IDPESSOA, P.NOME '+
                       'FROM PESSOA P, PATRO PT, HISTRUBSAL H '+
                       'WHERE (PT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+
                        ' AND (P.IDPESSOA = PT.IDPESSOA) '+
                        ' AND (P.IDPESSOA = H.IDPATRO) '+
                        ' AND (H.MESCOBRANCA = '+QuotedStr(sMesRef)+') '+
                       'ORDER BY P.NOME ');
    End;
  End;
  qryPatro.open;
end;

end.
{==============================================================================|
| UNIT: FPRELRUBRICA;                                                          |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   FORMULÁRIO DE FILTRO PARA O RELATÓRIO INDIVIDUAL DE RUBRICAS               |
|==============================================================================|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/03/2002 A 18/03/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12E                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|  > RETIREI OS JOINS COM A TABELA RUBRICAXPESS E SUBSTITUÍ PELA PROVDESC      |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/04/2002 A 30/04/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12J                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    FORAM COLOCADOS MAIS DOIS FILTROS, POR PATROCINADORA E POR PLANO E TAMBÉM |
|  O CAMPO MES DE REFERÊNCIA COMO PEDIU O MENEZES                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 20/05/2002 A 23/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - COLOCAR UM CHECKBOX, PARA DAR OPÇÃO DE CONSOLIDADA OU NÃO               |
|    - TAMBÉM FOI TIRADO O LBLNUMEROFOLHA E NO LUGAR DESTES FOI COLOCADO UM    |
|    LABEL CHAMADO REFERÊNCIA ASSIM COMO NO FPARAMRELRESRUBRICA.               |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/06/2002 A 20/06/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - ADOTAR O PADRÃO DO NOVO RELATÓRIO, PERMITINDO ESCOLHER DE QUAL TABELA   |
|    SERÃO IMPRESSOS AS INFORMAÇÕES E TAMBÉM PERMITINDO AO USUÁRIO ESCOLHER    |
|    O TIPO DE ORDENAÇÃO                                                       |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 15/08/2002 A 15/08/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Trocar o campo Mes, pelo campo MesCobranca.                             |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/09/2002 A 24/09/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Variar a informação referência para mês, lote, mês ou versão.            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 08/11/2002 A 08/11/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.14L                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| PENDENCIA 10412:                                                             |
| O FILTRO APLICADO FOI ALTERADO ERRADAMENTE A PEDIDO DO MENEZES. VOLTAMOS     |
| A SITUAÇÃO ANTERIOR.                                                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: RICARDO VIGORITO                                              |
| PERÍODO DE IMPLEMENTAÇÃO: DE 21/01/2004 A 21/01/2004                         |
| PENDÊNCIA: 15052                                                             |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| PASSOU A PERMITIR A FILTAGEM POR PAGAMENTOS ESTORNADOS                       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 03/09/2004 A 06/09/2004                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   Incluir filtro de plano contabil.                                          |
|                                                                              |
|------------------------------------------------------------------------------|
