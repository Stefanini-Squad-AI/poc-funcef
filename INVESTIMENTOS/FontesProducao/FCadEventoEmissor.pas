unit FCadEventoEmissor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask,  wwdblook,
  TREdit, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TfrmCadEventoEmissor = class(TfrmCadastroCS)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBlkEmissor: TwwDBLookupCombo;
    DBlkTipoEvento: TwwDBLookupCombo;
    DBData: TCMDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    LbLValor: TLabel;
    QryEmissor: TwwQuery;
    QryTipoEvento: TwwQuery;
    qryProcura: TwwQuery;
    dbreValor: TDBRealEdit;
    dbrgStat: TDBRadioGroup;
    function JaExiste : boolean ;
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEventoEmissor: TfrmCadEventoEmissor;

implementation

uses
 UMensErro, USistema ;

{$R *.DFM}

Function TfrmCadEventoEmissor.JaExiste;
begin
   qryProcura.SQL.Clear;
   qryProcura.SQL.Add('SELECT EE.IDTIPOEVENEMISSOR , EE.IDEMISSOR , EE.DATAEVENTOEMISSOR From '+
                      Sistema.PrefixoServidor +'EVENTOEMISSOR EE');
   qryProcura.SQL.Add('WHERE  EE.IDTIPOEVENEMISSOR = ' + qry.FieldByName('IdTipoEvenEmissor').AsString );
   qryProcura.SQL.Add(' AND  EE.IDEMISSOR = ' + qry.FieldByName('IdEmissor').AsString ) ;
   qryProcura.SQL.Add(' AND  EE.DATAEVENTOEMISSOR = To_Date(''' +
                      FormatDatetime('yyyymmdd',DbData.date) + ''',''yyyymmdd'' )');

   qryProcura.Prepare;
   qryProcura.Open;
   Result := not( qryProcura.IsEmpty );
   qryProcura.Close;
end;

procedure TfrmCadEventoEmissor.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
     qry.Locate('IdTipoEvenEmissor;DataEventoEmissor;IdEmissor', VarArrayOf([MontaSelect.ValoresChave[0],MontaSelect.ValoresChave[1],MontaSelect.ValoresChave[2]]), [loPartialKey]);

  inherited;
  
end;

procedure TfrmCadEventoEmissor.bbtnConfirmarClick(Sender: TObject);
begin
   if Trim(dblkEmissor.Text) = '' then
   begin
      MsgDlg('Emissor deve ser informado. ','Mensagem do Sistema',mtWarning,[mbOK],0);
      dblkEmissor.SetFocus;
      exit;
   end
   else
   if Trim(dblkTipoEvento.Text) = '' then
   begin
      MsgDlg('Tipo do Evento deve ser informado . ','Mensagem do Sistema',mtWarning,[mbOK],0);
      dblkTipoEvento.SetFocus;
      exit;
   end
   else
   if Trim(dbData.Text) = '' then
   begin
      MsgDlg('Data deve ser informada . ','Mensagem do Sistema',mtWarning,[mbOK],0);
      dbData.SetFocus;
      exit;
   end
   else
   if Trim(dbreValor.Text) = '' then
   begin
      MsgDlg('Valor deve ser informado . ','Mensagem do Sistema',mtWarning,[mbOK],0);
      dbreValor.SetFocus;
      exit;
   end
   else
   if (ds.dataset.state = dsInsert) and JaExiste then
   begin
      MsgDlg('Já existe Esse Evento para essa data . ','Mensagem do Sistema',mtWarning,[mbOK],0);
      dblkEmissor.SetFocus;
      exit;
   end;
   inherited;
end;

procedure TfrmCadEventoEmissor.FormShow(Sender: TObject);
begin
  inherited;
  Qry.Open;
  QryEmissor.Open;
  QryTipoEvento.Open;
end;

procedure TfrmCadEventoEmissor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Qry.Open;
  QryEmissor.Open;
  QryTipoEvento.Open;
end;

end.
