unit FCadArquivoInterface;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDet, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn,
  ComCtrls, ToolWin, Buttons, StdCtrls, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, DBTables, Wwquery, wwdblook, Mask, wwdbedit, TB97,
  CmEventosCadastro, wwDialog, ImgList, IvDictio, IvMulti, IvEMulti,
  TB97Tlbr, TB97Ctls;

type
  TfrmCadArquivoInterface = class(TfrmCadMestreDetalhe)
    qryArquivo: TwwQuery;
    qryHeader: TwwQuery;
    qryCampos: TwwQuery;
    dsDet2: TwwDataSource;
    Label1: TLabel;
    Origem: TLabel;
    Destino: TLabel;
    dbgrpTipoInterface: TDBRadioGroup;
    dbedNomeArq: TwwDBEdit;
    dbedOrigem: TwwDBEdit;
    dbedDestino: TwwDBEdit;
    tbsCampos: TTabSheet;
    Panel1: TPanel;
    sbtnProcDet2: TSpeedButton;
    sbtnApagDet2: TSpeedButton;
    sbtnAltDet2: TSpeedButton;
    sbtnInsDet2: TSpeedButton;
    pnlControlesDet2: TPanel;
    Panel3: TPanel;
    bbtnOkDet2: TBitBtn;
    bbtnCancelarDet2: TBitBtn;
    dbgrdDet2: TwwDBGrid;
    Label11: TLabel;
    dbedNomeColHeader: TwwDBEdit;
    Label17: TLabel;
    dblkpcmbTpColHeader: TwwDBLookupCombo;
    Label16: TLabel;
    dbedTamColHeader: TwwDBEdit;
    Label15: TLabel;
    dbedNumOrdHeader: TwwDBEdit;
    Label12: TLabel;
    dbedSigColHeader: TwwDBEdit;
    qryTipoDado: TwwQuery;
    Label2: TLabel;
    dbedNomeCol: TwwDBEdit;
    Label3: TLabel;
    dblkpcmbTipoCol: TwwDBLookupCombo;
    Label4: TLabel;
    dbedTamCol: TwwDBEdit;
    Label5: TLabel;
    dbedNumOrdCol: TwwDBEdit;
    Label6: TLabel;
    dbedSigCol: TwwDBEdit;
    bbtnRelColCMP: TBitBtn;
    grpCMPCol: TGroupBox;
    edCMPCol: TEdit;
    qryAux: TwwQuery;
    qryCMPBD: TwwQuery;
    bbtnRelHeadCMP: TBitBtn;
    grpCMPHeader: TGroupBox;
    edCMPHeader: TEdit;
    grpValor: TGroupBox;
    dbedValor: TwwDBEdit;
    GroupBox1: TGroupBox;
    dbedValorCampo: TwwDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure sbtnInsDet2Click(Sender: TObject);
    procedure sbtnAltDet2Click(Sender: TObject);
    procedure sbtnApagDet2Click(Sender: TObject);
    procedure bbtnOkDet2Click(Sender: TObject);
    procedure bbtnCancelarDet2Click(Sender: TObject);
    procedure qryArquivoAfterInsert(DataSet: TDataSet);
    procedure qryCamposAfterInsert(DataSet: TDataSet);
    procedure qryHeaderAfterInsert(DataSet: TDataSet);
    function VerificaMestre : boolean; //override;
    function PostMestre : boolean ; //override;
    function PostDetalhe: Boolean; //override;
    procedure dsDet2StateChange(Sender: TObject);
    procedure qryArquivoAfterScroll(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure qryArquivoBeforeDelete(DataSet: TDataSet);
    procedure dsDetStateChange(Sender: TObject);
    procedure bbtnRelHeadCMPClick(Sender: TObject);
    procedure bbtnRelColCMPClick(Sender: TObject);
    procedure qryHeaderAfterEdit(DataSet: TDataSet);
    procedure qryCamposAfterEdit(DataSet: TDataSet);
    procedure qryArquivoBeforePost(DataSet: TDataSet);
    procedure qryHeaderBeforePost(DataSet: TDataSet);
    procedure qryCamposBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    bkmkPai2 : TBookMark;
    bkmkFilho2 : TBookMark;
    function  PostDetalhe2 : boolean;
  public
    { Public declarations }
  end;

var
  frmCadArquivoInterface: TfrmCadArquivoInterface;

implementation

uses UMensErro, UDataBase, FCamposBanco,UAutorizacao, USistema;

{$R *.DFM}

function  TfrmCadArquivoInterface.VerificaMestre : boolean;
begin
  { Neste procedimento devemos testar se os campos obrigatorios
    estão preenchidos }
   Result := False;
   if Trim(qryArquivo.FieldByName('NomeArq').AsString) = ''
   then begin
      MsgDlg('Nome do Arquivo não preenchido','Erro',mtError,[mbOk,mbHelp],0);
      dbedNomeArq.SetFocus;
      Exit;
   end;

   if dbgrpTipoInterface.ItemIndex < 0
   then begin
       if MsgDlg('Tipo de Interface não preenchido. ','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
       then begin
          dbgrpTipoInterface.SetFocus;
          Exit;
       end
   end;
   Result := True;
end;

function  TfrmCadArquivoInterface.PostMestre : boolean;
var
   iIdArq : Integer;
begin
    // Post na Query do Pai e posicionamento no registro que está sendo inserido.
    iIdArq := qryArquivo.fieldbyname('IdArq').AsInteger;
    if qryArquivo.State in [dsinsert, dsedit]
    then begin
       try
          qryArquivo.Post;
          qryArquivo.Close;
          qryArquivo.Open;
          qryArquivo.Locate('IdArq' , iIdArq, [loCaseInsensitive]);
          Result := true;
       except
          on E:EDBEngineError do
          begin
             MostrarErro(E);
             Result := False;
          end;//on
       end;//try
    end
    else begin
       Result := false;
    end
end;

function TfrmCadArquivoInterface.PostDetalhe: Boolean;
var  varfields : variant;
begin
    //Post,Close, Open e Locate no Detalhe

    if qryHeader.State in [dsinsert, dsedit]
    then begin
       try
          varFields := VarArrayCreate([0,1],varVariant);
          varFields[0] := qryHeader.FieldByName('IdArq').AsInteger;
          varFields[1] := qryHeader.FieldByName('IdCampoHead').AsInteger;

          qryHeader.Post;

          qryHeader.close;
          qryHeader.open;

          qryHeader.Locate('IdArq;IdCampoHead',varFields,[loCaseInsensitive]);
          Result := true;
       except
          Raise;
          Result := false;
       end;
    end
    else begin
       Result := false;
    end
end;


function TfrmCadArquivoInterface.PostDetalhe2;
var  varfields : variant;
begin
    //Post,Close, Open e Locate no Detalhe
    if qryCampos.State in [dsinsert, dsedit]
    then begin
       try
          varFields := VarArrayCreate([0,1],varVariant);
          varFields[0] := qryCampos.FieldByName('IdArq').AsInteger;
          varFields[1] := qryCampos.FieldByName('IdCampoArq').AsInteger;

          qryCampos.Post;

          qryCampos.Close;
          qryCampos.ParamByName('iIdArq').AsInteger :=
                     qryArquivo.FieldByName('IdArq').AsInteger;
          qryCampos.Open;
          qryCampos.Locate('IdArq;IdCampoArq' , varFields , [loCaseInsensitive]);
          
          Result := true;
       except
          Raise;
          Result := false;
       end;
    end
    else begin
       Result := false;
    end
end;

procedure TfrmCadArquivoInterface.FormActivate(Sender: TObject);
begin
  inherited;
  qryTipoDado.Close;
  qryTipoDado.Open;
  qryCMPBD.Close;
  qryCMPBD.Open;

  qryArquivo.Close;
  qryArquivo.Open;
  qryArquivo.First;

  qryHeader.Close;
  qryHeader.ParambyName('iIdArq').AsInteger := qryArquivo.FieldByName('IdArq').AsInteger;
  qryHeader.Open;

  qryCampos.Close;
  qryCampos.ParambyName('iIdArq').AsInteger := qryArquivo.FieldByName('IdArq').AsInteger;
  qryCampos.Open;

end;


procedure TfrmCadArquivoInterface.sbtnInsDet2Click(Sender: TObject);
begin
  inherited;
   try
      if VerificaMestre
      then begin
         if ds.DataSet.State = dsInsert
         then begin
            FazendoCloseOpen := True;
            PostMestre;
            FazendoCloseOpen := False;
            FlagInsert := True;
            ds.DataSet.Edit;
            FlagInsert := False;
         end;

         if ds.DataSet.state = dsBrowse
         then sbtnAlterar.Click;

         dsDet2.DataSet.Insert;
         dbGrdDet2.SendToBack;
         HabilitaPainel(pnlControlesDet2 , true);
      end;
   except
      sbtnInsDet2.Down := False;
      raise;
   end; { Except }

end;

procedure TfrmCadArquivoInterface.sbtnAltDet2Click(Sender: TObject);
begin
  inherited;
   if dsDet2.DataSet.State = dsEdit
   then begin
      sbtnAltDet2.Down := True;
      Exit;
   end;
   if dsDet2.DataSet.state = dsInsert
   then exit;
   try
      if ds.DataSet.state = dsBrowse
      then begin
         bkmkFilho2 := dsDet2.DataSet.GetBookmark;
         sbtnAlterar.Click;   //Verificar o Repetirinsert
         dsDet2.DataSet.GotoBookmark(bkmkFilho2);
         dsDet2.DataSet.FreeBookmark(bkmkFilho2);
      end;

      if ds.DataSet.state = dsInsert
      then begin
         FazendoCloseOpen := True;
         PostMestre;
         FazendoCloseOpen := False;
         FlagInsert := True;
         sbtnAlterar.Click;
         FlagInsert := False;
      end;
      { Altera registro na tabela}
      dsDet2.DataSet.Edit;
      dbGrdDet2.SendToBack; //Visible        := False;
      HabilitaPainel(pnlControlesDet2 , true );
   except
      sbtnAltDet2.Down := False;
      Raise;
   end; { Except }
   if dsDet2.DataSet.State <> dsBrowse
   then begin
      sbtnAltDet2.Down := True;
      Exit;
   end;

end;

procedure TfrmCadArquivoInterface.sbtnApagDet2Click(Sender: TObject);
begin
  inherited;
   { Desce o botão Procurar }
   sbtnApagDet2.Down := True;

   if ds.DataSet.state = dsBrowse
   then begin
      bkmkFilho2 := dsDet2.DataSet.GetBookmark;
      sbtnAlterar.Click;
      dsDet2.DataSet.GotoBookmark(bkmkFilho2);
      dsDet2.DataSet.FreeBookmark(bkmkFilho2);
   end;

   { testa se a tabela está vazia }
   if dsDet2.DataSet.RecordCount = 0
   then begin
		MsgDlg(LerMensagem(10),LerMensagem(2),mtError,[mbOk, mbHelp], 0);
		sbtnApagDet2.Down := False;
		Exit;
   end;

   { Tenta apagar o registro }
   try
      { Pergunta se deseja realmente apagar }
      if MsgDlg(LerMensagem(11), LerMensagem(4), mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes
      then dsDet2.DataSet.Delete;
   except Raise;
   end; { Except }

   { Sobe o botão de Apagar }
   sbtnApagDet2.Down := False;

end;

procedure TfrmCadArquivoInterface.bbtnOkDet2Click(Sender: TObject);
VAR Stat : TDataSetState;
begin
  inherited;
  Stat := dsDet2.DataSet.State;
  if Stat = dsInsert
  then begin
     dsDet2.DataSet.Post;
     dsDet2.DataSet.Insert;
  end
  else begin
     dbGrdDet2.BringToFront;
     HabilitaPainel( pnlControlesDet2 , false );
     PostDetalhe2;//Post,Close,Open e Locate na qry do filho
     sbtnInsdet2.Down := False;
     sbtnAltdet2.Down := False;
     dbgrdDet2.ApplySelected;//new
  end;

end;

procedure TfrmCadArquivoInterface.bbtnCancelarDet2Click(Sender: TObject);
begin
  inherited;
   try
      dsDet2.DataSet.Cancel;
      dsDet2.DataSet.Close;
      dsDet2.DataSet.Open;
      dbGrdDet2.BringToFront;
      dbgrdDet2.ApplySelected; //new
      HabilitaPainel(pnlControlesDet2,False);
   except Raise;
   end; { Except }


end;

procedure TfrmCadArquivoInterface.qryArquivoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryArquivo.FieldByName('IdArq').AsInteger :=  LeUltRegistro(qryaux, 'ARQUIVO');
  qryArquivo.FieldByName('Entrada').AsInteger := 1;
  dbgrpTipoInterface.ItemIndex := 0;
end;

procedure TfrmCadArquivoInterface.qryCamposAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryCampos.FieldByName('IdArq').AsInteger := qryArquivo.FieldByName('IdArq').AsInteger;
  qryCampos.FieldByName('IdCampoArq').AsInteger := LeUltRegistro(qryAux,'CAMPOARQ');
  edCMPCol.Text := '';
  grpCMPCol.Visible := False;

end;

procedure TfrmCadArquivoInterface.qryHeaderAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryHeader.FieldByName('IdArq').AsInteger := qryArquivo.FieldByName('IdArq').AsInteger;
  qryHeader.FieldByName('IdCampoHead').AsInteger := LeUltRegistro(qryAux,'HEADER');
  edCMPHeader.Text := '';
  grpCMPHeader.Visible := False;
end;

procedure TfrmCadArquivoInterface.dsDet2StateChange(Sender: TObject);
var
   Estado: TDataSetState;
begin
   inherited;
   { Configura o estado dos botões }
   if ds.DataSet <> Nil then begin
      Estado := dsDet2.DataSet.State;
      sbtnInsDet2.down := (Estado = dsinsert );
      sbtnAltDet2.down := (Estado = dsedit );
      sbtnInsDet2.Enabled  := (Estado <> dsEdit);
      sbtnAltDet2.Enabled  := (Estado <> dsInsert);
      sbtnProcDet2.Enabled := (Estado = dsBrowse);
      sbtnApagDet2.Enabled   := (Estado = dsBrowse);
      bbtnOkDet2.Enabled := (Estado in [dsEdit, dsInsert]);
      bbtnCancelarDet2.Enabled  := (Estado in [dsEdit, dsInsert]);
      sbtnInsdet2.Down  := Estado = dsInsert;
      sbtnAltdet2.Down  := Estado = dsEdit;
   end;
  // Configurar botao de relacionar campo do banco
  if dsDet.DataSet.State in [dsEdit,dsInsert]
  then begin
    if Trim(edCMPHeader.Text) <> ''
    then grpCMPHeader.Visible := True
    else grpCMPHeader.Visible := False;
  end;
   
end;

procedure TfrmCadArquivoInterface.qryArquivoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryHeader.Close;
  qryHeader.ParambyName('iIdArq').AsInteger := qryArquivo.FieldByName('IdArq').AsInteger;
  qryHeader.Open;

  qryCampos.Close;
  qryCampos.ParambyName('iIdArq').AsInteger := qryArquivo.FieldByName('IdArq').AsInteger;
  qryCampos.Open;
end;

procedure TfrmCadArquivoInterface.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  // Apagar Header

end;

procedure TfrmCadArquivoInterface.qryArquivoBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;

  with qryAux do begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE HEADER WHERE IDARQ = '+qryArquivo.FieldByName('IdArq').AsString);
     try
        ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;
     Close;
  end;

  with qryAux do begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE CAMPOARQ WHERE IDARQ = '+qryArquivo.FieldByName('IdArq').AsString);
     try
        ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;
     Close;
  end;
end;

procedure TfrmCadArquivoInterface.dsDetStateChange(Sender: TObject);
begin
  inherited;
  // Configurar botao de relacionar campo do banco
  if dsDet.DataSet.State in [dsEdit,dsInsert]
  then begin
    if Trim(edCMPHeader.Text) <> ''
    then grpCMPHeader.Visible := True
    else grpCMPHeader.Visible := False;
  end;
end;

procedure TfrmCadArquivoInterface.bbtnRelHeadCMPClick(Sender: TObject);
var sIdCampo : string;
    sNomeCampo : string;
begin
  inherited;
  frmCamposBanco := TfrmCamposBanco.Create(Self);
  sIdCampo := frmCamposBanco.LerCampoBanco(dbedNomeArq.Text,
                             dbedNomeColHeader.Text,
                             sNomeCampo);
  frmCamposBanco.Free;
  if sIdCampo <> ''
  then begin
     qryHeader.FieldByName('IdCampo').AsString := sIdCampo;
     edCMPHeader.Text := sNomeCampo;
     grpCMPHeader.Visible := True;
  end;
end;

procedure TfrmCadArquivoInterface.bbtnRelColCMPClick(Sender: TObject);
var sIdCampo : string;
    sNomeCampo : string;
begin
  inherited;
  frmCamposBanco := TfrmCamposBanco.Create(Self);
  sIdCampo := frmCamposBanco.LerCampoBanco( dbedNomeArq.Text,
                             dbedNomeCol.Text,
                             sNomeCampo);
  frmCamposBanco.Free;
  if sIdCampo <> ''
  then begin
     qryCampos.FieldByName('IdCampo').AsString := sIdCampo;
     edCMPCol.Text := sNomeCampo;
     dbedValorCampo.Text := '';
     grpCMPCol.Visible := True;
  end;

end;

procedure TfrmCadArquivoInterface.qryHeaderAfterEdit(DataSet: TDataSet);
begin
  inherited;
  if Trim(qryHeader.FieldByName('IdCampo').AsString) <> ''
  then begin
     grpCMPHeader.Visible := True;
     if qryCMPBD.Locate('IdCampo',qryHeader.FieldByName('IdCampo').AsString,[loCaseInsensitive])
     then edCMPHeader.Text := qryCMPBD.FieldByName('NomeDoCampo').AsString
     else edCMPHeader.Text := '';
  end
  else begin
     grpCMPHeader.Visible := False;
     edCMPHeader.Text := '';
  end;


end;

procedure TfrmCadArquivoInterface.qryCamposAfterEdit(DataSet: TDataSet);
begin
  inherited;
  if Trim(qryCampos.FieldByName('IdCampo').AsString) <> ''
  then begin
     grpCMPCol.Visible := True;
     if qryCMPBD.Locate('IdCampo',qryCampos.FieldByName('IdCampo').AsString,[loCaseInsensitive])
     then edCMPCol.Text := qryCMPBD.FieldByName('NomeDoCampo').AsString
     else edCMPCol.Text := '';
  end
  else begin
     grpCMPCol.Visible := False;
     edCMPCol.Text := '';
  end;
end;

procedure TfrmCadArquivoInterface.qryArquivoBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryArquivo.FieldByName('IdPessoa').AsInteger := Sistema.IdUsuario;
end;

procedure TfrmCadArquivoInterface.qryHeaderBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryHeader.FieldByName('IdPessoa').AsInteger := qryArquivo.FieldByName('IdPessoa').AsInteger;
end;

procedure TfrmCadArquivoInterface.qryCamposBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryCampos.FieldByName('IdPessoa').AsInteger := qryArquivo.FieldByName('IdPessoa').AsInteger;
end;




end.
