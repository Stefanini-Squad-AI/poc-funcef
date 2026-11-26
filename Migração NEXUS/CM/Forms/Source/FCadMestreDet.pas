unit FCadMestreDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMulti, wwidlg, Db, Wwdatsrc, DBCtrls, StdCtrls, Buttons, MAHlpBtn,
  ExtCtrls, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, DBTables, wwQuery,
  cmseldlg, ToolWin, FCadastro, TB97, MontaSelect, TB97Ctls, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, ImgList, ActnList, CmDock, wwDialog,
  CmEventosCadastro, Gauges, fcLabel;

type
  TfrmCadMestreDetalhe = class(TfrmCadastroMulti)
    dsDet: TwwDataSource;
    pnlMestre: TPanel;
    pnlDetalhe: TPanel;
    pgctrlDetalhe: TPageControl;
    tbshDetalhe: TTabSheet;
    pnlControlesDet: TPanel;
    Panel4: TPanel;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    dbgrdDet: TwwDBGrid;
    pnlBarraDetalhe: TPanel;
    sbtnProcDet: TSpeedButton;
    sbtnApagDet: TSpeedButton;
    sbtnAltDet: TSpeedButton;
    sbtnInsDet: TSpeedButton;
    CmeDetalhe: TCmEventosCadastro;
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnApagDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure HabilitaPainel( panel : TPanel ; flag : boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dbnavClick(Sender: TObject; Button: TNavigateBtn);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);

  protected

  private
     bkmkFilho : TBookMark;
     function VerificaMestre : boolean;
  public

  end;

{ TODO -oGustavo Viegas -cCadastros : Verificar métodos implementados no form e ultilizar o componente CmeCadastro }

var
  frmCadMestreDetalhe: TfrmCadMestreDetalhe;

implementation

uses UMensErro, uAutorizacao;

{$R *.DFM}


procedure Tfrmcadmestredetalhe.HabilitaPainel( panel : TPanel ; flag : boolean);
begin
  panel.Visible := flag;
  AutorizarForm(afSoDesabilitar);
end;

function  Tfrmcadmestredetalhe.VerificaMestre : boolean;
begin
  if Ds.DataSet.Active then
  begin
      if Ds.DataSet.State in ([dsInsert,dsEdit]) then
         Result := true
      else
          if (Ds.DataSet.IsEmpty) then
             Result := false
          else
              Result := true;
  end
  else
     Result := false;
end;

procedure TfrmCadMestreDetalhe.sbtnInsDetClick(Sender: TObject);
begin
   inherited;
   try
     If VerificaMestre Then
     Begin
       if ds.DataSet.State = dsInsert
       then begin
          FazendoCloseOpen := True;
          CmeCadastro.Confirma(Self);
          FazendoCloseOpen := False;
          FlagInsert := True;
          //dsDet.DataSet.Edit;
          FlagInsert := False;
       end;

       CmeDetalhe.Insert(Self);

       dbGrdDet.SendToBack;
       HabilitaPainel(pnlControlesDet , true);
     End;
   except
      sbtnInsDet.Down := False;
      raise;
   end; { Except }
end;

procedure TfrmCadMestreDetalhe.sbtnAltDetClick(Sender: TObject);
begin
   inherited;
   if dsDet.DataSet.State = dsEdit
   then begin
      sbtnAltDet.Down := True;
      Exit;
   end;
   if dsDet.DataSet.state = dsInsert
   then exit;
   try
      if ds.DataSet.state = dsBrowse
      then begin
         bkmkFilho := dsDet.DataSet.GetBookmark;
         sbtnAlterar.Click;   //Verificar o Repetirinsert
         dsDet.DataSet.GotoBookmark(bkmkFilho);
         dsDet.DataSet.FreeBookmark(bkmkFilho);
      end;

      if ds.DataSet.state = dsInsert
      then begin
         FazendoCloseOpen := True;
         CmeCadastro.Confirma(Self);
         FazendoCloseOpen := False;
         FlagInsert := True;
         sbtnAlterar.Click;
         FlagInsert := False;
      end;
      { Altera registro na tabela}
      CmeDetalhe.Edit(Self);
      dbGrdDet.SendToBack; //Visible        := False;
      HabilitaPainel(pnlControlesDet , true );
   except
      sbtnAltDet.Down := False;
      Raise;
   end; { Except }
   if dsDet.DataSet.State <> dsBrowse
   then begin
      sbtnAltDet.Down := True;
      Exit;
   end;
end;

procedure TfrmCadMestreDetalhe.sbtnApagDetClick(Sender: TObject);
begin
   inherited;
   { Desce o botão Procurar }
   sbtnApagDet.Down := True;

   if ds.DataSet.state = dsBrowse
   then begin
      bkmkFilho := dsDet.DataSet.GetBookmark;
      sbtnAlterar.Click;
      dsDet.DataSet.GotoBookmark(bkmkFilho);
      dsDet.DataSet.FreeBookmark(bkmkFilho);
   end;

   { testa se a tabela está vazia }
   if dsDet.DataSet.IsEmpty
   then begin
		MsgDlg('Tabela está vazia','Erro',mtError,[mbOk, mbHelp], 0);
		sbtnApagDet.Down := False;
		Exit;
   end;

   CmeDetalhe.Delete(Self);
   { Sobe o botão de Apagar }
   sbtnApagDet.Down := False;
end;

procedure TfrmCadMestreDetalhe.bbtnOkDetClick(Sender: TObject);
VAR Stat : TDataSetState;
begin
  inherited;
  Stat := dsDet.DataSet.State;
  if Stat = dsInsert
  then begin
     dsDet.DataSet.Post;
     dsDet.DataSet.Insert;
  end
  else
  begin
     dbGrdDet.BringToFront; //Visible        := True;
     HabilitaPainel( pnlControlesDet , false );
     CmeCadastro.Confirma(Self);//Post,Close,Open e Locate na qry do filho
     sbtnInsdet.Down := False;
     sbtnAltdet.Down := False;
     dbgrdDet.ApplySelected;//new
  end;
end;

procedure TfrmCadMestreDetalhe.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;
   try
      dsDet.DataSet.Cancel;
      dsDet.DataSet.Close;
      dsDet.DataSet.Open;
      dbGrdDet.BringToFront;
      dbgrdDet.ApplySelected; //new
      HabilitaPainel(pnlControlesDet , False );
   except Raise;
   end; { Except }
end;

procedure TfrmCadMestreDetalhe.FormCreate(Sender: TObject);
begin
   inherited;
   dbGrdDet.BringToFront; //Visible        := True;
   pnlControlesDet.SendToBack; //Visible := False;
   dbgrdDet.ApplySelected; //new
end;

procedure TfrmCadMestreDetalhe.sbtnInserirClick(Sender: TObject);
begin
     inherited;
     dbgrdDet.ApplySelected;
     pgctrldetalhe.enabled := true;
     AutorizarForm(afSoDesabilitar);
end;

procedure TfrmCadMestreDetalhe.bbtnConfirmarClick(Sender: TObject);
begin
     inherited;
     pgctrldetalhe.enabled := true;
     AutorizarForm(afSoDesabilitar);
end;

procedure TfrmCadMestreDetalhe.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
{ Padroes 98
   pgctrldetalhe.enabled := true;
   sbtnInserir.down := false ;  Padroes 98
   sbtnAlterar.down := false ;  Padroes 98

   FazendoCloseOpen := True;

   bkmkPai := ds.DataSet.GetBookmark; //new
   ds.DataSet.Close;
   ds.DataSet.Open;
   ds.DataSet.GotoBookmark(bkmkPai); //new
   ds.DataSet.FreeBookmark(bkmkPai); //new

   FazendoCloseOpen := False;
}
   //Para dar o refresh no grid do filho
{ Padroes 98
   dsDet.DataSet.Close;
   dsDet.DataSet.Open;
   dbgrdDet.ApplySelected; //new
}
end;

procedure TfrmCadMestreDetalhe.dsDetStateChange(Sender: TObject);
var
   Estado: TDataSetState;
begin
   inherited;
   { Configura o estado dos botões }
   if ds.DataSet <> Nil then begin
      Estado := dsDet.DataSet.State;
      sbtnInsDet.down := (Estado = dsinsert );
      sbtnAltDet.down := (Estado = dsedit );
      sbtnInsDet.Enabled  := (Estado <> dsEdit);
      sbtnAltDet.Enabled  := (Estado <> dsInsert);
      sbtnProcDet.Enabled := (Estado = dsBrowse);
      sbtnApagDet.Enabled   := (Estado = dsBrowse);
      bbtnOkDet.Enabled := (Estado in [dsEdit, dsInsert]);
      bbtnCancelarDet.Enabled  := (Estado in [dsEdit, dsInsert]);
      sbtnInsdet.Down  := Estado = dsInsert;
      sbtnAltdet.Down  := Estado = dsEdit;
   end;
   AutorizarForm(afSoDesabilitar);
end;

procedure TfrmCadMestreDetalhe.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
  sbtnAltDet.Click;
end;

procedure TfrmCadMestreDetalhe.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  dbgrdDet.ApplySelected;//new
end;

procedure TfrmCadMestreDetalhe.dbnavClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  dbgrdDet.ApplySelected;//new
end;

procedure TfrmCadMestreDetalhe.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  dsDet.DataSet.Insert;
end;

procedure TfrmCadMestreDetalhe.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  dsDet.DataSet.Edit;
end;

procedure TfrmCadMestreDetalhe.CmeDetalheDelete(Sender: TObject);
begin
  inherited;
  try
    if MsgDlg('Deseja realmente apagar este registro?', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then
       dsDet.DataSet.Delete;
  except
    Raise;
  end;
end;

end.
