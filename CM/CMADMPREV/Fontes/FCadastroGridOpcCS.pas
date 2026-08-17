unit FCadastroGridOpcCS;

//------------------------------------------------------------------------------
// junção do FCadastroCS + FCadastroGridCS porém com opção para não salvar os
// dados no Confirma deixando essa função para funcionalidade que chamou o Form
//------------------------------------------------------------------------------
// Autor(a)   : Edilaine Ferraresi
// Data       : 30/01/2017
// SIG        : 36752
// Descricao  : Equacionamento - cadastro de ação judicial para contribuicao
//------------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, DB, Buttons, StdCtrls, ExtCtrls, FTelaAut, MAHlpBtn, wwidlg,
  Wwdatsrc, DBTables, Wwtable, cmseldlg, FProcurar, wwQuery, ToolWin,
  ComCtrls, FOkCancelar, TB97, MontaSelect, TB97Tlbr, TB97Ctls, IvDictio,
  IvMulti, IvEMulti, fCadastroPai, ImgList, ActnList, CmEventosCadastro,
  Gauges, fcLabel, Grids, Wwdbigrd, Wwdbgrid;

type
  TFrmCadastroGridOpcCS = class(TfrmCadastroPai)
    ImageList1: TImageList;
    qry: TwwQuery;
    upd: TUpdateSQL;
    MontaSelect: TMontaSelect;
    dbGrd: TwwDBGrid;
    pnlControles: TPanel;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bGravaDados  : boolean;
    bExibeMsgExc : boolean;
    function TemAlteracaoPendente:Boolean;
  end;

var
  FrmCadastroGridOpcCS: TFrmCadastroGridOpcCS;

implementation

uses UMensErro, FSairAjuda, uDatabase, DBaseDados, uAutorizacao{$IFNDEF VER0505}, uCMTypes {$ENDIF};

{$R *.DFM}

procedure TFrmCadastroGridOpcCS.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   if not (CmeCadastro.Operacao in [opIdle, opVazio]) then
      CmeCadastro.Cancel(self);

   CmeCadastro.Operacao := opInserir;
   CmeCadastro.RepetirInsert := True;
   CmeCadastro.AtualizaBotoes(Self);
   CmeCadastro.Insert(Self);
   CmeCadastro.AtualizaBotoes(Self);
end;

procedure TFrmCadastroGridOpcCS.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   if not (CmeCadastro.Operacao in [opIdle, opVazio]) then
      CmeCadastro.Cancel(self);

   CmeCadastro.Operacao := opAlterar;
   CmeCadastro.RepetirInsert := False;
   CmeCadastro.AtualizaBotoes(Self);
   CmeCadastro.Edit(Self);
   CmeCadastro.AtualizaBotoes(Self);
end;

procedure TFrmCadastroGridOpcCS.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   CmeCadastro.Operacao := opProcurar;
   MontaSelect.Executar;

   CmeCadastro.Find(Self);

   if qry.IsEmpty then
      CmeCadastro.Operacao := opVazio
   else
      CmeCadastro.Operacao := opIdle;

   CmeCadastro.AtualizaBotoes(Self);
end;

procedure TFrmCadastroGridOpcCS.sbtnApagarClick(Sender: TObject);
begin
  inherited;
   if CmeCadastro.Operacao = opIdle then
   begin
        Try
          CmeCadastro.Operacao := opApagar;

          if not bExibeMsgExc then
              CmeCadastro.Delete(Self)
          else
          if (MsgDlg('Deseja realmente excluir este registro?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
              CmeCadastro.Delete(Self);

          if qry.IsEmpty then
             CmeCadastro.Operacao := opVazio
          else
              CmeCadastro.Operacao := opIdle;

          CmeCadastro.AtualizaBotoes(Self);
        Except
          CmeCadastro.Operacao := opIdle;
          sbtnApagar.Down := False;
          Qry.DisableControls;
          Qry.Close;
          Qry.Open;
          Qry.EnableControls;
          Raise;
        End;
   end;
end;


procedure TFrmCadastroGridOpcCS.bbtnConfirmarClick(Sender: TObject);
var
  bInsert : boolean;
begin
  inherited;
  bInsert := CmeCadastro.RepetirInsert and (CmeCadastro.Operacao = opInserir);

  CmeCadastro.Confirma(Self);

  If CmeCadastro.ConfirmaCadastro Then
  Begin
      if qry.IsEmpty then
         CmeCadastro.Operacao := opVazio
      else
          CmeCadastro.Operacao := opIdle;

      if bInsert then
         sbtnInserir.Click
      else
         CmeCadastro.AtualizaBotoes(Self);
  End;

end;

procedure TFrmCadastroGridOpcCS.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   CmeCadastro.RepetirInsert := False;
   if qry.Active then
      CmeCadastro.Cancel(self);
   if qry.IsEmpty then
      CmeCadastro.Operacao := opVazio
   else
       CmeCadastro.Operacao := opIdle;

   CmeCadastro.AtualizaBotoes(Self);
end;

procedure TFrmCadastroGridOpcCS.FormCreate(Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled := false;
   CmeCadastro.RepetirInsert   := False;

   if qry.IsEmpty then
      CmeCadastro.Operacao := opVazio
   else
      CmeCadastro.Operacao := opIdle;
end;

procedure TFrmCadastroGridOpcCS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if ds.State in ([dsInsert, dsEdit]) then
     begin
     if TemAlteracaoPendente then
        if MsgDlg( 'Alguns dados informados ainda não foram gravados.'+#13+#10+'Deseja realmente sair da tela?',
                   'Alterações pendentes', mtWarning, [mbYes, mbNo],0) = mrNo then
           CanClose := false;
     end;
   if CanClose then bbtnCancelar.Click;
   inherited;
end;

procedure TFrmCadastroGridOpcCS.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  qry.CancelUpdates;
end;

procedure TFrmCadastroGridOpcCS.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  if bGravaDados then
     AplicaAlteracoes([TDBDataSet(ds.DataSet)])
  else
     TDBDataSet(ds.DataSet).ApplyUpdates;
end;

procedure TFrmCadastroGridOpcCS.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qry.Insert;
end;

procedure TFrmCadastroGridOpcCS.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  qry.Edit;
end;

procedure TFrmCadastroGridOpcCS.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  qry.Delete;
  CmeCadastro.Confirma(Self);
end;

procedure TFrmCadastroGridOpcCS.CmeCadastroAtualizaBotoes(Sender: TObject);
var
   ConfirmaVisible : Boolean;
   List : TList;
begin
   inherited;
   { Configura o estado dos botões }

   sbtnInserir.Enabled := false;
   sbtnAlterar.Enabled := false;
   sbtnApagar.Enabled := false;
   sbtnProcurar.Enabled := false;
   case CmeCadastro.Operacao of
   opVazio :
          begin
               sbtnInserir.Down := false;
               sbtnAlterar.Down := false;
               sbtnApagar.Down  := false;
               sbtnProcurar.Down := false;
               sbtnInserir.Enabled := true;
               sbtnAlterar.Enabled := false;
               sbtnApagar.Enabled := false;
               sbtnProcurar.Enabled := true;

               ConfirmaVisible := false;
          end;
   opIdle :
          begin
               sbtnInserir.Down := false;
               sbtnAlterar.Down := false;
               sbtnApagar.Down  := false;
               sbtnProcurar.Down := false;
               sbtnInserir.Enabled := true;
               sbtnProcurar.Enabled := true;

               if (qry.Active) and (not qry.IsEmpty) then
               begin
                  sbtnAlterar.Enabled := true;
                  sbtnApagar.Enabled := true;
               end
               else begin
                    sbtnAlterar.Enabled := false;
                    sbtnApagar.Enabled := false;
               end;
               ConfirmaVisible := false;
          end;
   opInserir :
             begin
                  sbtnInserir.Down := true;
                  sbtnInserir.Enabled := true;
                  ConfirmaVisible := true;
             end;
   opAlterar :
          begin
               sbtnAlterar.Down := true;
               sbtnAlterar.Enabled := true;
               ConfirmaVisible := true;
          end;
   opProcurar :
               begin
                    sbtnProcurar.Down := true;
                    sbtnProcurar.Enabled := true;
                    ConfirmaVisible := false;
               end;
   opApagar :
            begin
                 sbtnApagar.Down  := false;
                 sbtnApagar.Enabled := true;
                 ConfirmaVisible := false;
            end;
   else
       ConfirmaVisible := false;
   end;

   bbtnConfirmar.Enabled := ConfirmaVisible;
   bbtnCancelar.Enabled := ConfirmaVisible;

   if pnlfundo.Visible then
      pnlfundo.enabled := ConfirmaVisible;

   AutorizarForm(afSoDesabilitar);

   List := TList.Create;
   case CmeCadastro.Operacao of
        opVazio, opIdle, opProcurar, opApagar : begin
                                            dbGrd.Visible := true;
                                            //dbgrd.SetFocus;
                                       end;
        opInserir, opAlterar : begin
                                    dbGrd.Visible := false;
                                    (pnlControles).GetTabOrderList(List);
                                    try
                                       TWinControl(List[0]).SetFocus ;
                                    except end;
                               end;
   end;
   List.free;
   pnlFundo.Enabled := true;
   
end;

procedure TFrmCadastroGridOpcCS.FormShow(Sender: TObject);
begin
  inherited;
  CmeCadastro.AtualizaBotoes(Self);
end;

function TFrmCadastroGridOpcCS.TemAlteracaoPendente: Boolean;
var
   i:integer;
begin
   Result := false;
   i := 0;
   while (i < ComponentCount) and (not Result) do begin
         if (TObject(Components[i]).ClassNameIs('TwwQuery')) and
            (TwwQuery(Components[i]).Active) and
            (TwwQuery(Components[i]).CachedUpdates) and
            (TwwQuery(Components[i]).UpdatesPending) then
            Result := true;
         Inc(i);
   end;
end;

end.
