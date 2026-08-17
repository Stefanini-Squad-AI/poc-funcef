unit FCadOrgaosESetores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  DBCtrls, wwdblook, CmEventosCadastro, ImgList;

type
  TfrmCadOrgaosESetores = class(TfrmCadMestreDetalheCS)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbedNomeLocal: TDBEdit;
    dbedSiglaLocal: TDBEdit;
    qryFilial: TwwQuery;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label5: TLabel;
    dbedNomeSetor: TDBEdit;
    Label4: TLabel;
    dbedSiglaSetor: TDBEdit;
    dblkpcmbFilial: TwwDBLookupCombo;
    procedure FormActivate(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadOrgaosESetores: TfrmCadOrgaosESetores;

implementation

uses FPrincipal, UMensErro, UDataBase, Usistema;

{$R *.DFM}

procedure TfrmCadOrgaosESetores.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dblkpcmbFilial.SetFocus;

  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').Value    := qry.FieldByName('IDLOCAL').AsInteger;
  qryDet.Open;

  // Preencher IdFaixaSalEst com leUltregistro
  // o Código com o codigo do obj qry
  // idpessjur com o da qry
  qry.FieldByName('IDLOCAL').AsInteger     := LeUltRegistro(nil,'LOCALPREV');
end;

procedure TfrmCadOrgaosESetores.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dblkpcmbFilial.SetFocus;
end;

procedure TfrmCadOrgaosESetores.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
    qry.Close;
    qry.ParamByName('IDGRUPO').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qry.ParamByName('IDLOCAL').Value := StrToInt(MontaSelect.ValoresChave[1]);
    qry.Open;

    qryDet.Close;
    qryDet.ParamByName('IDPESSJUR').Value      := qry.FieldByName('IDLOCAL').AsInteger;
    qryDet.Open;
  end;
end;

procedure TfrmCadOrgaosESetores.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qryDet.FieldByName('IDPESSJUR').AsInteger := qry.FieldByName('IDLOCAL').AsInteger;
end;

procedure TfrmCadOrgaosESetores.CmeCadastroConfirma(Sender: TObject);
begin

   If  ds.DataSet.State = dsInsert Then
   begin
     
     if Trim(dblkpcmbFilial.Text) = ''
     then begin
        MsgDlg('Filial não preenchida. Verifique.','Erro',mtError,[mbOk],0);
        dblkpcmbFilial.SetFocus;
        Abort;
     end;

     if Trim(dbedNomeLocal.Text) = ''
     then begin
        MsgDlg('Nome do Órgão(Local) não preenchido. Verifique.','Erro',mtError,[mbOk],0);
        dbedNomeLocal.SetFocus;
        Abort;
     end;

     if Trim(dbedSiglaLocal.Text) = ''
     then begin
        MsgDlg('Sigla do Órgão(Local) não preenchida. Verifique.','Erro',mtError,[mbOk],0);
        dbedSiglaLocal.SetFocus;
        Abort;
     end;
   end;

   inherited;
   try
      AplicaAlteracoes([qryDet]);
   except
      raise;
   end;

    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TfrmCadOrgaosESetores.CmeDetalheConfirma(Sender: TObject);
begin

   If  dsDet.DataSet.State = dsInsert Then
   Begin     
     
     if Trim(dbedNomeSetor.Text) = ''
     then begin
        MsgDlg('Nome do Setor não preenchido. Verifique.','Erro',mtError,[mbOk],0);
        dbedNomeSetor.SetFocus;
        Abort;
     end;

     if Trim(dbedNomeSetor.Text) = ''
     then begin
        MsgDlg('Sigla do Setor não preenchida. Verifique.','Erro',mtError,[mbOk],0);
        dbedNomeSetor.SetFocus;
        Abort;
     end;
   end;

   inherited;
end;

procedure TfrmCadOrgaosESetores.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDGRUPO').Value := 0;
  qry.ParamByName('IDLOCAL').Value := 0;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').Value      := 0;
  qryDet.Open;

  Self.Caption := 'Cadastro de Órgãos (Locais) e Setores da ' + frmPrincipal.sNomepatroNivel;
  MontaSelect.Filtro.Clear;
  MontaSelect.Filtro.Add('P.IDGRUPO = '+IntToStr(frmPrincipal.liIdPessJurNivel));
  MontaSelect.Filtro.Add('P.IDPESSOA = L.IDFILIALPESSOA');
  
  qryFilial.Close;
  qryFilial.ParamByName('IDGRUPO').AsInteger := frmPrincipal.liIdPessJurNivel;
  qryFilial.Open;
end;

end.
