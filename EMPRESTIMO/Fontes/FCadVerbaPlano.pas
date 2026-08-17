unit FCadVerbaPlano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSImob, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask, wwdbedit, Wwdbspin,
  wwdblook, DBCtrls, uObjetoVerba;

type
  TfrmCadVerbaPlano = class(TfrmCadastroCSImob)
    qryIDVERBAPLANO: TFloatField;
    qryIDPLANOPREV: TFloatField;
    qryDATA: TDateTimeField;
    qryIDUSUARIO: TFloatField;
    qryANOMES: TStringField;
    qryVALOR: TFloatField;
    qryTRGDTINCLUSAO: TDateTimeField;
    qryTRGUSERINCLUSAO: TStringField;
    qryPlano: TwwQuery;
    qryPlanoIDPLANOPREV: TFloatField;
    qryPlanoNOME: TStringField;
    Label15: TLabel;
    cboMes: TComboBox;
    DBspnAno: TwwDBSpinEdit;
    DBcboPlano: TwwDBLookupCombo;
    Label1: TLabel;
    dsPlano: TwwDataSource;
    Label2: TLabel;
    DBedtValor: TDBEdit;
    Label3: TLabel;
    DBEdtData: TDBEdit;
    DBEdtNome: TDBEdit;
    Label4: TLabel;
    qryNOME: TStringField;
    chkZeraValor: TCheckBox;

    procedure FormShow(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cboMesChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);


  private { Private declarations }

    ObjetoVerba : TObjetoVerba;


  public  { Public declarations }

  end;



var
  frmCadVerbaPlano: TfrmCadVerbaPlano;



implementation
{$R *.DFM}
uses
     USistema,       (* Sistema *)
     UDataBase,      (* LeUltRegistro *)
     UMensErro,      (* MsgDlg *)
     UFuncoesEmptmo, (* LimpaParametros, CritDataEmptmo, ConverteVirg*)
     FProgresso,     (* FrmProgresso *)
     dBaseDados, uModulo, uVerificaPreenchimento,
     uDiasUteis;





procedure TfrmCadVerbaPlano.FormShow(Sender: TObject);
begin
   inherited;
   cboMes.ItemIndex := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value   := DiasUteis.ExtraiAno(Date);
   qryPlano.Open;
   LimpaParametros(qry);
   qry.ParamByName('PIDVERBAPLANO').AsInteger := -1;
   qry.Open;

   sbtnAlterar.Visible := False;
end;



procedure TfrmCadVerbaPlano.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   qryIDVERBAPLANO.AsInteger := LeUltRegistro(nil,'EPVERBAPLANO');
   qryDATA.AsDateTime        := SysDate;
   qryNOME.AsString          := Sistema.NomeUsuario;
end;



procedure TfrmCadVerbaPlano.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryPlano.Close;
   inherited;
end;



procedure TfrmCadVerbaPlano.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   LimpaParametros(qry);
   qry.ParamByName('PIDVERBAPLANO').AsInteger := StrToInt(MontaSelect.ValoresChave[2]);
   qry.Open;
end;



procedure TfrmCadVerbaPlano.bbtnConfirmarClick(Sender: TObject);
var
    sAno, sMes : String;
begin

   if (chkZeraValor.Checked) and (MessageDlg('Confirma zerar valores utilizados?',mtConfirmation,[mbYes,mbNO],0) = mrNO) then Exit;

   if qry.State in DsEditModes then begin
      sAno                   := IntToStr(Trunc(DBspnAno.Value));
      sMes                   := FormatFloat('00',cboMes.ItemIndex + 1);
      qryANOMES.AsString     := sAno + sMes;
      qryIDUSUARIO.AsInteger := Sistema.IdUsuario;
   end;

   ObjetoVerba.RefazDistribuicao(qryIDPLANOPREV.AsInteger,
                                 qryVALOR.AsCurrency,
                                 chkZeraValor.Checked);

   inherited;

   if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Commit;

   chkZeraValor.Checked := False;
   sbtnAlterar.Visible := False;
end;



procedure TfrmCadVerbaPlano.cboMesChange(Sender: TObject);
begin
   inherited;
   MessageDlg('Alteração do mês implica na obrigatoriedade de zerar valores utilizados.',mtInformation,[mbOK],0);
   chkZeraValor.Checked := True;
end;



procedure TfrmCadVerbaPlano.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Visible := False;
end;



procedure TfrmCadVerbaPlano.sbtnApagarClick(Sender: TObject);
begin
   ObjetoVerba.RefazDistribuicao(qryIDPLANOPREV.AsInteger,
                                 qryVALOR.AsCurrency * -1,
                                 chkZeraValor.Checked);

  inherited;
end;



end.
