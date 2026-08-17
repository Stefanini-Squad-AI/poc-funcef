unit FCadMestreDetCS;

{//Alterações:----------------------------------------------------------------------------------------------------------------------
Nº SIG:........... 57607
Data da Alteração: 27/10/2017
Responsável......: Andre Imakawa
Descrição........: Desfazer o SIG 57147.
------------------------------------------------------------------------------------------------------------------------------------
Nº SIG:........... 57147
Data da Alteração: 23/10/2017
Responsável......: Andre Imakawa
Descrição........: Correção do painel importar arquivo.
------------------------------------------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwidlg, Db, Wwdatsrc, DBCtrls, StdCtrls, Buttons, MAHlpBtn,
  ExtCtrls, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, DBTables, wwQuery,
  ToolWin, TB97, MontaSelect, FCadastroCS,
  TabControlDetalhe, uDataBase, TB97Tlbr, TB97Ctls, IvDictio, IvMulti,
  IvEMulti, Mask, wwdbedit, ImgList, ActnList, CmEventosCadastro{$IFNDEF VER0505}, uCMTypes,
  Gauges, fcLabel {$ENDIF};

type
  TfrmCadMestreDetalheCS = class(TfrmCadastroCS)
    dsDet: TwwDataSource;
    pnlMestre: TPanel;
    tbcDetalhe: TTabControlDetalhe;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    pgctrlDetalhe: TPageControl;
    tbsDet: TTabSheet;
    dbgrdDet: TwwDBGrid;
    pnlControlesDet: TPanel;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    CmeDetalhe: TCmEventosCadastro;
    sbtnInsDet: TToolbarButton97;
    sbtnAltDet: TToolbarButton97;
    sbtnExcluiDet: TToolbarButton97;
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbcDetalheChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);

  protected
     grdAtual : TwwDBGrid;
     qryAtual : TwwQuery;
     procedure FazerVoltarDet;
     procedure HabilitaPainel( panel : TPanel ; flag : boolean);
  private
    { Private declarations }

     function VerificaMestre : boolean;
  public
    { Public declarations }
  end;

var
  frmCadMestreDetalheCS: TfrmCadMestreDetalheCS;

implementation

uses UMensErro, DBaseDados, uAutorizacao;

{ TODO -oGustavo Viegas -cCadastros : Verificar métodos implementados no form e
  ultilizar o componente CmeCadastro verificando métodos nos cadastros
  de pessoa e outros mestra detalhe }

{$R *.DFM}


procedure TfrmCadMestreDetalheCS.HabilitaPainel( panel : TPanel ; flag : boolean);
begin
   panel.Visible := flag;
   bbtnConfirmar.Enabled :=  not flag;
   bbtnCancelar.Enabled :=  not flag;
   AutorizarForm(afSoDesabilitar);
end;

function  TfrmCadMestreDetalheCS.VerificaMestre : boolean;
begin
     if qry.Active then
     begin
          if qry.State in ([dsInsert,dsEdit]) then
             Result := true
          else
              if (qry.IsEmpty) then
                 Result := false
              else
                  Result := true;
     end
     else
         Result := false;
end;


procedure TfrmCadMestreDetalheCS.sbtnInsDetClick(Sender: TObject);
begin
   inherited;
   if sbtnInsDet.Down then
   begin
        grdAtual.SendToBack;
        tb97Detalhe.Visible := true;
        CmeDetalhe.Insert(Self);
        CmeDetalhe.Atualizabotoes(Self);
        CmeDetalhe.Operacao := opInserir;
   end
   else
       sbtnInsDet.Down := true;
end;

procedure TfrmCadMestreDetalheCS.sbtnAltDetClick(Sender: TObject);
begin
   inherited;
   if sbtnAltDet.Down then
   begin
        grdAtual.SendToBack;
        tb97Detalhe.Visible := true;
        CmeDetalhe.Edit(Self);
        CmeDetalhe.Atualizabotoes(Self);
        CmeDetalhe.Operacao := opAlterar;
   end
   else
       sbtnAltDet.Down := true;
end;

procedure TfrmCadMestreDetalheCS.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  CmeDetalhe.Delete(Self);
  CmeDetalhe.Atualizabotoes(Self);
end;

procedure TfrmCadMestreDetalheCS.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  CmeDetalhe.Confirma(Self);
end;

procedure TfrmCadMestreDetalheCS.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;
   CmeDetalhe.Cancel(Self);
end;

procedure TfrmCadMestreDetalheCS.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
  sbtnAltDet.Click;
end;


procedure TfrmCadMestreDetalheCS.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  FazerVoltarDet;
end;

procedure TfrmCadMestreDetalheCS.FazerVoltarDet;
begin
   if (qryAtual <> nil) and (qryAtual.State in [dsEdit,dsInsert]) then
      qryAtual.Cancel;

   tb97Detalhe.Visible := false;

   if grdAtual <> nil then grdAtual.BringToFront;

   CmeDetalhe.Atualizabotoes(Self);
end;

procedure TfrmCadMestreDetalheCS.tbcDetalheChange(Sender: TObject);
begin
   inherited;
   if tbcDetalhe.detdbGrids.count > 0 then
   begin
        grdAtual := TwwDBGrid(TComponent(sender).Owner.FindComponent(tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex]));
        if grdAtual <> nil then
           qryAtual := TwwQuery(grdAtual.DataSource.DataSet)
        else
            qryAtual := nil;

        if tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex] = '' then
           tb97BotoesDetalhe.Visible := false
        else
            tb97BotoesDetalhe.Visible := true;

        pgctrlDetalhe.ActivePage := TTabSheet(pgctrlDetalhe.Pages[tbcDetalhe.TabIndex]);

        bbtnVoltarDetClick(Self);
   end;
end;

procedure TfrmCadMestreDetalheCS.FormCreate(Sender: TObject);
var i : integer;
begin
   CmeDetalhe.RepetirInsert := true;
   inherited;
   for i := 0 to pgctrlDetalhe.PageCount-1 do begin
       pgctrlDetalhe.Pages[i].TabVisible := false;
   end;
   tbcDetalhe.TabIndex := 0;
   tbcDetalheChange(tbcDetalhe);
end;


procedure TfrmCadMestreDetalheCS.tbcDetalheChanging(Sender: TObject;
  var AllowChange: Boolean);
var
   mResult : TModalResult;
   sEstado,
   sEstadoCaption : string;
begin
  inherited;
          if (qryAtual <> nil) and (qryAtual.state in [dsInsert,dsEdit]) then
          begin
               if qryAtual.state in [dsInsert] then
               begin
                    sEstado := 'inclusão';
                    sEstadoCaption := 'Inclusão';
               end
               else
               begin
                    sEstado := 'alteração';
                    sEstadoCaption := 'Alteração';
               end;

             mResult := MsgDlg('Você está tentando mudar de pasta sem confirmar a '+sEstado+' de '+tbcDetalhe.Tabs[tbcDetalhe.TabIndex]+'.'+#13+#10+'Confirma a '+sEstado+' de '+tbcDetalhe.Tabs[tbcDetalhe.TabIndex]+'?', sEstadoCaption+' não confirmada', mtConfirmation, [mbYes, mbNo, mbCancel],0);
             try
                if mResult = mrYes then
                begin
                     CmeDetalhe.RepetirInsert := false;
                     bbtnOkDet.Click;
                     CmeDetalhe.RepetirInsert := true;
                end
                else if mResult = mrNo then
                     bbtnCancelarDet.Click
                else if mResult = mrCancel then
                     AllowChange := false;
             except end;
          end;
end;

procedure TfrmCadMestreDetalheCS.CmeCadastroConfirma(
  Sender: TObject);
begin
   CmeDetalhe.Confirma(Self);
   FazerVoltarDet;

   inherited;

   CmeDetalhe.Atualizabotoes(Self);
end;

procedure TfrmCadMestreDetalheCS.CmeCadastroCancel(Sender: TObject);
var
   i : integer;
begin
   CmeDetalhe.Cancel(Self);
   i := 0;
   while (i < ComponentCount) do begin
         if (TObject(Components[i]).ClassType = TwwQuery) and
            (TwwQuery(Components[i]).Active) and
            (TwwQuery(Components[i]).CachedUpdates) then
            TwwQuery(Components[i]).CancelUpdates;
         Inc(i);
   end;
   inherited;
end;

procedure TfrmCadMestreDetalheCS.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
  CmeDetalhe.Atualizabotoes(Self);
  pnlMestre.Enabled := pnlFundo.Enabled;
  pnlFundo.Enabled := true;
end;

procedure TfrmCadMestreDetalheCS.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qryAtual.Insert;
end;

procedure TfrmCadMestreDetalheCS.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  qryAtual.Edit;
end;

procedure TfrmCadMestreDetalheCS.CmeDetalheDelete(Sender: TObject);
begin
  inherited;
  qryAtual.Delete;
  bbtnOkDetClick(Self);
end;

procedure TfrmCadMestreDetalheCS.CmeDetalheConfirma(Sender: TObject);
var
  bRepete : boolean;
begin
  if (qryAtual <> nil ) and (qryAtual.State in [dsInsert, dsEdit]) then
  begin
      bRepete := (CmeDetalhe.RepetirInsert) and (qryAtual.State = dsInsert);
      try
         qryAtual.Post;

         If qryAtual.IsEmpty Then
            CmeDetalhe.Operacao := opVazio
         Else
            CmeDetalhe.Operacao := opIdle;

         if bRepete then
            CmeDetalhe.Insert(Self)
         else
             FazerVoltarDet;
      except end;
      CmeDetalhe.Atualizabotoes(Self);
  end;
end;

procedure TfrmCadMestreDetalheCS.CmeDetalheCancel(Sender: TObject);
begin
  inherited;
  if qryAtual <> nil then
  begin
      qryAtual.Cancel;
      grdAtual.BringToFront;

      If qryAtual.IsEmpty Then
         CmeDetalhe.Operacao := opVazio
      Else
         CmeDetalhe.Operacao := opIdle;
  end;

  tb97Detalhe.Visible := false;
  CmeDetalhe.Atualizabotoes(Self);
end;

procedure TfrmCadMestreDetalheCS.CmeDetalheAtualizaBotoes(Sender: TObject);
var
  lTemReg : Boolean;
begin
  inherited;
  If  (qryAtual <> nil) Then
  Begin
     //sbtnInsDet.Enabled := (qryAtual.State = dsBrowse);
     sbtnInsDet.Down := (qryAtual.State = dsInsert);
     //sbtnAltDet.Enabled := (qryAtual.State = dsBrowse);
     sbtnAltDet.Down := (qryAtual.State = dsEdit);
     //sbtnExcluiDet.Enabled := (qryAtual.State = dsBrowse) and (not qryAtual.IsEmpty);
  End;

  if (CmeCadastro.Operacao in [opInserir,opAlterar]) and
     (VerificaMestre) then
  begin
    if (qryAtual <> nil) and (not qryAtual.IsEmpty) then
       lTemReg := true
    else
        lTemReg := false;

    sbtnInsDet.Enabled := (Not sbtnAltDet.Down);
    sbtnAltDet.Enabled := lTemReg And (Not sbtnInsDet.Down);
    sbtnExcluiDet.Enabled := lTemReg And (Not sbtnInsDet.Down) And (Not sbtnAltDet.Down);
  end
  else
  begin
     sbtnInsDet.Enabled := false;
     sbtnAltDet.Enabled := false;
     sbtnExcluiDet.Enabled := false;
  end;

  AutorizarForm(afSoDesabilitar);
end;

end.
