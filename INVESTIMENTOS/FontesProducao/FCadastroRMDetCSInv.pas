//********************************************************************************************************
// Data     : 10/11/2005
// Código   : AL_2
// Motivo   : Fecha todas as queries que estiverem abertas no fechamento do form
//            Ajuste no LayOut do Painel de dados
//            Caption automático = 'Cadastro'
//********************************************************************************************************
// Data     : 04/08/2004
// Código   : AL_1
// Motivo   : Controle do processo de abertura
//********************************************************************************************************
//Data	 	 :      07/05/2004
//Função	 :   *  Implementação de botão de consulta
//*******************************************************************************
unit FCadastroRMDetCSInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, fcLabel, CmEventosCadastro, ImgList, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn,
  TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls;

type
  TfrmCadastroRMDetInv = class(TfrmCadMestreDetalheCS)
    qryDetalhe: TwwQuery;
    updDetalhe: TUpdateSQL;
    Bevel1: TBevel;
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    sbtnConsDet: TToolbarButton97;
    procedure qryAfterOpen(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnConsDetClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroRMDetInv: TfrmCadastroRMDetInv;

implementation

{$R *.DFM}
uses dBaseDados, UMensErro, uDataBase, FPrincipal, URendaFixa;

procedure TfrmCadastroRMDetInv.qryAfterOpen(DataSet: TDataSet);
var I, J: Integer;
begin
  inherited;
  qryDetalhe.Close;
  for I := 0 to qryDetalhe.ParamCount - 1 do begin
      for J := 0 to qry.FieldCount - 1 do begin
          if qryDetalhe.Params[I].Name = qry.Fields[J].FieldName then
             qryDetalhe.Params[I].Value := qry.Fields[J].Value;
      end;
  end;
  qryDetalhe.Open;

end;

procedure TfrmCadastroRMDetInv.bbtnCancelarClick(Sender: TObject);
begin
  qryDetalhe.CancelUpdates;
  inherited;
end;


procedure TfrmCadastroRMDetInv.bbtnConfirmarClick(Sender: TObject);
begin
//  inherited;
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;
   try
      try
         qry.Post;
         qry.ApplyUpdates;
         if qryDetalhe.State in [dsInsert, dsEdit] then
         begin
            qryDetalhe.Cancel;
            bbtnVoltarDet.Click;
         end;
         qryDetalhe.ApplyUpdates;
         
         qry.CommitUpdates;
         qryDetalhe.CommitUpdates;
         if sbtnInserir.Down then
            CmeCadastro.Insert(Self)
         else bbtnCancelar.Click;
         dtmBaseDados.dbBaseDados.Commit;
      except
         dtmBaseDados.dbBaseDados.Rollback;
         bbtnCancelar.Click;
      end;
   finally
      CmeDetalhe.AtualizaBotoes(Self);
      CmeCadastro.AtualizaBotoes(Self);
   end;
end;

procedure TfrmCadastroRMDetInv.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then
     SelectNext(ActiveControl,True,True)

end;

procedure TfrmCadastroRMDetInv.sbtnConsDetClick(Sender: TObject);
begin
   inherited;
   if sbtnConsDet.Down then
   begin
      Dock974.Visible := True;
      tb97Detalhe.Visible := True;
      pnlControlesDet.BringToFront;
      bbtnOkDet.Visible := False;
      bbtnCancelarDet.Visible := False;
      bbtnVoltarDet.Enabled := True;
   end
   else
      bbtnVoltarDet.Click;
end;

procedure TfrmCadastroRMDetInv.bbtnVoltarDetClick(Sender: TObject);
begin
   inherited;
   bbtnOkDet.Visible := True;
   bbtnCancelarDet.Visible := True;
   sbtnConsDet.Down := False;
end;

procedure TfrmCadastroRMDetInv.dsDetStateChange(Sender: TObject);
begin
   inherited;
   // Controla o Status do Novo Botão
   sbtnConsDet.Enabled := ((not (dsDet.State in [dsInsert, dsEdit, dsInactive])) and (not (dsDet.DataSet.IsEmpty)));
end;

procedure TfrmCadastroRMDetInv.sbtnInserirClick(Sender: TObject);
begin
  // AL_1 - Controle do processo de abertura de renda fixa
  // Se for Renda Fixa
  if TipoMenuInvest = 'F' then
  begin
     if RendaFixa.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end;

  inherited;

end;

procedure TfrmCadastroRMDetInv.sbtnAlterarClick(Sender: TObject);
begin
  // AL_1 - Controle do processo de abertura de renda fixa
  // Se for Renda Fixa
  if TipoMenuInvest = 'F' then
  begin
     if RendaFixa.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end;

  inherited;

end;

procedure TfrmCadastroRMDetInv.sbtnApagarClick(Sender: TObject);
begin
  // AL_1 - Controle do processo de abertura de renda fixa
  // Se for Renda Fixa
  if TipoMenuInvest = 'F' then
  begin
     if RendaFixa.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end;

  inherited;

end;

procedure TfrmCadastroRMDetInv.sbtnInsDetClick(Sender: TObject);
begin
  // AL_1 - Controle do processo de abertura de renda fixa
  // Se for Renda Fixa
  if TipoMenuInvest = 'F' then
  begin
     if RendaFixa.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end;

  inherited;

end;

procedure TfrmCadastroRMDetInv.sbtnAltDetClick(Sender: TObject);
begin
  // AL_1 - Controle do processo de abertura de renda fixa
  // Se for Renda Fixa
  if TipoMenuInvest = 'F' then
  begin
     if RendaFixa.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end;

  inherited;

end;

procedure TfrmCadastroRMDetInv.sbtnExcluiDetClick(Sender: TObject);
begin
  // AL_1 - Controle do processo de abertura de renda fixa
  // Se for Renda Fixa
  if TipoMenuInvest = 'F' then
  begin
     if RendaFixa.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end;

  inherited;

end;

procedure TfrmCadastroRMDetInv.FormShow(Sender: TObject);
begin
  // AL_2
  if UpperCase(Copy(TForm(Sender).Caption, 1, 3)) = 'FRM' then
     TForm(Sender).Caption := 'Cadastro';
  inherited;
end;

procedure TfrmCadastroRMDetInv.FormCreate(Sender: TObject);
begin
   // AL_2 - Maximiza a tela caso ela não caiba na área de trabalho do form principal
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
   inherited;
end;

procedure TfrmCadastroRMDetInv.FormClose(Sender: TObject; var Action: TCloseAction);
var i: Word;
begin
   // AL_2 - Fecha todas as queries que ficarem abertas
   for i := 0 to TForm(Sender).ComponentCount -1 do
   begin
      if TForm(Sender).Components[i] is TwwQuery then
      begin
         if TwwQuery(TForm(Sender).Components[i]).State <> dsInactive then
            TwwQuery(TForm(Sender).Components[i]).Close;
      end;
      if TForm(Sender).Components[i] is TQuery then
      begin
         if TQuery(TForm(Sender).Components[i]).State <> dsInactive then
            TQuery(TForm(Sender).Components[i]).Close;
      end;
   end;
   inherited;
end;

end.
