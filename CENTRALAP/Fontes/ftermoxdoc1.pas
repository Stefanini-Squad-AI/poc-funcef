unit ftermoxdoc1;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, IvDictio,
  IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery,
  TB97Ctls, MAHlpBtn, StdCtrls, TB97Tlbr, TB97, wwdblook, uMensErro, fTelaAut,
  CmEventosCadastro, ImgList, {$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  Tfrmtermoxdco1 = class(TfrmCadastroCS)
    Panel1: TPanel;
    Pnlctrls: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    GRDdocssel: TwwDBGrid;
    GRDtipdesemb: TwwDBGrid;
    DBLKpbenefserv: TwwDBLookupCombo;
    DBLKpplano: TwwDBLookupCombo;
    DBLKptermo: TwwDBLookupCombo;
    DBLKpsituacao: TwwDBLookupCombo;
    Patricinadora: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    qrypatrocinadora: TwwQuery;
    qrybeneficio: TwwQuery;
    qrySitbenef: TwwQuery;
    qrytermo: TwwQuery;
    qryProcuraTermoxDoc: TwwQuery;
    qryReplicaTermoxDoc: TwwQuery;
    qryNOMEDOCUMENTO: TStringField;
    qryIDPESSOA: TFloatField;
    qryIDPLANOPREV: TFloatField;
    qryIDBENEFICIO: TFloatField;
    qryIDSITBENEF: TFloatField;
    qryIDDOCUMENTO: TFloatField;
    qryIDTERMOXDOC: TFloatField;
    qryIDTERMOSXBENEF: TFloatField;
    qryIDTIPODOCXBENEF: TFloatField;
    qryProcuraTermoxDocidtermoxdoc: TFloatField;
    btnInclui: TSpeedButton;
    BtnReplicar: TToolbarButton97;
    BtnExclui: TSpeedButton;
    dsDocumentos: TwwDataSource;
    UpdDocumentos: TUpdateSQL;
    QRYDOCUMENTOS: TwwQuery;
    QRYDOCUMENTOSNOMEDOCUMENTO: TStringField;
    QRYDOCUMENTOSIDTIPODOCXBENEF: TFloatField;
    qryplano: TwwQuery;
    dblkpPatro: TwwDBLookupCombo;
    qryinsertdoc: TwwQuery;
    qrydeletedoc: TwwQuery;
    qrypatrocinadoraIDPESSOA: TFloatField;
    qrypatrocinadoraNOME: TStringField;
    qryplanoIDPLANOPREV: TFloatField;
    qryplanoNOME: TStringField;
    qrybeneficioIDSERVICOS: TFloatField;
    qrybeneficioNOME: TStringField;
    qrybeneficioTIPO: TStringField;
    qrySitbenefIDSITBENEF: TFloatField;
    qrySitbenefDESCRICAO: TStringField;
    qrytermoIDTERMOSXBENEF: TFloatField;
    qrytermoDESCRUB: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluiClick(Sender: TObject);
    procedure DBLKpsituacaoExit(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure DBLKppatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure BtnReplicarClick(Sender: TObject);
    procedure GRDtipdesembKeyPress(Sender: TObject; var Key: Char);
    procedure QRYDOCUMENTOSAfterOpen(DataSet: TDataSet);
    procedure qryAfterOpen(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);

    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure dblkpPatroExit(Sender: TObject);
    procedure DBLKpbenefservExit(Sender: TObject);
    procedure DBLKpplanoExit(Sender: TObject);
  private
    { Private declarations }
    sPalavra :String;

      Procedure AbreConsultas;
      Procedure Listardoc;
      Procedure ReplicaRelacionamentos(idPatroDestino: LongInt);

  public
    { Public declarations }
  end;

var
  frmtermoxdco1: Tfrmtermoxdco1;

implementation
 Uses uFuncaoGeral, uDataBase, FReplicaPatro, FPrincipal;
{$R *.DFM}



procedure Tfrmtermoxdco1.FormCreate(Sender: TObject);
begin
  inherited;
 If qryPatrocinadora.Active      Then qryPatrocinadora.Close;
  If qryPlano.Active              Then qryPlano.Close;
  If qryBeneficio.Active          Then qryBeneficio.Close;
  If qrySitBenef.Active           Then
    BEGIN
   qrySitBenef.Close;
   qryDOCUMENTOS.Close;
   END;
  If qrydocumentos.Active           Then qrydocumentos.Close;
   try
    qryPatrocinadora.Open;
  except
    showmessage('Problemas Patrocinadora'  );
  end;


  try
    qryPlano.Open;
  except
    showmessage('Problemas Plano'  );
  end;

  try
    qrySitBenef.Open;
  except
    showmessage('Problemas Plano'  );
  end;
  try
    qryBeneficio.Open;
  except
    showmessage('Problemas Beneficio'  );
  end;

   try
    qryTermo.Open;
  except
    showmessage('Problemas Termo'  );
  end;


end;
procedure Tfrmtermoxdco1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FechaQry([qrypatrocinadora, qryPlano, qryBeneficio, qrySitBenef, qryDocumentos, qry, qrytermo ],false,true);
end;

procedure Tfrmtermoxdco1.btnIncluiClick(Sender: TObject);
Var
 bTodos: Boolean;
begin
  inherited;
  If (Sender Is TSpeedButton) Then
  Begin
    bTodos := (Sender as TSpeedButton).Tag = 1;

    If bTodos Then
    Begin
      If (MsgDlg('Deseja Incluir todos os documentos','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrNo) Then Exit;

      qryDocumentos.First;
    End;

    While Not qryDocumentos.Eof Do
    Begin

       qry.Append;
       qryNOMEDOCUMENTO.AsString := qryDocumentosNOMEDOCUMENTO.AsString;
       qryIDSITBENEF.AsFloat := StrToFloat(dblkpSituacao.LookupValue);
       qryIDPESSOA.AsFloat := StrToFloat(dblkpPatro.LookupValue);
       qryIDPLANOPREV.AsFloat := StrToFloat(dblkpPlano.LookupValue);
       qryIDBENEFICIO.AsFloat := StrToFloat(dblkpBenefServ.LookupValue);

       try
       qryIDTERMOXDOC.AsFloat := LeultRegistro(nil,'TERMOXDOC');
       except
         qryIDTERMOXDOC.AsFloat := 1;
       end;
       qryIDTIPODOCXBENEF.AsFloat :=qryDocumentosIDTIPODOCXBENEF.AsFloat ;
       qryIDTERMOSXBENEF.AsFloat  := StrToFloat(dblkpTermo.LookupValue);
       TRY
         qry.Post;
       EXCEPT
        showmessage('Problemas qry.POST'  );
        END;
        tag := 1 ;
         PnlCtrls.Enabled := False;
       If Not bTodos Then break;
    End;
  End;
end;
 Procedure Tfrmtermoxdco1.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
  Inherited;
  sbtnAlterar.Enabled := Not bbtnConfirmar.Enabled;
  BtnReplicar.Enabled := sbtnAlterar.Enabled;
End;
procedure Tfrmtermoxdco1.DBLKpsituacaoExit(Sender: TObject);
begin
  inherited;
   qrytermo.Close;
   qrytermo.ParamByName('idpessoa').AsFloat    := qrypatrocinadoraIDPESSOA.AsFloat;
   qrytermo.ParamByName('idplanoprev').AsFloat := qryplanoIDPLANOPREV.AsFloat;     
   qrytermo.ParamByName('idbeneficio').AsFloat := qrybeneficioIDSERVICOS.AsFloat;  
   qrytermo.ParamByName('idsitbenef').AsFloat  := qrySitbenefIDSITBENEF.AsFloat;   
   qryTermo.Open;
end;
procedure Tfrmtermoxdco1.BtnExcluiClick(Sender: TObject);
Var
  bTodos: Boolean;
begin
  inherited;

    If (MsgDlg('Deseja Excluir  o documentos','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrNo) Then Exit;
       begin
       Qrydeletedoc.ParamByName('IDTERMOXDOC').AsFloat := qryIDTERMOXDOC.AsFloat ;
       Qrydeletedoc.ExecSQL;
        Listardoc;


   
  End;

end;

procedure Tfrmtermoxdco1.DBLKppatroCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  AbreConsultas;
end;

procedure Tfrmtermoxdco1.BtnReplicarClick(Sender: TObject);
begin
  inherited;

   BtnReplicar.Down := False;
  If dblkpPatro.Text <> '' Then
  Begin
     AbrirForm(FrmReplicaPatro, TFrmReplicaPatro, false);
     FrmReplicaPatro.ReplicaRelacionamentos := ReplicaRelacionamentos;
     FrmReplicaPatro.idPatroOrigen := StrToIntDef(dblkpPatro.LookupValue,0);
     FrmReplicaPatro.MontaListaPatro;
  End;
end;
procedure Tfrmtermoxdco1.ReplicaRelacionamentos(idPatroDestino: LongInt);
Begin
  Try
     StartTransacao;
     Qry.First;
     While Not qry.Eof Do
     Begin
       With QryProcuratermoxdoc Do
       Begin
          If Active Then Close;
          ParamByname('IDPESSOA').AsFloat := idPatroDestino;
          ParamByname('IDPLANOPREV').AsFloat := qryIDPLANOPREV.AsFloat;
          ParamByname('IDBENEFICIO').AsFloat := qryIDBENEFICIO.AsFloat;
          ParamByname('IDSITBENEF').AsFloat := qryIDSITBENEF.AsFloat;
          ParamByname('IDTIPODOCXBENEF').AsFloat :=qryIDTIPODOCXBENEF.AsFloat;
          ParamByname('IDTERMOSXBENEF').AsFloat  :=qryIDTERMOSXBENEF.AsFloat;
          Open;

          If IsEmpty Then
          Begin
             With QryReplicatermoxdoc Do
             Begin
                ParamByname('IDSITBENEF').AsFloat := qryIDSITBENEF.AsFloat;
                ParamByname('IDPESSOA').AsFloat :=  idPatroDestino;
                ParamByname('IDPLANOPREV').AsFloat := qryIDPLANOPREV.AsFloat;
                ParamByname('IDBENEFICIO').AsFloat := qryIDBENEFICIO.AsFloat;
                ParamByname('IDTIPODOCXBENEF').AsFloat := qryIDTIPODOCXBENEF.AsFloat;
                ParamByname('IDTERMOSXBENEF').AsFloat  := qryIDTERMOSXBENEF.AsFloat;
                ParamByname('IDTERMOXDOC').AsFloat := LeultRegistro(nil,'TERMOXDOC');
                ExecSql;
             End;
          End;
          Close;
       End;
       qry.Next;
     End;
     CommitTransacao;
  Except
     RollBackTransacao;
     Raise;
  End;
End;

procedure Tfrmtermoxdco1.GRDtipdesembKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
Case Key Of
  'A'..'Z','a'..'z','0'..'9':
  Begin
    sPalavra := sPalavra + Key;
    (Sender as TwwDbGrid).DataSource.DataSet.Locate(
        (Sender as TwwDbGrid).DataSource.DataSet.Fields[0].FieldName,
        sPalavra,
        [LoPartialKey,LoCaseInsensitive]);
  End;
  Else
    sPalavra := ''
  End;
end;

procedure Tfrmtermoxdco1.QRYDOCUMENTOSAfterOpen(DataSet: TDataSet);
begin
  inherited;
If DataSet.IsEmpty Then
     GrdTipDesemb.hint := ''
  Else
     GrdTipDesemb.hint := DataSet.Fields[0].AsString;
end;

procedure Tfrmtermoxdco1.qryAfterOpen(DataSet: TDataSet);
begin
  inherited;
If DataSet.IsEmpty Then
     GrdDocsSel.hint := ''
  Else
     GrdDocsSel.hint := DataSet.Fields[0].AsString;
end;

Procedure Tfrmtermoxdco1.CmeCadastroEdit(Sender: TObject);
Begin
//  Inherited;
 If qry.Active Then   qry.close;
  qry.open ;
  TRY
  qry.Edit;
  except
  showmessage('Problema QRY.EDIT'  );
  end;
  TRY
       qry.CancelUpdates;
  except
  showmessage('Problemas QRY.CANCELIPDATES'  );
  end;
  AbreConsultas;
End;
Procedure Tfrmtermoxdco1.CmeCadastroCancel(Sender: TObject);
Begin
  Inherited;
  AbreConsultas;
End;
Procedure Tfrmtermoxdco1.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
  Accept := ((dblkpPatro.Text <> '') And (dblkpPlano.Text <> '') And (dblkpBenefServ.Text <> '') And (dblkpSituacao.Text <> '') And (dblkpTERMO.Text <> ''));
  If Not Accept Then
     MsgDlg('Faltam Dados Para Completar a associação','Erro',mtError, [mbOk],0);
End;

Procedure Tfrmtermoxdco1.CmeCadastroConfirma(Sender: TObject);
Begin
 Inherited;

  AbreConsultas;
End;
Procedure Tfrmtermoxdco1.AbreConsultas;
Begin
  Inherited;
  If (dblkpPatro.Text <> '')     And
     (dblkpPlano.Text <> '')     And
     (dblkpSituacao.Text <> '')  And
     (dblkpTERMO.Text <> '')  And
     (dblkpBenefServ.Text <> '') Then
  Begin
     PnlCtrls.Enabled := True;

     If qry.Active And
        qry.UpdatesPending And
        (MsgDlg('Deseja Gravar As Alterações Pendentes','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrYes) then
        AplicaAlteracoes([qry]);
         

     If qryDocumentos.Active Then
       Begin

       qryDocumentos.Close;  
     End;

     qryDocumentos.ParamByName('idpessoa').AsFloat    :=  StrToFloat(dblkpPatro.LookupValue);
     qryDocumentos.ParamByName('idplanoprev').AsFloat :=  StrToFloat(dblkpPlano.LookupValue);
     qryDocumentos.ParamByName('idbeneficio').AsFloat :=  StrToFloat(dblkpBenefServ.LookupValue);
     qryDocumentos.ParamByName('idsitbenef').AsFloat  :=  StrTofloat(dblkpSituacao.LookupValue);
     qryDocumentos.Open;

     If qry.Active Then
     Begin
      If qry.UpdatesPending Then qry.CancelUpdates;
       qry.Close;
     End;

     qry.ParamByName('idpessoa').AsFloat   := StrToFloat(dblkpPatro.LookupValue);
     qry.ParamByName('idplanoprev').AsFloat := StrToFloat(dblkpPlano.LookupValue);
     qry.ParamByName('idbeneficio').AsFloat := StrToFloat(dblkpBenefServ.LookupValue);
     qry.ParamByName('idsitbenef').AsFloat  :=  StrToFloat(dblkpSituacao.LookupValue);
     Qry.ParamByName('IDTERMOSXBENEF').AsFloat := StrToFloat(dblkpTermo.LookupValue);

     qry.Open;
  End
  Else
  Begin

     PnlCtrls.Enabled := False;

     If qry.Active And
        qry.UpdatesPending And
        (MsgDlg('Deseja Gravar As Alterações Pendentes','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrYes) then
            AplicaAlteracoes([qry]);


     If qryDocumentos.Active Then
     Begin
      qryDocumentos.Close;
     End;

     qryDocumentos.ParamByName('idpessoa').AsFloat    :=  0;
     qryDocumentos.ParamByName('idplanoprev').AsFloat :=  0;
     qryDocumentos.ParamByName('idbeneficio').AsFloat :=  0;
     qryDocumentos.ParamByName('idsitbenef').AsFloat  :=  0;
     qryDocumentos.Open;

     If qry.Active Then
     Begin
    
       qry.Close;
     End;

     qry.ParamByName('idpessoa').AsFloat    := 0;
     qry.ParamByName('idplanoprev').AsFloat := 0;
     qry.ParamByName('idbeneficio').AsFloat := 0;
     qry.ParamByName('idsitbenef').Asfloat  := 0;
     try
     qry.Open;
      except
       showmessage('Problemas QRY.CANCELIPDATES'  );
     end;
  End;
End;

procedure Tfrmtermoxdco1.bbtnConfirmarClick(Sender: TObject);
 var bInsert : boolean;
begin
        if self.tag = 1  then
        begin
        QryInsertdoc.ParamByName('IDSITBENEF').AsFloat := qryIDSITBENEF.AsFloat ;
        QryInsertdoc.ParamByName('IDPESSOA').AsFloat := qryIDPESSOA.AsFloat ;
        QryInsertdoc.ParamByName('IDPLANOPREV').AsFloat := qryIDPLANOPREV.AsFloat ;
        QryInsertdoc.ParamByName('IDBENEFICIO').AsFloat := qryIDBENEFICIO.AsFloat ;
        QryInsertdoc.ParamByName('IDTERMOXDOC').AsFloat := qryIDTERMOXDOC.AsFloat ;
        QryInsertdoc.ParamByName('IDTIPODOCXBENEF').AsFloat := qryIDTIPODOCXBENEF.AsFloat ;
        QryInsertdoc.ParamByName('IDTERMOSXBENEF').AsFloat := qryIDTERMOSXBENEF.AsFloat ;
        QryInsertdoc.ExecSQL;
        Listardoc;

         PnlCtrls.Enabled := True;
    Screen.Cursor := crHourGlass;

     CmeCadastro.AtualizaBotoes(self);
     Screen.Cursor := crDefault;
     tag := 0;
   end;
end;
Procedure Tfrmtermoxdco1.Listardoc;
begin

   If qryDocumentos.Active Then
       Begin

       qryDocumentos.Close;
     End;

     qryDocumentos.ParamByName('idpessoa').AsFloat    :=  StrToFloat(dblkpPatro.LookupValue);
     qryDocumentos.ParamByName('idplanoprev').AsFloat :=  StrToFloat(dblkpPlano.LookupValue);
     qryDocumentos.ParamByName('idbeneficio').AsFloat :=  StrToFloat(dblkpBenefServ.LookupValue);
     qryDocumentos.ParamByName('idsitbenef').AsFloat  :=  StrTofloat(dblkpSituacao.LookupValue);
     qryDocumentos.Open;
 If qry.Active Then
     Begin

       qry.Close;
     End;

     qry.ParamByName('idpessoa').AsFloat   := StrToFloat(dblkpPatro.LookupValue);
     qry.ParamByName('idplanoprev').AsFloat := StrToFloat(dblkpPlano.LookupValue);
     qry.ParamByName('idbeneficio').AsFloat := StrToFloat(dblkpBenefServ.LookupValue);
     qry.ParamByName('idsitbenef').AsFloat  :=  StrToFloat(dblkpSituacao.LookupValue);
      Qry.ParamByName('IDTERMOSXBENEF').AsFloat := StrToFloat(dblkptermo.LookupValue);;

     qry.Open;   

 END;
procedure Tfrmtermoxdco1.bbtnCancelarClick(Sender: TObject);
begin
// inherited;
  CmeCadastro.RepetirInsert := False;
     if qry.Active then
        CmeCadastro.Cancel(Self);
     if qry.IsEmpty then
        CmeCadastro.Operacao := opVazio
     else
         CmeCadastro.Operacao := opIdle;
     CmeCadastro.AtualizaBotoes(self);
 
end;

procedure Tfrmtermoxdco1.dblkpPatroExit(Sender: TObject);
begin
  inherited;
  qryPlano.Close;
  qryplano.ParamByName('IDPESSJUR').AsFloat := qryPatrocinadoraIDPESSOA.AsFloat;
  qryPlano.Open;
end;

procedure Tfrmtermoxdco1.DBLKpbenefservExit(Sender: TObject);
begin
  inherited;
   qrySitBenef.Close;
   qrySitBenef.ParamByName('IDBENEFICIO').AsFloat := qryBeneficioIDSERVICOS.AsFloat;
   qrySitBenef.ParamByName('idpessoa').AsFloat   := qryPatrocinadoraIDPESSOA.AsFloat;
   qrySitBenef.ParamByName('IDPLANOPREV').AsFloat := qryPlanoIDPLANOPREV.AsFloat;
   qrySitBenef.Open;
end;

procedure Tfrmtermoxdco1.DBLKpplanoExit(Sender: TObject);
begin
  inherited;
   qryBeneficio.Close;
   qryBeneficio.ParamByName('IDPLANOPREV').AsFloat := qryPlanoIDPLANOPREV.AsFloat;
   qryBeneficio.Open;
end;

end.
