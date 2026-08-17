unit fCadPlanoPatroBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroDetalhe, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, Grids, Wwdbigrd,
  Wwdbgrid, TB97, ComCtrls, ExtCtrls, Mask, DBCtrls, wwdblook,
  MontaSelect, wwdbedit, TREdit;

type
  TfrmCadPlanoPatroBem = class(TfrmCadastroDetalhe)
    qryAux: TwwQuery;
    Label8: TLabel;
    dbePatro: TwwDBEdit;
    bbtnSelPatro: TBitBtn;
    Label1: TLabel;
    dbePlano: TwwDBEdit;
    bbtnSelPlano: TBitBtn;
    Label2: TLabel;
    edPercRateio: TRealEdit;
    Label11: TLabel;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    MSPatro: TMontaSelect;
    MSPlano: TMontaSelect;
    qryPatro: TwwQuery;
    dsPatro: TwwDataSource;
    qryPlano: TwwQuery;
    dsPlano: TwwDataSource;
    qryPlanoIDPLANOPREV: TFloatField;
    qryPlanoNOME: TStringField;
    dbgSelBens: TwwDBGrid;
    qrySelBens: TwwQuery;
    dsSelBens: TwwDataSource;
    qryIDBEM: TFloatField;
    qryIDPESSOA: TFloatField;
    qryIDPLANOPREV: TFloatField;
    qryIDPATRO: TFloatField;
    qryPPBPERCRATEIO: TFloatField;
    qryNOMEPATRO: TStringField;
    qryNOMEPLANOPREV: TStringField;
    updSelBens: TUpdateSQL;
    qrySelBensIDBEM: TFloatField;
    qrySelBensIDPESSOA: TFloatField;
    qrySelBensPLACA: TFloatField;
    qrySelBensDESBEM: TStringField;
    bbtnSelBens: TBitBtn;
    qryMovRateio: TwwQuery;
    updMovRateio: TUpdateSQL;
    qryMovRateioIDBEM: TFloatField;
    qryMovRateioIDPESSOA: TFloatField;
    qryMovRateioIDPLANOPREV: TFloatField;
    qryMovRateioIDPATRO: TFloatField;
    qryMovRateioPPBPERCRATEIO: TFloatField;
    qryPatroIDPATRO: TFloatField;
    qryPatroNOME: TStringField;

    // procedimentos definidos
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);

    function VerificaPreenchimento: boolean;

    // outros procedimentos
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnSelBensClick(Sender: TObject);
    procedure qrySelBensAfterScroll(DataSet: TDataSet);
    procedure bbtnSelPatroClick(Sender: TObject);
    procedure bbtnSelPlanoClick(Sender: TObject);
    procedure RemoveRateio(iIdBem : Integer; fIdPessoa,
                           fIdPatro, fIdPlano : Double);
    procedure sbtnInserirClick(Sender: TObject);

  private
    { Private declarations }
    Function SomaPercentuaisOk : Boolean;
  public
    { Public declarations }
  end;

var
  frmCadPlanoPatroBem: TfrmCadPlanoPatroBem;

implementation

{$R *.DFM}

uses uVerificaPreenchimento, uSistema, uMensErro, dBaseDados, uDatabase, fSelBem;

procedure TfrmCadPlanoPatroBem.FormShow(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   pnlControles.Enabled  := False;
   //-------------------------------------------------------------------------------------
   qrySelBens.Prepare;
   qry.Prepare;
   qrySelBens.Open;
   qry.Open;
end;
//========================================================================================
procedure TfrmCadPlanoPatroBem.bbtnSelBensClick(Sender: TObject);
begin
   inherited;
   Application.CreateForm(TfrmSelBem,frmSelBem);
   frmSelBem.FormStyle := FsNormal;
   frmSelBem.Visible   := False;
   frmSelBem.Top       := 84;
   frmSelBem.ShowModal;
   //-------------------------------------------------------------------------------------
   if (frmSelBem.bResult) then
   begin
      qrySelBens.DisableControls;
      qrySelBens.Close;
      qrySelBens.Open;
      frmSelBem.qry.First;
      while not frmSelBem.qry.EOF do
      begin
         if (frmSelBem.qryPROCESSAR.AsInteger = 1) then
         begin
            qrySelBens.Append;
            qrySelBensIDPESSOA.AsInteger := frmSelBem.qryIDPESSOA.AsInteger;
            qrySelBensIDBEM.AsInteger    := frmSelBem.qryIDBEM.AsInteger;
            qrySelBensPLACA.AsInteger    := frmSelBem.qryPLACA.AsInteger;
            qrySelBensDESBEM.AsString    := frmSelBem.qryDESBEM.AsString;
            qrySelBens.Post;
         end;
         //-------------------------------------------------------------------------------
         frmSelBem.qry.Next;
      end;
      qrySelBens.First;
      qrySelBens.EnableControls;
      sbtnAlterar.Enabled := not (frmSelBem.qry.IsEmpty);
      sbtnApagar.Enabled  := not (frmSelBem.qry.IsEmpty);
   end;
   //-------------------------------------------------------------------------------------
   frmSelBem.qry.Close;
   frmSelBem.qry.UnPrepare;
   frmSelBem.Release;
end;
//========================================================================================
procedure TfrmCadPlanoPatroBem.qrySelBensAfterScroll(DataSet: TDataSet);
begin
   inherited;
   qry.Close;
   qry.ParamS[0].asInteger  := qrySelBensIDBEM.AsInteger;
   qry.ParamS[1].asInteger  := qrySelBensIDPESSOA.AsInteger;
   qry.Open;
end;
//========================================================================================
procedure TfrmCadPlanoPatroBem.bbtnSelPatroClick(Sender: TObject);
begin
   inherited;
   MSPatro.Executar;
   Repaint;
   qryPatro.Close;
   if MSPatro.RetornouValor then
   begin
      Screen.Cursor := crHourGlass;
      qryPatro.ParamByName('PIDPATRO').AsInteger := StrToInt(MSPatro.ValoresChave[0]);
      qryPatro.Open;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
   end else
      qryIDPATRO.Clear;
end;
//========================================================================================
procedure TfrmCadPlanoPatroBem.bbtnSelPlanoClick(Sender: TObject);
begin
   inherited;
   MSPlano.Executar;
   Repaint;
   qryPlano.Close;
   if MSPlano.RetornouValor then
   begin
      Screen.Cursor := crHourGlass;
      qryPlano.ParamByName('PIDPLANO').AsInteger := StrToInt(MSPlano.ValoresChave[0]);
      qryPlano.Open;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
   end else
      qryIDPLANOPREV.Clear;
end;
//========================================================================================
function TfrmCadPlanoPatroBem.VerificaPreenchimento: boolean;
begin
   Result := False;
   try
      // Plano
      if qryPlanoIDPLANOPREV.isNULL then
         Raise EValidacao.CreateVal('É necessário selecionar o Plano Previdenciario!', bbtnSelPlano);
      // Patrocinadora
      if qryPatroIDPATRO.isNULL then
         Raise EValidacao.CreateVal('É necessário selecionar a Patrocinadora!', bbtnSelPatro);
      // Percentual de Rateio
      if (edPercRateio.Value <= 0) or (edPercRateio.Value > 100) then
         Raise EValidacao.CreateVal('Valor do Percentual do Rateio Inválido!', edPercRateio);
   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then
            MsgDlg(ev.message, 'Atenção', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then
            ev.Control.SetFocus;
         exit;
      end;
   end;
   Result := True;
end;
//========================================================================================
function TfrmCadPlanoPatroBem.SomaPercentuaisOk : Boolean;
Var
   fSomaPerc : Double;
   i : Integer;

begin
   Result := True;
   with dbgSelBens,dbgSelBens.DataSource.DataSet do
   begin
      DisableControls;
      for i := 0 to (SelectedList.Count - 1) do
      begin
         GotoBookmark(SelectedList.Items[i]);
         qry.Close;
         qry.ParamS[0].asInteger  := qrySelBensIDBEM.AsInteger;
         qry.ParamS[1].asInteger  := qrySelBensIDPESSOA.AsInteger;
         qry.Open;
         //-------------------------------------------------------------------------------
         fSomaPerc := 0;
         qry.First;
         while not qry.EOF do
         begin
            fSomaPerc := fSomaPerc + qryPPBPERCRATEIO.AsFloat;
            qry.Next;
         end;
         if (fSomaPerc <> 100.0) then
            result := False;
      end;
      EnableControls;
   end;
end;
//========================================================================================
procedure TfrmCadPlanoPatroBem.RemoveRateio(iIdBem : Integer; fIdPessoa,
                                            fIdPatro, fIdPlano : double);
begin
   qryMovRateio.Close;
   qryMovRateio.ParamByName('PIDBEM').asInteger  := iIdBem;
   qryMovRateio.ParamByName('PIDPESSOA').asFloat := fIdPessoa;
   qryMovRateio.ParamByName('PIDPLANO').asFloat  := fIdPlano;
   qryMovRateio.ParamByName('PIDPATRO').asFloat  := fIdPatro;
   qryMovRateio.Open;
   if not qryMovRateio.IsEmpty then
   begin
      qryMovRateio.Delete;
      qryMovRateio.ApplyUpdates;
   end;
end;
//========================================================================================
procedure TfrmCadPlanoPatroBem.bbtnConfirmarClick(Sender: TObject);
var
   i : integer;

begin
   if VerificaPreenchimento then
   begin
      with dbgSelBens,dbgSelBens.DataSource.DataSet do
      begin
         DisableControls;
         for i := 0 to (SelectedList.Count - 1) do
         begin
            GotoBookmark(SelectedList.Items[i]);
            //----------------------------------------------------------------------------
            qryMovRateio.Close;
            qryMovRateio.ParamByName('PIDBEM').asInteger  := qrySelBensIDBEM.AsInteger;
            qryMovRateio.ParamByName('PIDPESSOA').asFloat := qrySelBensIDPESSOA.AsFloat;
            qryMovRateio.ParamByName('PIDPLANO').asFloat  := qryPlanoIDPLANOPREV.AsFloat;
            qryMovRateio.ParamByName('PIDPATRO').asFloat  := qryPatroIDPATRO.AsFloat;
            qryMovRateio.Open;
            if not qryMovRateio.IsEmpty then
            begin
               RemoveRateio(qrySelBensIDBEM.AsInteger, qrySelBensIDPESSOA.AsFloat,
                            qryPatroIDPATRO.AsFloat, qryPlanoIDPLANOPREV.AsFloat);
            end;
            //----------------------------------------------------------------------------
            qryMovRateio.Append;
            qryMovRateioIDBEM.asInteger       := qrySelBensIDBEM.AsInteger;
            qryMovRateioIDPESSOA.asFloat      := qrySelBensIDPESSOA.AsFloat;
            qryMovRateioIDPLANOPREV.asFloat   := qryPlanoIDPLANOPREV.AsFloat;
            qryMovRateioIDPATRO.asFloat       := qryPatroIDPATRO.AsFloat;
            qryMovRateioPPBPERCRATEIO.asFloat := edPercRateio.Value;
            qryMovRateio.Post;
            qryMovRateio.ApplyUpdates;
         end;
         EnableControls; 
         //-------------------------------------------------------------------------------
         if not SomaPercentuaisOk then
            MsgDlg('A soma dos percentuais do rateio de custo por Plano/Patrocinadora ' + #13 +
                   'dos bens selecionados está diferente de 100%', 'ALERTA',
                    mtWarning, [mbOk], 0);
      end;
   end;
   //-------------------------------------------------------------------------------------
   if qry.IsEmpty then
   begin
      CmeCadastro.Operacao := opVazio
   end else
   begin
      CmeCadastro.Operacao := opIdle;
   end;
   AtualizaBotoes;
   inherited;
   pnlControles.Enabled := False;
   pnlGrd.Enabled       := True;
   dbgSelBens.Enabled   := True;
end;
//========================================================================================
procedure TfrmCadPlanoPatroBem.sbtnInserirClick(Sender: TObject);
begin
   dbgSelBens.Enabled := False;
   inherited;
end;
//========================================================================================
procedure TfrmCadPlanoPatroBem.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   if bbtnSelPatro.CanFocus then
      bbtnSelPatro.SetFocus;
end;
//========================================================================================
procedure TfrmCadPlanoPatroBem.sbtnApagarClick(Sender: TObject);
begin
   if (MsgDlg('Deseja realmente remover este registro?', 'Remover',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes) then CmeCadastro.Delete(Self);
   //-------------------------------------------------------------------------------------
   if qry.IsEmpty then
   begin
      CmeCadastro.Operacao := opVazio;
   end else
   begin
      CmeCadastro.Operacao := opIdle;
   end;
   AtualizaBotoes;
   //-------------------------------------------------------------------------------------
   pnlControles.Enabled := False;
   pnlGrd.Enabled       := True;
   qrySelBens.First;
end;
//========================================================================================
procedure TfrmCadPlanoPatroBem.CmeCadastroDelete(Sender: TObject);
var
   i : integer;

begin
   with dbgSelBens,dbgSelBens.DataSource.DataSet do
   begin
      DisableControls;
      for i := 0 to (SelectedList.Count - 1) do
      begin
         GotoBookmark(SelectedList.Items[i]);
         //-------------------------------------------------------------------------------
         RemoveRateio(qrySelBensIDBEM.AsInteger, qrySelBensIDPESSOA.AsFloat,
                      qryIDPATRO.AsFloat, qryIDPLANOPREV.AsFloat);
      end;
      EnableControls;
   end;
   //-------------------------------------------------------------------------------------
   if not SomaPercentuaisOk then
      MsgDlg('A soma dos percentuais do rateio de custo por Plano/Patrocinadora ' + #13 +
             'dos bens selecionados está diferente de 100%', 'ALERTA',
              mtWarning, [mbOk], 0);
end;

end.
