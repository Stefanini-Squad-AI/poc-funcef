unit fMTMovSaidaTempExe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery,
  Wwdbigrd, Wwdatsrc, Grids, Wwdbgrid, MontaSelect, Mask, wwdbedit, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, DBClient, uCMClientDataSet,
  uCMTypes, uCtrlPadroes, uCtrlMovSaidaTemporaria, uCmSqlParams, IvEMulti;

type
  TfrmMTMovSaidaTempExe = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    PnlDetalhe: TPanel;
    dbgBensConj: TwwDBGrid;
    Termo: TLabel;
    dbeTermo: TwwDBEdit;
    Label4: TLabel;
    dbeResponsavel: TwwDBEdit;
    Label34: TLabel;
    dbeLocalizacao: TwwDBEdit;
    Label6: TLabel;
    dbeObs: TDBMemo;
    bbtnSelTermo: TBitBtn;
    MSTermo: TMontaSelect;
    dbeMotivo: TwwDBEdit;
    Label2: TLabel;
    dsTermo: TwwDataSource;
    Label5: TLabel;
    dsTermoBens: TwwDataSource;
    Bevel3: TBevel;
    Label3: TLabel;
    pnlData: TPanel;
    edData: TCMDateTimePicker;
    cdsTermo: TCMClientDataSet;
    cdsTermoBens: TCMClientDataSet;
    sqlTermoBens: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTermoClick(Sender: TObject);
  private
    { Private declarations }
    SaidaTemporaria : TCtrlMovSaidaTemporaria;
    procedure SelSaidaTemporaria(fIdPessoa, fIdSaidaTemporaria : Extended);
  public
    { Public declarations }
  end;

var
  frmMTMovSaidaTempExe: TfrmMTMovSaidaTempExe;

implementation

uses uSistema, uMensErro;

{$R *.DFM}

//========================================================================================
procedure TfrmMTMovSaidaTempExe.FormCreate(Sender: TObject);
begin
   inherited;
   SaidaTemporaria := TCtrlMovSaidaTemporaria.Create;
   SaidaTemporaria.InitializeAs(Padroes);
   SaidaTemporaria.cds              := cdsTermo;
   SaidaTemporaria.cdsSaidaTempBens := cdsTermoBens;
   //-------------------------------------------------------------------------------------
   MSTermo.Filtro.Add('SAIDATEMPORARIA.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   SelSaidaTemporaria(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TFrmMTMovSaidaTempExe.SelSaidaTemporaria(fIdPessoa, fIdSaidaTemporaria : Extended);
begin
   cdsTermo.Data := SaidaTemporaria.ListaSaidaTemporaria(fIdPessoa, fIdSaidaTemporaria);
   if not cdsTermo.IsEmpty then
   begin
      edData.Date := cdsTermo.FieldByName('STPDATA').AsDateTime;
      cdsTermoBens.Data := SaidaTemporaria.ListaSaidaTempBens(cdsTermo.FieldByName('IDPESSOA').AsFloat,
                                                              cdsTermo.FieldByName('IDSAIDATEMPORARIA').AsFloat);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
   end else
   begin
      edData.Text := '';
      cdsTermoBens.Data := SaidaTemporaria.ListaSaidaTempBens(Sistema.IdEmpresa, 0);
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled  := False;
   end;
end;
//========================================================================================
procedure TfrmMTMovSaidaTempExe.bbtnSelTermoClick(Sender: TObject);
begin
   inherited;
   MSTermo.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSTermo.RetornouValor then
   begin
      SelSaidaTemporaria(Sistema.IdEmpresa, StrToInt(MSTermo.ValoresChave[0]));
      //----------------------------------------------------------------------------------
      if cdsTermo.FieldByName('STPFLGEXEC').AsInteger = 1 then
      begin
         MsgDlg('Termo de Saída Temporária já executado','Erro',mtError,[mbOK],0);
         bbtnConfirmar.Enabled := False;
         bbtnCancelar.Enabled  := True;
      end else
      begin
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
      end;
   end else
   begin
      edData.Date := date;
      SelSaidaTemporaria(Sistema.IdEmpresa, 0);
   end;   
end;
//========================================================================================
procedure TfrmMTMovSaidaTempExe.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if edData.Text = '' then
   begin
      MsgDlg('Informe a data de saída dos bens deste termo!','Erro',mtError,[mbOK],0);
      edData.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   if not SaidaTemporaria.ExecutaTermoSaidaTemporaria(cdsTermo.FieldByName('IDPESSOA').AsFloat,
                                                      cdsTermo.FieldByName('IDSAIDATEMPORARIA').AsFloat,
                                                      edData.Date) then
      MsgDlg('Termo de Saida Temporária Não Processado!' + #13 + #13 +
             'Causa : ' + SaidaTemporaria.MessageInfo,
             'Erro', mtError, [mbOk], 0)
   else
      MsgDlg('Termo de Saida Temporária Processado!','Atenção',mtInformation,[mbOk],0);
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   SelSaidaTemporaria(Sistema.IdEmpresa, 0);
   bbtnSelTermo.SetFocus;
end;
//========================================================================================
procedure TfrmMTMovSaidaTempExe.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   SelSaidaTemporaria(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TfrmMTMovSaidaTempExe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   SaidaTemporaria.Free;
end;

end.
