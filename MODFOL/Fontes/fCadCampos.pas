unit fCadCampos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, DBCtrls, Mask, wwdbedit, CmEventosCadastro, ImgList;

type
  TfrmCadCampos = class(TfrmCadastroCS)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dedIdCampo: TwwDBEdit;
    dedDescricao: TwwDBEdit;
    dedApelido: TwwDBEdit;
    dbrdTipoDado: TDBRadioGroup;
    lblLocal: TLabel;
    dblkpcmbArq: TwwDBLookupCombo;
    Label10: TLabel;
    dblkpcmbCampo: TwwDBLookupCombo;
    dblkpGrupo: TwwDBLookupCombo;
    Label8: TLabel;
    chkObrig: TCheckBox;
    chkChave: TCheckBox;
    chkvirtual: TCheckBox;
    updDet: TUpdateSQL;
    QryDet: TwwQuery;
    dsDet: TwwDataSource;
    qryGrupos: TwwQuery;
    qryTabelas: TwwQuery;
    QryCampoEnt: TwwQuery;
    wwDBEdit4: TwwDBEdit;
    QryAux: TwwQuery;
    Label4: TLabel;
    procedure chkObrigClick(Sender: TObject);
    procedure chkvirtualClick(Sender: TObject);
    procedure chkChaveClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dblkpcmbArqExit(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    procedure Sel( n : String );
  public
    { Public declarations }
  end;

var
  frmCadCampos: TfrmCadCampos;
  vIdOld, vGrupo : String;

implementation

uses UMensErro, UDatabase, fAguarde;

{$R *.DFM}

procedure TfrmCadCampos.chkObrigClick(Sender: TObject);
begin
  inherited;
  If qry.State in [dsEdit,dsInsert] Then begin
       if chkObrig.Checked then
          Qry.FieldbyName('FLGOBRIGATORIO').AsInteger := 1
       else
          Qry.FieldbyName('FLGOBRIGATORIO').AsInteger := 0;
  end;
end;

procedure TfrmCadCampos.chkvirtualClick(Sender: TObject);
begin
  inherited;
  If qry.State in [dsEdit,dsInsert] Then begin
       if chkVirtual.Checked then
          Qry.FieldbyName('CAMPODOBANCO').AsInteger := 2
       else
          Qry.FieldbyName('CAMPODOBANCO').AsInteger := 1;
  end;
end;

procedure TfrmCadCampos.chkChaveClick(Sender: TObject);
begin
  inherited;
  If qry.State in [dsEdit,dsInsert] Then begin
       if chkChave.Checked then
          Qry.FieldbyName('CHAVE').AsInteger := 1
       else
          Qry.FieldbyName('CHAVE').AsInteger := 0;
  end;
end;

procedure TfrmCadCampos.Sel( n : String );
Begin
   qry.Close;
   qry.Params[0].Value := n;
   qry.Open;

   chkObrig.Checked := False;
   if Qry.FieldbyName('FLGOBRIGATORIO').AsInteger = 1 then chkObrig.Checked := True;

   chkvirtual.Checked := False;
   if Qry.FieldbyName('CAMPODOBANCO').AsInteger = 2 then chkvirtual.Checked := True;

   chkChave.Checked := False;
   if Qry.FieldbyName('CHAVE').AsInteger = 1 then chkChave.Checked := True;
End;


procedure TfrmCadCampos.CmeCadastroFind(Sender: TObject);
begin
     Inherited;
     if MontaSelect.RetornouValor Then begin
        Refresh;
        frmAguarde.Mostra('Selecionando Dados ...');
        frmAguarde.Refresh;
        Sel(MontaSelect.ValoresChave[0]);
        with QryDet do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT CODGRUPOARQUIVO,IDCAMPO FROM CMPBDGRP WHERE ');
             Sql.Add('(IDCAMPO = '''+MontaSelect.ValoresChave[0]+''') AND ');
             Sql.Add('(CODGRUPOARQUIVO = '''+MontaSelect.ValoresChave[1]+''')');
             Open;
        end;
        vGrupo := MontaSelect.ValoresChave[1];
        vIdOld := MontaSelect.ValoresChave[0];
        if not QryDet.IsEmpty then begin
           if qryGrupos.Locate('CODGRUPOARQUIVO', vGrupo, []) then
              dblkpGrupo.Text := qryGrupos.FieldbyName('DESCRICAO').AsString;
        end;
        frmAguarde.Apaga;
     end;
end;

procedure TfrmCadCampos.bbtnConfirmarClick(Sender: TObject);
var
   vId, vGrp : String;
begin
  If (Trim(dedIdCampo.Text) = '') or (dedDescricao.Text = '') or (dblkpGrupo.Text = '') or
     (Trim(dblkpcmbArq.Text) = '') or (dblkpcmbCampo.Text = '')
  Then begin
       MsgDlg('Existem campos em branco.','Erro',mtError,[mbOK],0);
       Exit;
  end;
  if dbrdTipoDado.ItemIndex = -1 then begin
     MsgDlg('Tipo de Dado não declarado !','Atenção',mtConfirmation,[mbOk, mbHelp],0);
     Exit;
  end;
  frmAguarde.Mostra('Gravando Campos ...');
  frmAguarde.Refresh;


  if chkObrig.Checked then
     Qry.FieldbyName('FLGOBRIGATORIO').AsInteger := 1
  else
     Qry.FieldbyName('FLGOBRIGATORIO').AsInteger := 0;

  if chkvirtual.Checked then
     Qry.FieldbyName('CAMPODOBANCO').AsInteger := 2
  else
     Qry.FieldbyName('CAMPODOBANCO').AsInteger := 1;

  if chkChave.Checked then
     Qry.FieldbyName('CHAVE').AsInteger := 1
  else
     Qry.FieldbyName('CHAVE').AsInteger := 0;


  vId := Qry.FieldbyName('IDCAMPO').AsString;
  vGrp := qryGrupos.FieldbyName('CODGRUPOARQUIVO').AsString;

  if (QryDet.FieldbyName('IDCAMPO').AsString <> vId) and (Qry.State = dsEdit) then begin
     //Apagando Dados direto via Sql, por não haver jeito no padrão para fazer ...
     //Já foram tentadas todos os jeitos para exclusão
     with QryAux do begin
          Close;
          Sql.Clear;
          Sql.Add('DELETE  FROM CMPBDGRP WHERE (IDCAMPO = '''+vIdOld+''') AND ');
          Sql.Add('                            (CODGRUPOARQUIVO = '''+vGrupo+''')');
          ExecSql;
     end;
  end;

  try
     inherited;
  except
        begin
             frmAguarde.Apaga;
             Exit;
        end;
  end;

  frmAguarde.Mostra('Gravando Grupo ...');
  frmAguarde.Refresh;

  with QryDet do begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT CODGRUPOARQUIVO,IDCAMPO FROM CMPBDGRP WHERE ');
       Sql.Add('(IDCAMPO = '''+vId+''') AND ');
       Sql.Add('(CODGRUPOARQUIVO = '''+vGrp+''')');
       Open;
  end;

  if QryDet.IsEmpty then begin
     QryDet.Insert;
     QryDet.FieldbyName('IDCAMPO').AsString := vId;
     QryDet.FieldbyName('CODGRUPOARQUIVO').AsString := qryGrupos.FieldbyName('CODGRUPOARQUIVO').AsString;
     try
        QryDet.Post;
        QryDet.ApplyUpDates;
     except
           QryDet.Cancel;
     end;
  end;

  vGrupo := qryGrupos.FieldbyName('CODGRUPOARQUIVO').AsString;
  vIdOld := vId;

  frmAguarde.Apaga;

  if Qry.State = dsInsert then begin
     dblkpGrupo.Text := '';
     dblkpGrupo.Enabled := True;
  end else
      dblkpGrupo.Enabled := False;
end;


procedure TfrmCadCampos.CmeCadastroInsert(Sender: TObject);
begin
     Inherited;
     dedIdCampo.SetFocus;
     chkObrig.Checked := False;
     chkvirtual.Checked := False;
     chkChave.Checked := False;
     dblkpGrupo.Text := '';
end;

procedure TfrmCadCampos.CmeCadastroEdit(Sender: TObject);
begin
     chkObrig.Checked := False;
     if Qry.FieldbyName('FLGOBRIGATORIO').AsInteger = 1 then
        chkObrig.Checked := True;

     chkvirtual.Checked := False;
     if Qry.FieldbyName('CAMPODOBANCO').AsInteger = 2 then
        chkvirtual.Checked := True;

     chkChave.Checked := False;
     if Qry.FieldbyName('CHAVE').AsInteger = 1 then
        chkChave.Checked := True;
     Inherited;
     dedIdCampo.SetFocus;

     dblkpGrupo.LookupValue := QryDet.FieldbyName('CODGRUPOARQUIVO').AsString;
     if qryGrupos.Locate('CODGRUPOARQUIVO', dblkpGrupo.LookupValue, []) then
        dblkpGrupo.Text := qryGrupos.FieldbyName('DESCRICAO').AsString;
end;


procedure TfrmCadCampos.sbtnApagarClick(Sender: TObject);
var
   vIdAux : String;
begin
     vIdAux := Qry.FieldbyName('IDCAMPO').AsString;
     if (MsgDlg('Deseja realmente excluir este registro?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then begin
        frmAguarde.Mostra('Verificando Integridade ...');
        frmAguarde.Refresh;
        with QryAux do begin
             Close;
             Sql.Clear;
             Sql.Add( 'SELECT A.IDCAMPO, A.IDCAMPO2 FROM ALGREGRA A WHERE '+
                      '((A.IDCAMPO = '+QuotedStr(vIdAux)+') OR (A.IDCAMPO2 = '+QuotedStr(vIdAux)+')) OR '+
                      '((A.IDCAMPO = '+QuotedStr(vIdAux)+') AND (A.IDCAMPO2 = '+QuotedStr(vIdAux)+'))');
             Open;
        end;

        if not QryAux.IsEmpty then begin
           MsgDlg('Existe alguma chamada a este campo por alguma regra.', 'Erro', mtConfirmation, [mbOk],0);
           frmAguarde.Apaga;
           sbtnApagar.Down := False;
           Exit;
        end;

        frmAguarde.Mostra('Apagando dados ...');
        frmAguarde.Refresh;
        with QryAux do begin
             Close;
             Sql.Clear;
             Sql.Add('DELETE FROM CMPBDGRP WHERE (IDCAMPO = '''+vIdAux+''') AND ');
             Sql.Add('                            (CODGRUPOARQUIVO = '''+QryDet.FieldbyName('CODGRUPOARQUIVO').AsString+''')');
             ExecSql;

             Close;
             Sql.Clear;
             Sql.Add('DELETE FROM CMPBD WHERE (IDCAMPO = '''+vIdAux+''')');
             ExecSql;
        end;
        frmAguarde.Mostra('Selecionando dados ...');
        frmAguarde.Refresh;

        Qry.Close;
        Qry.Open;

        QryDet.Close;
        QryDet.Open;

        frmAguarde.Apaga;
   end;
   dblkpGrupo.Text := '';
   sbtnApagar.Down := False;
end;

procedure TfrmCadCampos.dblkpcmbArqExit(Sender: TObject);
begin
  inherited;
  if dblkpcmbArq.Text <> '' then begin
     with QryCampoEnt do begin
          Close;
          ParambyName('ENTIDADE').AsString := qryTabelas.FieldbyName('TABLENAME').AsString;
          Open;
     end;
  end else begin
      dblkpcmbArq.SetFocus;
  end;
end;

procedure TfrmCadCampos.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  dblkpGrupo.Enabled := True;
end;

procedure TfrmCadCampos.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  dblkpGrupo.Enabled := False;
end;

procedure TfrmCadCampos.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dblkpGrupo.Enabled := False;
end;

end.
