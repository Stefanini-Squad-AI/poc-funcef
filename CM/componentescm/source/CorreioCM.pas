{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit CorreioCM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  comctrls, stdctrls, extctrls, fListaMensagem, fMensagem, uCMTypes,
  Grids;

type
  TMensagem = class(TComponent)
  private
    { Private declarations }
    FStatus : TStatusMensagem;
    FIdDestinatario,
    FIdRemetente,
    FIdMensagem,
    FIdRecado : cardinal;
    FNomeDestinatario,
    FNomeRemetente,
    FMensagem,
    FAssunto,
    FRecado : string;
    FLida : boolean;
    FDataEnvio,
    FDataPrograma : TDateTime;
    FTipoDestinatario : TTipoDestinatario;
    procedure SetIdDestinatario( id : cardinal);

  protected
    { Protected declarations }

  public
    { Public declarations }
    Constructor Create(AOwner : TComponent); override;
    Destructor Destroy; Override;

    procedure Nova;
    procedure MarcaLida;
    procedure MarcaNaoLida;
    procedure Exclui;
    function Envia : boolean;

    property Id : Cardinal read FIdMensagem write FIdMensagem;
    property IdDestinatario : Cardinal read FIdDestinatario write SetIdDestinatario;
    property NomeDestinatario : string read FNomeDestinatario ;
    property IdRemetente : Cardinal read FIdRemetente write FIdRemetente;
    property IdRecado : Cardinal read FIdRecado write FIdRecado;
    property Recado : string read FRecado write FRecado;
    property NomeRemetente : string read FNomeRemetente write FNomeRemetente;
    property Status : TStatusMensagem read FStatus write FStatus;
    property Mensagem : string read FMensagem write FMensagem;
    property Assunto : string read FAssunto write FAssunto;
    property Lida : boolean read FLida write FLida;
    property DataEnvio : TDateTime read FDataEnvio write FDataEnvio;
    property DataProgramada : TDateTime read FDataPrograma write FDataPrograma;
    property TipoDestinatario : TTipoDestinatario read FTipoDestinatario write FTipoDestinatario;
  published
    { Published declarations }
  end;

  TCorreioCM = class(TComponent)
  private
    { Private declarations }
    FMensagens : TList;
    FTipoDestinatario : TTipoDestinatario;
    frmLista : TfrmListaMensagem;
    fIdDestinatario : cardinal;
    frmEnvia : TfrmMensagem;
    FMensagem : TMensagem;
    fAssunto :String;
    fTextoMensagem :String;

    procedure frmListaDrawCell(Sender: TObject; Col, Row: Integer; Rect: TRect; State: TGridDrawState);
    procedure frmListabtnExcluirClick(Sender: TObject);
    procedure frmListabtnExcluirEnviadosClick(Sender: TObject);
    procedure frmListabtnEncaminharClick(Sender: TObject);
    procedure frmListabtnResponderClick(Sender: TObject);
    procedure frmListabtnAtualizar(Sender: TObject);
    procedure AtuGrid;
    procedure AtuMensagem(row:Integer);
    procedure frmEnviasbtnEnviarClick(Sender: TObject);
    procedure frmEnviasbtnNovaClick(Sender: TObject);
    procedure frmListabtnImprimirClick(Sender: TObject);
    procedure frmListabtnLidaClick(Sender: TObject);
    procedure frmListabtnNaoLidaClick(Sender: TObject);
    procedure frmListaGridMensagemSelectCell(Sender: TObject; Col, Row: Integer; var CanSelect: Boolean);  protected
    procedure frmEnviaClose(Sender: TObject; var Action: TCloseAction);
    { Protected declarations }

  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;

    function TemMensagemNova : boolean;
    function PegaMensagens : boolean;
    procedure ListaMensagens;
    procedure EnviaMensagens;
    procedure NovaMensagem(IdDest:LongInt; Assunto, Mensagem : string);
    property ListadeMensagens : TList read FMensagens;
    property IdDestinatario : cardinal read FIdDestinatario write FIdDestinatario;
    property TextoMensagem :String read fTextoMensagem write fTextoMensagem;
    property Assunto :String read fassunto write fassunto;
  published
    { Published declarations }
    property TipoDestinatario : TTipoDestinatario read FTipoDestinatario write FTipoDestinatario;
  end;

function strTipoMensagem(Tipo : TTipoDestinatario) : shortstring;

implementation

uses fEnviaMensagem, fEnviaMensHospede, registry, uCtrlPadroes, DBaseDados, uMensErro,
     uSistema, uCtrlMensagemCM;

procedure TMensagem.SetIdDestinatario(Id : Cardinal);
begin
     inherited;
     if Id <> FIdDestinatario then
     begin
          FIdDestinatario := Id;
          if Id = 0 then
             FNomeDestinatario := ''
          else
              FNomeDestinatario := 'x';
     end;
end;

procedure TMensagem.Nova;
begin
     inherited;
     Status := smNova;
     SetIdDestinatario(0);
end;

function TMensagem.Envia : boolean;
begin
     inherited;
     if FStatus = smNova then
     begin
        MensagemCM.CdsMensagem.Data := Padroes.GetDataPacket(' SELECT ' +
                                           '    IDMENSAGEM, IDREMETENTE, IDDESTINATARIO, ASSUNTO, MENSAGEM, LIDA, ' +
                                           '    DATAENVIO, DATAPROGRAMA, TIPODESTINATARIO, IDMSGPRE ' +
                                           ' FROM MENSAGEMCM WHERE 1=2 ');
        if FDataPrograma = 0 then FDataPrograma := now;

        MensagemCM.CdsMensagem.Append;
        MensagemCM.CdsMensagem.FieldByName('IDREMETENTE').AsFloat := FIdRemetente;
        MensagemCM.CdsMensagem.FieldByName('IDDESTINATARIO').AsFloat := FIdDestinatario;
        MensagemCM.CdsMensagem.FieldByName('ASSUNTO').AsString := FAssunto;
        MensagemCM.CdsMensagem.FieldByName('MENSAGEM').AsString := Copy(FMensagem,1,4000);
        MensagemCM.CdsMensagem.FieldByName('LIDA').AsInteger := 0;
        MensagemCM.CdsMensagem.FieldByName('DATAENVIO').AsDateTime := now;
        MensagemCM.CdsMensagem.FieldByName('DATAPROGRAMA').AsDateTime := FDataPrograma;

        If FTipoDestinatario = tdHospede Then
           MensagemCM.CdsMensagem.FieldByName('TIPODESTINATARIO').AsString := 'HO'
        Else
           MensagemCM.CdsMensagem.FieldByName('TIPODESTINATARIO').AsString := 'US';

        if FIdRecado = 0 then
           MensagemCM.CdsMensagem.FieldByName('IDMSGPRE').Clear
        Else
           MensagemCM.CdsMensagem.FieldByName('IDMSGPRE').AsFloat := FIdRecado;

        MensagemCM.CdsMensagem.Post;

        Result := MensagemCM.ProcessaMensagem(omEnviar,0);

        If Not Result Then
           Raise Exception.Create(MensagemCM.MessageInfo);
     end
     else
         Result := false;
end;

procedure TMensagem.MarcaLida;
begin
   inherited;
   FLida := MensagemCM.ProcessaMensagem(omMarcaLida, FIdMensagem);
   If Not FLida Then
      Raise Exception.Create(MensagemCM.MessageInfo);
end;

procedure TMensagem.MarcaNaoLida;
begin
   inherited;
   If MensagemCM.ProcessaMensagem(omMarcaNaoLida, FIdMensagem) Then
      FLida := false
   Else
      Raise Exception.Create(MensagemCM.MessageInfo);
end;

procedure TMensagem.Exclui;
begin
   inherited;
   If Not MensagemCM.ProcessaMensagem(omExcluir, FIdMensagem) Then
      Raise Exception.Create(MensagemCM.MessageInfo);
end;

constructor TCorreioCM.Create(AOwner : TComponent);
begin
     inherited;
     FMensagens := TList.Create;
     FMensagem := TMensagem.Create(Self);
     FTipoDestinatario := tdUsuario;
end;

destructor TCorreioCM.Destroy;
var i : integer;
begin
     for i := 0 to FMensagens.Count-1 do
         TMensagem(FMensagens.Items[i]).free;
     FMensagens.free;
     FMensagem.Free;
     inherited;
end;

procedure TCorreioCM.ListaMensagens;
begin
     FIdDestinatario:= IdDestinatario;
     Application.CreateForm(TfrmListaMensagem, frmLista);

     frmLista.GridMensagem.OnDrawCell := frmListaDrawCell;
     frmLista.GridMensagem.OnSelectCell := frmListaGridMensagemSelectCell;



     frmLista.ActResponder.Visible := (FTipoDestinatario = tdUsuario);
     frmLista.sepResponder.Visible := (FTipoDestinatario = tdUsuario);     
     
     frmLista.ActExcluir.OnExecute := frmListabtnExcluirClick;
     frmLista.ActResponder.OnExecute := frmListabtnResponderClick;
     frmLista.ActImprimir.OnExecute := frmListabtnImprimirClick;
     frmLista.ActLida.OnExecute := frmListabtnLidaClick;
     frmLista.ActNaoLida.OnExecute := frmListabtnNaoLidaClick;
     frmLista.ActExcluirEnviados.OnExecute := frmListabtnExcluirEnviadosClick;
     frmLista.ActEncaminhar.OnExecute := frmListabtnEncaminharClick;
     frmLista.ActAtualizarEntrada.OnExecute := frmListabtnAtualizar;

     frmLista.Show;

     frmListabtnAtualizar(self);
end;

procedure TCorreioCM.EnviaMensagens;
begin
     case FTipoDestinatario of
          tdUsuario :
          Begin
            Application.CreateForm(TfrmEnviaMensagem, frmEnvia);
            If fAssunto <> '' Then
            Begin
               TfrmEnviaMensagem(frmEnvia).edAssunto.Text := fAssunto;
               fAssunto := '';
            End;

            If fTextoMensagem <> '' Then
            Begin
               TfrmEnviaMensagem(frmEnvia).MemoMensagem.Lines.Text := fTextoMensagem;
               fTextoMensagem := '';
            End;
          End;
          tdHospede :
          Begin
            Application.CreateForm(TfrmEnviaMensHospede, frmEnvia);

            If fTextoMensagem <> '' Then
            Begin
               TfrmEnviaMensHospede(frmEnvia).MemoMensagem.Lines.Text := fTextoMensagem;
               fTextoMensagem := '';
            End;
          End
     end;

     frmEnvia.sbtnEnviar.OnClick := frmEnviasbtnEnviarClick;
     frmEnvia.sbtnNova.OnClick := frmEnviasbtnNovaClick;
     frmEnvia.OnClose := frmEnviaClose;
     frmEnvia.sbtnNova.Click;
end;

function TCorreioCM.TemMensagemNova : boolean;
begin
    DtmBaseDados.Cds.Data := Padroes.GetDataPacket('SELECT COUNT(IDMENSAGEM) FROM MENSAGEMCM WHERE (IDDESTINATARIO = '+ IntToStr(IdDestinatario) +') AND (LIDA = 0) AND (DATAPROGRAMA <= TO_DATE('''+FormatDateTime('dd/mm/yyyy hh:nn:ss', now)+''', ''dd/mm/yyyy HH24:MI:SS'')) AND (TIPODESTINATARIO = '''+ strTipoMensagem(TipoDestinatario) +''')');
    Result := (DtmBaseDados.Cds.fields[0].AsInteger > 0);
    DtmBaseDados.Cds.Close;
end;

function TCorreioCM.PegaMensagens : boolean;
var
   Item : integer;
begin
     Result := false;
     for Item := 0 to FMensagens.Count-1 do
         TMensagem(FMensagens.Items[Item]).free;
     FMensagens.Clear;
     DtmBaseDados.Cds.Data := Padroes.GetDataPacket('SELECT M.IDMENSAGEM, M.IDREMETENTE, M.ASSUNTO, M.MENSAGEM, M.LIDA, M.DATAENVIO, M.DATAPROGRAMA, R.MENSAGEM AS RECADO, U.NOMEUSUARIO AS NOMEREMETENTE FROM MENSAGEMCM M, USUARIOSISTEMA U, MSGPRECM R WHERE (M.IDDESTINATARIO = '+ IntToStr(FIdDestinatario) +') AND (M.TIPODESTINATARIO = '''+ strTipoMensagem(FTipoDestinatario) +''') AND (M.IDREMETENTE=U.IDUSUARIO(+)) AND (DATAPROGRAMA <= TO_DATE('''+FormatDateTime('dd/mm/yyyy hh:nn:ss', now)+''', ''dd/mm/yyyy HH24:MI:SS'')) AND (M.IDMSGPRE = R.IDMSGPRE(+)) ORDER BY M.DATAENVIO DESC');
     if Not DtmBaseDados.Cds.IsEmpty then
     begin
          Result := true;
          with DtmBaseDados.Cds do
          begin
               First;
               while not eof do
               begin
                    Item := FMensagens.Add(TMensagem.Create(Self));
                    TMensagem(FMensagens.Items[Item]).Id             := FieldByName('IDMENSAGEM').AsInteger;
                    TMensagem(FMensagens.Items[Item]).Assunto        := FieldByName('ASSUNTO').AsString;
                    TMensagem(FMensagens.Items[Item]).Mensagem       := FieldByName('MENSAGEM').AsString;
                    TMensagem(FMensagens.Items[Item]).Lida           := (FieldByName('LIDA').AsInteger > 0);
                    TMensagem(FMensagens.Items[Item]).IdRemetente    := FieldByName('IDREMETENTE').AsInteger;
                    TMensagem(FMensagens.Items[Item]).NomeRemetente  := FieldByName('NOMEREMETENTE').AsString;
                    TMensagem(FMensagens.Items[Item]).DataEnvio      := FieldByName('DATAENVIO').AsDateTime;
                    TMensagem(FMensagens.Items[Item]).DataProgramada := FieldByName('DATAPROGRAMA').AsDateTime;
                    TMensagem(FMensagens.Items[Item]).Recado         := FieldByName('RECADO').AsString;
                    Next;
               end;
          end;
     end;
end;

procedure TCorreioCM.frmListaDrawCell(Sender: TObject; Col,
  Row: Integer; Rect: TRect; State: TGridDrawState);
begin
     inherited;
     with frmLista.GridMensagem.Canvas do
     begin
          if (gdSelected in State) then
          begin
              Brush.Color := clHighlight;
              Font.Color  := clHighlightText;
              Font.Style  := [fsBold];
          end
          else
          if (not TMensagem(ListadeMensagens[Row]).Lida) then
          begin
               Brush.Color := clInfoBk;
               Font.Color  := clInfoText;
               Font.Style  := [fsBold];
          end
          else
          begin
               Brush.Color := clWindow;
               Font.Color  := clWindowText;
               Font.Style  := [];
          end;
          FillRect(Rect);
          FrameRect(Rect);
          TextOut(Rect.Left+5, Rect.Top+2, frmLista.GridMensagem.Cells[Col,Row]);
     end;
end;

procedure TCorreioCM.frmListabtnExcluirClick(Sender: TObject);
var
   iRow : Integer;
begin
  inherited;
  if frmLista.GridMensagem.RowCount > 0 then
  begin
       iRow := frmLista.GridMensagem.row;

       if MsgDlg('Deseja excluir a mensagem '+TMensagem(ListadeMensagens[iRow]).Assunto+'?', 'Exclusão de mensagem', mtConfirmation, [mbYes, mbNo],0) = mrYes then
       begin
            TMensagem(ListadeMensagens[iRow]).Exclui;
            AtuGrid;
            if ListadeMensagens.count = 0 then
               frmLista.GridMensagem.row := 0
            else
            begin
                 if iRow = frmLista.GridMensagem.RowCount then
                    iRow := frmLista.GridMensagem.RowCount-1;
                 frmLista.GridMensagem.row := iRow;
            end;
            AtuMensagem(iRow);
       end;
  end;
end;

procedure TCorreioCM.frmListabtnResponderClick(Sender: TObject);
begin
  inherited;
  if frmLista.GridMensagem.RowCount > 0 then
  begin
       EnviaMensagens;
       case FTipoDestinatario of
            tdUsuario :
            with frmEnvia as tfrmEnviaMensagem do
            begin
                 NovaMensagem( TMensagem(ListadeMensagens[frmLista.GridMensagem.row]).IdRemetente,
                               'Re: '+TMensagem(ListadeMensagens[frmLista.GridMensagem.row]).Assunto,
                               TMensagem(ListadeMensagens[frmLista.GridMensagem.row]).Mensagem);
                 MemoMensagem.Lines.Insert(0,'');
                 MemoMensagem.Lines.Insert(1,'');
                 MemoMensagem.Lines.Insert(2,'');
                 MemoMensagem.Lines.Insert(3,'Mensagem Original:');
                 MemoMensagem.Lines.Insert(4,'>>');
                 MemoMensagem.SelStart := 0;
                 MemoMensagem.SelLength := 1;
                 MemoMensagem.SetFocus;
            end;
        end;
  end;
end;

procedure TCorreioCM.AtuGrid;
var
   i : integer;
begin
  PegaMensagens;
  with frmLista, GridMensagem do
  begin
       SQLMensagensEnviadas.Prepare;
       SQLMensagensEnviadas.ParamByName('IDREMETENTE').AsInteger := FIdDestinatario;
       SQLMensagensEnviadas.Open;


       frmLista.ActResponder.Enabled := ListadeMensagens.Count > 0;
       frmLista.ActExcluir.Enabled := ListadeMensagens.Count > 0;


       if ListadeMensagens.Count = 0 then
       begin
            frmLista.GridMensagem.Rows[0].Clear;
            RowCount := 0;
       end
       else
           for i := 0 to ListadeMensagens.Count-1 do
           begin
                RowCount := i+1;
                Rows[i].Strings[0] := TMensagem(ListadeMensagens[i]).Assunto;
                Rows[i].Strings[1] := TMensagem(ListadeMensagens[i]).NomeRemetente;
                Rows[i].Strings[2] := FormatDateTime('dd/mm/yyyy',TMensagem(ListadeMensagens[i]).DataEnvio);
           end;
  end;
end;

procedure TCorreioCM.AtuMensagem(row:Integer);
begin
     if row < (ListadeMensagens.count) then
     begin
          frmLista.MemoMensagem.Text  := TMensagem(ListadeMensagens[Row]).Mensagem;
          if TMensagem(ListadeMensagens[Row]).Recado <> '' then
          begin
               frmLista.MemoMensagem.Lines.Insert(0,'');
               frmLista.MemoMensagem.Lines.Insert(0, TMensagem(ListadeMensagens[Row]).Recado);
          end;


          frmLista.ActLida.Enabled    := not TMensagem(ListadeMensagens[Row]).Lida;
          frmLista.ActNaoLida.Enabled := TMensagem(ListadeMensagens[Row]).Lida;
     end
     else
     begin
          frmLista.MemoMensagem.clear;
          
          frmLista.ActLida.Enabled    := false;
          frmLista.ActNaoLida.Enabled := false;
     end;
end;

procedure TCorreioCM.frmEnviasbtnNovaClick(Sender: TObject);
begin
  inherited;
  if frmEnvia.sbtnNova.Down then
  begin
       FMensagem.Nova;
       FMensagem.IdRemetente := Sistema.IdUsuario;
       FMensagem.NomeRemetente := Sistema.NomeUsuario;
       FMensagem.TipoDestinatario := FTipoDestinatario;
       frmEnvia.sbtnEnviar.Enabled := true;
       frmEnvia.pnlFundo.Enabled := true;
       case FTipoDestinatario of
            tdUsuario :
                 TfrmEnviaMensagem(frmEnvia).cmbDestinatario.SetFocus;
       end;
  end
  else
      frmEnvia.sbtnNova.Down := true;
end;

procedure TCorreioCM.frmEnviasbtnEnviarClick(Sender: TObject);
Var
  X: Integer;
begin
  inherited;

  with FMensagem do
  begin
       Mensagem := frmEnvia.MemoMensagem.Text;
       case FTipoDestinatario of
            tdUsuario :
            begin
                 Assunto := TfrmEnviaMensagem(frmEnvia).edAssunto.Text;
                 if TfrmEnviaMensagem(frmEnvia).chkProgramada.Checked then
                    DataProgramada := TfrmEnviaMensagem(frmEnvia).dtProgramada.Date
                 else
                     DataProgramada := 0;

                 if TfrmEnviaMensagem(frmEnvia).cmbGrupo.Text <> '' then
                 begin
                      frmEnvia.Cds.Data := Padroes.GetDataPacket('SELECT IDUSUARIO FROM GRUPOUSU WHERE IDGRUPO = '+TfrmEnviaMensagem(frmEnvia).CdsGrupo.FieldByName('IDGRUPO').AsString);
                      frmEnvia.Cds.First;
                      while not frmEnvia.Cds.eof do
                      begin
                           IdDestinatario := frmEnvia.Cds.FieldByName('IdUsuario').AsInteger;
                           Envia;
                           frmEnvia.Cds.next;
                      end;
                 end
                 else
                 begin
                      IdDestinatario := frmEnvia.CdsDestinatario.fieldByName('IdUsuario').AsInteger;
                      Envia;
                 end;

                 if TfrmEnviaMensagem(frmEnvia).LvMensagens.Items.Count > 0 then
                 begin
                    For x:=0 to pred(TfrmEnviaMensagem(frmEnvia).LvMensagens.Items.Count) do
                    begin
                        if TfrmEnviaMensagem(frmEnvia).LvMensagens.Items[x].ImageIndex = 1 then
                        begin
                             frmEnvia.Cds.Data := Padroes.GetDataPacket('SELECT IDUSUARIO FROM GRUPOUSU WHERE IDGRUPO = ' + TfrmEnviaMensagem(frmEnvia).LvMensagens.Items[x].SubItems[0]);
                             frmEnvia.Cds.First;
                             while not frmEnvia.Cds.eof do
                             begin
                                  IdDestinatario := frmEnvia.Cds.FieldByName('IdUsuario').AsInteger;
                                  Envia;
                                  frmEnvia.Cds.next;
                             end;
                        end
                        else
                        begin
                             IdDestinatario := StrToInt(TfrmEnviaMensagem(frmEnvia).LvMensagens.Items[x].SubItems[0]);
                             Envia;
                        end;

                    end;
                 end;
            end;

            tdHospede :
            begin
                 Assunto := TfrmEnviaMensHospede(frmEnvia).CdsAssunto.FieldByName('NOME').AsString;
                 IdRecado := TfrmEnviaMensHospede(frmEnvia).CdsAssunto.FieldByName('IDMSGPRE').AsInteger;
                 IdDestinatario := TfrmEnviaMensHospede(frmEnvia).CdsDestinatario.fieldByName('IdHospede').AsInteger;
                 Envia;
                 frmEnvia.close;
            end;
       end;
  end;

  frmEnvia.sbtnEnviar.Enabled := false;
  frmEnvia.sbtnNova.Down := false;
  frmEnvia.pnlFundo.Enabled := false;
  if FTipoDestinatario = tdHospede then  frmEnvia.close;
end;

procedure TCorreioCM.frmListabtnImprimirClick(Sender: TObject);
begin
  inherited;
  if frmLista.GridMensagem.RowCount > 0 then
     frmLista.MemoMensagem.Print(TMensagem(ListadeMensagens[frmLista.GridMensagem.Row]).Assunto);
end;

procedure TCorreioCM.frmListabtnLidaClick(Sender: TObject);
begin
  inherited;
  if frmLista.GridMensagem.RowCount > 0 then
  begin
    TMensagem(ListadeMensagens[frmLista.GridMensagem.row]).MarcaLida;
    frmLista.GridMensagem.Invalidate;
  end;
end;

procedure TCorreioCM.frmListabtnNaoLidaClick(Sender: TObject);
begin
  inherited;
  if frmLista.GridMensagem.RowCount > 0 then
  begin
    TMensagem(ListadeMensagens[frmLista.GridMensagem.row]).MarcaNaoLida;
    frmLista.GridMensagem.Invalidate;
  end;
end;

procedure TCorreioCM.frmListaGridMensagemSelectCell(Sender: TObject; Col,
  Row: Integer; var CanSelect: Boolean);
begin
  inherited;
  AtuMensagem(Row);
end;

procedure TCorreioCM.frmEnviaClose(Sender: TObject;
  var Action: TCloseAction);
begin
     frmEnvia.release;
end;

procedure TCorreioCM.NovaMensagem(IdDest:LongInt; Assunto, Mensagem : string);
begin
     case FTipoDestinatario of
          tdHospede :
          with frmEnvia as TfrmEnviaMensHospede do
          begin
               CdsDestinatario.Locate('IDHOSPEDE', IdDest, []);
               eddestinatario.Text := TRIM(CdsDestinatario.FieldByName('SOBRENOME').AsString)+', '+
                                    TRIM(CdsDestinatario.FieldByName('NOME').AsString);
               MemoMensagem.clear;
               MemoMensagem.SetFocus;
          end;

          tdUsuario :
          with frmEnvia as TfrmEnviaMensagem do
          begin
               CdsDestinatario.Locate('IDUSUARIO', IdDest, []);
               edAssunto.Text := Assunto;
               cmbDestinatario.Text := CdsDestinatario.fieldByName('NOMEUSUARIO').AsString;
               MemoMensagem.Text := Mensagem;
               MemoMensagem.SetFocus;
          end;
     end;
end;

function strTipoMensagem(Tipo : TTipoDestinatario) : shortstring;
begin
     case Tipo of
          tdHospede : Result := 'HO';
          tdUsuario : Result := 'US';
     else
         Result := '';
     end;
end;

constructor TMensagem.Create(AOwner : TComponent); 
begin
  inherited;

end;

destructor TMensagem.Destroy;
begin
  inherited;
  
end;

procedure TCorreioCM.frmListabtnExcluirEnviadosClick(Sender: TObject);
begin
  inherited;
  if ( not frmLista.CdsMensagensEnviadas.IsEmpty ) And
     ( MsgDlg('Deseja excluir a mensagem enviada '+ frmLista.CdsMensagensEnviadas.FieldByName('ASSUNTO').AsString +'?', 'Exclusão de mensagem enviada', mtConfirmation, [mbYes, mbNo],0) = Id_Yes ) then
  begin
      If MensagemCM.ProcessaMensagem(omExcluir, frmLista.CdsMensagensEnviadas.FieldByName('IDMENSAGEM').AsInteger, True) Then
         frmLista.CdsMensagensEnviadas.Delete
      Else
         MsgDlg('Ocorreu um erro ao tenta excluir a mensagem enviada '+ frmLista.CdsMensagensEnviadas.FieldByName('ASSUNTO').AsString + (#13+#10) +
                MensagemCM.MessageInfo, 'Exclusão de mensagem enviada', mtError, [mbOk],0);
  end;
end;

procedure TCorreioCM.frmListabtnEncaminharClick(Sender: TObject);
begin
  if ( not frmLista.CdsMensagensEnviadas.IsEmpty ) then
  begin
       EnviaMensagens;
       case FTipoDestinatario of
            tdUsuario :
            with frmEnvia as tfrmEnviaMensagem do
            begin
                 NovaMensagem( -1,
                               'Enc: '+ frmLista.CdsMensagensEnviadas.FieldByName('ASSUNTO').AsString,
                               frmLista.CdsMensagensEnviadas.FieldByName('MENSAGEM').AsString);

                 MemoMensagem.Lines.Insert(2,'');
                 MemoMensagem.Lines.Insert(0,'-----Mensagem original-----');
                 MemoMensagem.Lines.Insert(1,'De: ' + Sistema.NomeUsuario);
                 MemoMensagem.Lines.Insert(2,'Enviada em: ' + DateTimeToStr(frmLista.CdsMensagensEnviadas.FieldByName('DATAENVIO').AsDateTime));
                 MemoMensagem.Lines.Insert(3,'Para: ' + frmLista.CdsMensagensEnviadas.FieldByName('NOMEDESTINATARIO').AsString);
                 MemoMensagem.Lines.Insert(4,'Assunto: ' + frmLista.CdsMensagensEnviadas.FieldByName('ASSUNTO').AsString);
                 MemoMensagem.Lines.Insert(2,'');
                 MemoMensagem.Lines.Insert(4,'>>');
                 MemoMensagem.SelStart := 0;
                 MemoMensagem.SelLength := 1;
                 MemoMensagem.SetFocus;
            end;
        end;
  end;
end;

procedure TCorreioCM.frmListabtnAtualizar(Sender: TObject);
Var
   i: Integer;
begin
   AtuGrid;

   for i := 0 to frmLista.HcGridMensagem.Sections.Count-1 do
       frmLista.GridMensagem.ColWidths[i] := frmLista.HcGridMensagem.Sections[i].Width-1;

   frmLista.GridMensagem.row := 0;
   AtuMensagem(0);
end;

end.


