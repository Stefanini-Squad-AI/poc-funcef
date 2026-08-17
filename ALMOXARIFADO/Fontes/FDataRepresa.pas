unit FDataRepresa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmDataRepresa = class(TfrmSairAjuda)
    BtnAtualiza: TBitBtn;
    GrpData: TGroupBox;
    edData: TCMDateTimePicker;
    GrpAnda: TGroupBox;
    qryArt: TwwQuery;
    qryArtDESCPROD: TStringField;
    qryArtCODARTIGO: TStringField;
    lblDescProd: TLabel;
    BarProd: TProgressBar;
    qryAlmox: TwwQuery;
    Label1: TLabel;
    Label2: TLabel;
    LbHoraIni: TLabel;
    LbHoraFim: TLabel;
    RgSaldo: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure Processar;
  public
    { Public declarations }
  end;

var
  FrmDataRepresa : TFrmDataRepresa;
  dData          : TDateTime;
implementation

{$R *.DFM}

Uses DBaseDados, uSistema, uModulo, uDataBase, uMensErro,
     uMovNew, uFuncaoGeral, DMoviment;

procedure TFrmDataRepresa.FormCreate(Sender: TObject);
begin
  inherited;
  qryArt.Open;
  //
  qryAlmox.Close;
  qryAlmox.Prepare;
  qryAlmox.Params[0].Value := Sistema.IdEmpresa;
  qryAlmox.Open;
  //
  dData               := Modulo.LeDataRepresa;
  edData.Date         := dData;
  BtnAtualiza.Enabled := True;
end;

procedure TFrmDataRepresa.BtnAtualizaClick(Sender: TObject);
begin
  inherited;
  If MsgDlg('Confirma Atualização de Data Represa','Confirmação',mtConfirmation,[mbOK,mbCancel],0) = mrOk Then
    Begin
      If edData.Date < dData Then
         Begin
             MsgDlg('Não se pode retroceder a data de represamento','Erro',mtError,[mbOK],0);
             edData.SetFocus;
         End
      Else
      If edData.Date = dData Then
         Begin
             MsgDlg('A Data não foi alterada, para que haja uma atualização','Atenção',mtWarning,[mbOK],0);
             edData.SetFocus;
         End
      Else
         Begin
             BtnAtualiza.Enabled := False;
             LbHoraIni.Caption   := TimeToStr( Time );
             Try
                StartTransacao;
                If ExecutarQuery(DtmBAseDados.qry,' UPDATE PARALMOX SET'+
                                                  ' DATAREPRESA = TO_DATE('''+DateToStr( edData.date )+''',''DD/MM/YYYY'') '+
                                                  ' WHERE (IDPESSOA = '+IntToStr( Sistema.IdEmpresa )+') ')
                Then
                   Begin
                      Processar;
                      LbHoraFim.Caption := TimeToStr( Time );
                      MsgDlg('Atualização realizada com sucesso','Informação',mtInformation,[MbOk],0);
                   End
                Else
                   Exit;
                CommitTransacao;
             Except
                RollbackTransacao;
                msgDlg('Atualização não realizada','Erro',mtError,[MbOk],0);
                Raise;
             End;
             FuncaoGeral.TiraIcone;
         End;
    End;
End;

Procedure TFrmDataRepresa.Processar;
Var
   x : Integer;
Begin
  // Processa Saldo
  qryAlmox.First;
   While Not qryAlmox.EOF Do
     Begin
         GrpAnda.Caption := Format(' Atualizando Saldo - %s ',[qryAlmox.FieldByName('DESCALMOX').asString]);
         Application.ProcessMessages;
         x           := 0;
         BarProd.Min := 0;
         BarProd.Max := qryArt.RecordCount - 1;
         qryArt.First;
         While Not qryArt.EOF Do
            Begin
               Inc( x );
               lblDescProd.Caption := qryArt.FieldByName('DESCPROD').asString;
               Application.ProcessMessages;
               Case RgSaldo.ItemIndex Of
                   0 : MovNew.AtualizaSaldoRet(edData.Date,qryArt.FieldByName('CODARTIGO').asString,qryAlmox.FieldByName('CODALMOXARIFADO').asInteger );
                   1 : MovNew.AtualizaSaldo((dData+1),qryArt.FieldByName('CODARTIGO').asString,qryAlmox.FieldByName('CODALMOXARIFADO').asInteger );
               End;
               qryArt.Next;
               BarProd.Position := x;
            End;
         qryAlmox.Next;
     End;
     qryAlmox.Close;
  // Processa CustoMédio e Valor
   GrpAnda.Caption := ' Atualizando Custos e Valores ' ;
   Application.ProcessMessages;
   x           := 0;
   BarProd.Min := 0;
   BarProd.Max := qryArt.RecordCount - 1;
   qryArt.First;
   While Not qryArt.EOF Do
      Begin
          Inc( x );
          lblDescProd.Caption := qryArt.FieldByName('DESCPROD').asString;
          Application.ProcessMessages;
          MovNew.GeraRetroativo((dData+1),qryArt.FieldByName('CODARTIGO').asString);
          qryArt.Next;
          BarProd.Position := x;
      End;
end;
procedure TFrmDataRepresa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if qryAlmox.Prepared Then
     Begin
      qryAlmox.Close;
      qryAlmox.UnPrepare;
     End;
end;

end.
