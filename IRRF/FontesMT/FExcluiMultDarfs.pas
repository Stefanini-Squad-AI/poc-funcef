{===============================================================================

CM Soluções Informática
Autor: Rodolpho da Silva
Data : 10/12/2004 





================================================================================}
unit FExcluiMultDarfs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Grids,
  Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, uCtrlDARF, uMensErro, DBClient,
  uSistema, uVerificaPreenchimento, fCadastroDarfMT, uCMClientDataSet, uCtrlLancamento, DBTables;

type
  TfrmExcluiMultDarfs = class(TfrmOkCancelar)
    pnlTop: TPanel;
    rdgFiltragem: TRadioGroup;
    GroupBox1: TGroupBox;
    edtDtInicio: TCMDateTimePicker;
    edtDtFim: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Grid: TwwDBGrid;
    Cds: TCMClientDataSet;
    ds: TwwDataSource;
    BitBtn1: TBitBtn;
    btnTodas: TSpeedButton;
    btnInverter: TSpeedButton;
    CdsBaixa: TCMClientDataSet;
    CdsDocumento: TCMClientDataSet;
    CdsLanctoDoc: TCMClientDataSet;
    CdsFAVORECIDO: TStringField;
    CdsCONTRIBUINTE: TStringField;
    CdsIDDARF: TFloatField;
    CdsDATAEMISDARF: TDateTimeField;
    CdsCODDOCUMENTO: TFloatField;
    CdsVLRTOTAL: TFloatField;
    CdsDATAVENCDARF: TDateTimeField;
    CdsFLGEXCLUI: TStringField;
    CdsCODNATUREZA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GridTopRowChanged(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure GridCheckValue(Sender: TObject; PassesPictureTest: Boolean);
    procedure btnTodasClick(Sender: TObject);
    procedure btnInverterClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

    CtrlDARF       : TCtrlDARF;
    CtrlLancamento : TCtrlLancamento;

    function VerificaPreenchimento : Boolean;




    procedure MensErroMt(sMsgInfo: string);
    procedure MudaStatusSelecao;


  public
    { Public declarations }
  end;

var
  frmExcluiMultDarfs: TfrmExcluiMultDarfs;

implementation

uses DBaseDados;

{$R *.DFM}



function TfrmExcluiMultDarfs.VerificaPreenchimento: Boolean;
begin

   try
     if edtDtInicio.Text = '' then
       raise EValidacao.Createval('A data inicial não pode estar nula!',edtDtInicio)
     else
     if edtDtFim.Text = '' then
       raise EValidacao.Createval('A data final não pode estar nula!',edtDtFim)
     else
     if edtDtInicio.Date > edtDtFim.Date then
       raise EValidacao.Createval('A data inicial não pode ser maior que a data final!',edtDtInicio);

   except
       on ev : EValidacao do
       begin
          Result := False;
          if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
          Repaint;
          if ev.Control.CanFocus then ev.Control.SetFocus;
          Exit;
       end;
   end;

   Result := True;
end;



procedure TfrmExcluiMultDarfs.FormCreate(Sender: TObject);
begin
  CtrlDARF :=  TCtrlDARF.Create;
  CtrlDARF.Initialize (dtmBaseDados.dbBaseDados, true,
                       Sistema.ConnectionType, Sistema.ConnectionSide,
                       Sistema.AppRemoteServer, true, MensErroMT);

  CtrlDARF.CdsDARF := Cds;

  Cds.Data := CtrlDARF.ListaDarfsAExcluir(True,false,0,0);

  inherited;

end;



procedure TfrmExcluiMultDarfs.MensErroMt(sMsgInfo: string);
begin
//forma a mensagem de erro
  MsgDlg(sMsgInfo, Sistema.NomeAplicativo, mtWarning,[mbOk],0);
end;



procedure TfrmExcluiMultDarfs.BitBtn1Click(Sender: TObject);
var
bFiltroVencimento: boolean;

begin
  inherited;
  if VerificaPreenchimento then
  begin
     if rdgFiltragem.ItemIndex = 0 then
       // Filtra por data de emissão do DARF
       bFiltroVencimento := false
     else
       // Filtra por data de vencimento do DARF
       bFiltroVencimento := True;

     Cds.Data := CtrlDARF.ListaDarfsAExcluir(False,bFiltroVencimento,edtDtInicio.Date,edtDtFim.Date);
  end;
end;



procedure TfrmExcluiMultDarfs.GridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;



procedure TfrmExcluiMultDarfs.GridTopRowChanged(Sender: TObject);
begin
  inherited;
  //  Acerta as cores do grid
  (sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExcluiMultDarfs.MudaStatusSelecao;
begin
   if not Cds.IsEmpty then
   begin
      if Cds.FieldByName('FLGEXCLUI').AsString = 'S' then
      begin
        Cds.Edit;
        Cds.FieldByName('FLGEXCLUI').AsString := 'N';
        Cds.Post;
      end
      else
      begin
        Cds.Edit;
        Cds.FieldByName('FLGEXCLUI').AsString := 'S';
        Cds.Post;
      end;
   end;   
end;



procedure TfrmExcluiMultDarfs.GridDblClick(Sender: TObject);
begin
   inherited;
   MudaStatusSelecao;
end;



procedure TfrmExcluiMultDarfs.GridCheckValue(Sender: TObject;
  PassesPictureTest: Boolean);
begin
   inherited;
   MudaStatusSelecao;
end;


procedure TfrmExcluiMultDarfs.btnTodasClick(Sender: TObject);
begin
   inherited;
   if not Cds.IsEmpty then

   begin
      Cds.DisableControls;
      Cds.First;

      while not Cds.Eof do
      begin
         if Cds.FieldByName('FLGEXCLUI').AsString <> 'S' then
         begin
           Cds.Edit;
           Cds.FieldByName('FLGEXCLUI').AsString := 'S';
           Cds.Post;
         end;
         Cds.Next;
      end;

      Cds.First;
      Cds.EnableControls;
   end;
end;



procedure TfrmExcluiMultDarfs.btnInverterClick(Sender: TObject);
begin
   inherited;

   if not Cds.IsEmpty then
   begin
      Cds.DisableControls;
      Cds.First;

      while not Cds.Eof do
      begin
        MudaStatusSelecao;
        Cds.Next;
      end;

      Cds.First;
      Cds.EnableControls;
   end;
end;



procedure TfrmExcluiMultDarfs.bbtnConfirmarClick(Sender: TObject);
var
   bErro: Boolean;
   sListaCod : TStringList;
   iContador : Integer;

begin
   inherited;
   bErro := False;

   sListaCod := TStringList.Create;

   if Cds.IsEmpty then
      MsgDlg('Não há nada à ser excluído!',Sistema.NomeAplicativo,mtWarning,[mbOk],0)
   else

   if MsgDlg('Deseja realmente excluir os documentos selecionados?',Sistema.NomeAplicativo,mtConfirmation,[mbYes,mbNo],0) = mrYes then
   begin
      Cds.First;
      Cds.DisableControls;

      try
         //  Inicia a transação
         dtmBaseDados.dbBaseDados.StartTransaction;

         while not Cds.Eof do
         begin

            //  Se o registro estiver marcado para exclusão
            if Cds.FieldByName('FLGEXCLUI').AsString = 'S' then
            begin

               if sListaCod.IndexOf(Cds.FieldByName('CODDOCUMENTO').AsString) = -1 then
                  sListaCod.Add(Cds.FieldByName('CODDOCUMENTO').AsString);

               // Atualiza o DARF...
               if not CtrlDarf.AtualizaDarf(Cds.FieldByName('IDDARF').AsInteger,0) then
                  raise Exception.Create(CtrlDarf.MessageInfo);

               if not CtrlDarf.AtualizaLanc(Cds.FieldByName('IDDARF').AsInteger) then
                 raise Exception.Create(CtrlDarf.MessageInfo);

               //  Exclui o DARF
               Cds.Delete;

            end
            else
               Cds.Next;

         end;

         if not CtrlDARF.GravarDARF(False) then
            raise Exception.Create(CtrlDARF.MessageInfo);


         for iContador := 0 to sListaCod.Count - 1 do
         begin
             //  Seleciona e exclui o documento na tabela DOCUMENTO
            if not CtrlDarf.ExcluiDocumento(StrToInt(sListaCod.Strings[iContador]), sistema.IdEspAcesso, sistema.IdUsuario) then
            Begin
               bErro := true;
               raise Exception.Create(CtrlDarf.MessageInfo);
            end;

            CdsLanctoDoc.data := CtrlDarf.ListLanctoDoc(StrToInt(sListaCod.Strings[iContador]));
            CdsLanctoDoc.First;
            While not CdsLanctoDoc.EOF do
            begin
               CtrlLancamento.ExcluiLancaContab(Sistema.idUsuario, CdsLanctoDoc.FieldByName('PLNCODIGO').AsInteger,
                                                Sistema.idModulo,
                                                0, Sistema.UsaPlanoPatro, True);
               CdsLanctoDoc.Next;
            end;

         end;

         dtmBaseDados.dbBaseDados.Commit;
      except
         on E: Exception do
         begin
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.RollBack;
            MsgDlg(e.Message,sistema.NomeAplicativo,mtError,[mbOk],0);

         end;

      end;

   end;
   sLIstacod.Free;
   Cds.EnableControls;
end;



procedure TfrmExcluiMultDarfs.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = vk_space) then MudaStatusSelecao;
end;

end.
