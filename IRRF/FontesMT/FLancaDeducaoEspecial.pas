unit FLancaDeducaoEspecial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc,
  DBClient, uCMClientDataSet, uMensErro, uDataBase, uCtrlUtilLancaEspecial, uCtrlNatuRendimento, uCtrlInforme,
  uSistema, DBasedados, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  DBTables, FProgresso, ComCtrls, CheckLst;

type
  TfrmLancaDeducaoEspecial = class(TfrmOkCancelar)
    gbPeriodoApu: TGroupBox;
    lblDataIni: TLabel;
    lblDataFim: TLabel;
    deDataIni: TCMDateTimePicker;
    deDataFim: TCMDateTimePicker;
    CdsLanca: TCMClientDataSet;
    cdsLancaInforme: TCMClientDataSet;
    cdsInforme: TCMClientDataSet;
    cdsNatureza: TCMClientDataSet;
    Label1: TLabel;
    dsInforme: TDataSource;
    dbcboInforme: TwwDBLookupCombo;
    dbgNatureza: TwwDBGrid;
    cdsNaturezaSel: TCMClientDataSet;
    wwDBGrid2: TwwDBGrid;
    dsNatureza: TDataSource;
    dsNaturezaSel: TDataSource;
    btnAdiciona: TSpeedButton;
    SpeedButton3: TSpeedButton;
    btnRetira: TSpeedButton;
    qryInsert: TQuery;
    cklRendimentos: TCheckListBox;
    Label2: TLabel;
    dbcboLinhaExclusao: TwwDBLookupCombo;
    Label3: TLabel;
    cdsEmpresa: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAdicionaClick(Sender: TObject);
    procedure btnRetiraClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlLancaEspecial  : TCtrlUtilLancaEspecial;
    CtrlNatuRendimento : TCtrlNatuRendimento;
    CtrlInforme        : TCtrlInforme;

    sNatureza          : String;
    sRendim            : String;


    procedure Grava;
    procedure GravaFUNCEF;
  public
    { Public declarations }
  end;

var
  frmLancaDeducaoEspecial: TfrmLancaDeducaoEspecial;

implementation

{$R *.DFM}



procedure TfrmLancaDeducaoEspecial.FormCreate(Sender: TObject);
var i : Integer;
begin
   inherited;
   CtrlLancaEspecial  := TCtrlUtilLancaEspecial.Create;
   CtrlNatuRendimento := TCtrlNatuRendimento.Create;
   CtrlInforme        := TCtrlInforme.Create;
   CtrlLancaEspecial.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer,True,nil,nil,False);
   CtrlNatuRendimento.InitializeAs(CtrlLancaEspecial);
   CtrlInforme.InitializeAs(CtrlLancaEspecial);

   deDataIni.Date      := StrToDate('01/08/2004');
   deDataFim.Date      := StrToDate('31/12/2004');
   cdsInforme.Data     := CtrlInforme.ListInforme;
   cdsNatureza.Data    := CtrlNaturendimento.ListNaturendimento;
   cdsNaturezaSel.Data := CtrlNaturendimento.ProcurarNaturendimento('-1');

   for i := 0 to cklRendimentos.Items.Count -1 do
       cklRendimentos.Checked[i] := True;

end;



procedure TfrmLancaDeducaoEspecial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CtrlNatuRendimento.Free;
   CtrlInforme.Free;
   CtrlLancaEspecial.Free;
   inherited;
end;



procedure TfrmLancaDeducaoEspecial.btnAdicionaClick(Sender: TObject);
begin
   inherited;
   if not cdsNaturezaSel.Locate('CODNATUREZA',cdsNatureza.FieldByName('CODNATUREZA').AsString,[]) then
   begin
      cdsNaturezaSel.Insert;
      cdsNaturezaSel.FieldByName('CODNATUREZA').AsString := cdsNatureza.FieldByName('CODNATUREZA').AsString;
      cdsNaturezaSel.FieldByName('DESCRICAO').AsString   := cdsNatureza.FieldByName('DESCRICAO').AsString;
      cdsNaturezaSel.Post;
   end;
end;



procedure TfrmLancaDeducaoEspecial.btnRetiraClick(Sender: TObject);
begin
   inherited;
   cdsNaturezaSel.Delete;
end;



procedure TfrmLancaDeducaoEspecial.bbtnConfirmarClick(Sender: TObject);
var
   iContador  : Integer;
   bMarcado   : Boolean;
   bNormal    : Boolean;
begin
   inherited;
   if deDataIni.Date < StrToDate('01/08/2004') then
   begin
      MsgDlg('Data inicial não pode ser inferior a 01/08/2004','Erro',mtError,[mbOk],0);
      deDataIni.SetFocus;
      exit;
   end;

   if deDataIni.Date > StrToDate('31/12/2004') then
   begin
      MsgDlg('Data inicial não pode ser superior a 31/12/2004','Erro',mtError,[mbOk],0);
      deDataIni.SetFocus;
      exit;
   end;

   if deDataFim.Date > StrToDate('31/12/2004') then
   begin
      MsgDlg('Data final não pode ser superior a 31/12/2004','Erro',mtError,[mbOk],0);
      deDataFim.SetFocus;
      exit;
   end;

   if deDataIni.Date > deDataFim.Date then
   begin
      MsgDlg('Data inicial não pode ser superior a data final','Erro',mtError,[mbOk],0);
      deDataIni.SetFocus;
      exit;
   end;

   if dbcboInforme.LookupValue = '' then
   begin
      MsgDlg('É obrigatório o preenchimento da linha de informe para lançamento da dedução','Erro',mtError,[mbOk],0);
      dbcboInforme.SetFocus;
      exit;
   end;

   if cdsNaturezaSel.RecordCount = 0 then
   begin
      MsgDlg('É obrigatório informar o(s) código(s) de natureza de rendimento','Erro',mtError,[mbOk],0);
      dbgNatureza.SetFocus;
      Exit;
   end;

   bMarcado := False;
   sRendim  := '';
   for iContador := 0 to cklRendimentos.Items.Count -1 do
   begin
      if cklRendimentos.Checked[iContador] then
      begin
         bMarcado := True;
         if sRendim <> '' then sRendim := sRendim + ',';
         sRendim := sRendim + Copy(cklRendimentos.Items.Strings[iContador],1,2);
      end;
   end;

   if not bMarcado then
   begin
      MsgDlg('É obrigatório informar um tipo de rendimento a ser considerado','Erro',mtError,[mbOk],0);
      cklRendimentos.SetFocus;
      Exit;
   end;

   cdsNaturezaSel.DisableControls;
   cdsNaturezaSel.First;
   sNatureza := '';

   while not cdsNaturezaSel.Eof do
   begin
      if sNatureza <> '' then sNatureza := sNatureza + ',';
      sNatureza := sNatureza + QuotedStr(cdsNaturezaSel.FieldByName('CODNATUREZA').AsString);
      cdsNaturezaSel.Next;
   end;
   cdsNaturezaSel.First;
   cdsNaturezaSel.EnableControls;


   cdsEmpresa.Data := CtrlLancaEspecial.TipoEmpresa;

   bNormal         := (cdsEmpresa.FieldByName('FLGEXCEPCIONAL').AsInteger = 0);

   if bNormal then Grava
   else            GravaFUNCEF;
end;



procedure TfrmLancaDeducaoEspecial.Grava;
var
   iContador  : Integer;
   fTotalRend : Extended;
begin
   cdsLanca.Data := CtrlLancaEspecial.ListaDadosLancIRRF(DateToStr(deDataIni.Date),DateToStr(deDataFim.Date),sNatureza, sRendim);

   iContador := 0;
   frmProgresso.MostraFormProgresso('Processando',True,False,True,0,cdsLanca.RecordCount);

   while not cdsLanca.Eof do
   begin
      Inc(iContador);
      frmProgresso.AndaFormProgresso(iContador);
      Application.ProcessMessages;
      Repaint;
      try
         dtmBaseDados.dbBaseDados.StartTransaction;
         fTotalRend := 0;
         cdsLancaInforme.Data := CtrlLancaEspecial.ListaDadosInforme(cdsLanca.FieldByName('IDLANCIRRF').AsInteger, sRendim);

         while not cdsLancaInforme.eof do
         begin
            if (dbcboLinhaExclusao.LookupValue = '') or
               ((dbcboLinhaExclusao.LookupValue <> '') and
                (cdsLancaInforme.FieldByName('IDINFORME').AsInteger <> StrToInt(dbcboLinhaExclusao.LookupValue))) then
               fTotalRend := fTotalRend + cdsLancaInforme.FieldByname('VLRLANC').AsFloat;
            cdsLancaInforme.Next;
         end;

         cdsLancaInforme.First;

         if fTotalRend > 100 then fTotalRend := 100;

         if not cdsLancaInforme.Locate('IDINFORME',StrToint(dbcboInforme.LookupValue),[]) then
         begin
            qryInsert.ParamByName('IDINFORME').AsInteger     := StrToint(dbcboInforme.LookupValue);
            qryInsert.ParamByName('IDLANCIRRF').AsInteger    := cdsLanca.FieldByName('IDLANCIRRF').AsInteger;
            qryInsert.ParamByName('VLRLANC').AsFloat         := fTotalRend;
            qryInsert.ParamByName('FONTEPAGADORA').AsInteger := 1;
            qryInsert.ExecSql;
         end;
         dtmBaseDados.dbBaseDados.Commit;
      except
         dtmBaseDados.dbBaseDados.RollBack;
      end;
      cdsLanca.Next;
   end;
   frmProgresso.EscondeFormProgresso;
   MsgDlg('Fim de Processamento.','Aviso',mtWarning,[mbOk],0);
end;



procedure TfrmLancaDeducaoEspecial.GravaFUNCEF;
var
   iContador   : Integer;
   iPessoa     : Extended;
   iFonte      : Integer;
   fSomatorio, fTotalRend, fTotalRend1, fTotalRend2 : Extended;
   iIDLanc, iIDLanc1, iIDLanc2    : Integer;

begin
   cdsLanca.Data := CtrlLancaEspecial.ListaDadosLancFUNCEF(DateToStr(deDataIni.Date),DateToStr(deDataFim.Date),sNatureza, sRendim);

   iContador := 0;
   frmProgresso.MostraFormProgresso('Processando',True,False,True,0,cdsLanca.RecordCount);

   while not cdsLanca.Eof do
   begin
      iPessoa     := cdsLanca.FieldByName('IDBENEFIRRF').AsFloat;
      fTotalRend1 := 0;
      fTotalRend2 := 0;

      while (iPessoa = cdsLanca.FieldByName('IDBENEFIRRF').AsFloat) and
            (not cdsLanca.Eof) do
      begin
         iFonte := cdsLanca.FieldByName('FONTEPAGADORA').AsInteger;

         while (iPessoa = cdsLanca.FieldByName('IDBENEFIRRF').AsFloat) and
               (iFonte  = cdsLanca.FieldByName('FONTEPAGADORA').AsInteger) and
               (not cdsLanca.Eof) do
         begin
            Inc(iContador);
            frmProgresso.AndaFormProgresso(iContador);
            Application.ProcessMessages;
            Repaint;

            cdsLancaInforme.Data := CtrlLancaEspecial.ListaDadosInforme(cdsLanca.FieldByName('IDLANCIRRF').AsInteger, sRendim);

            while not cdsLancaInforme.eof do
            begin
               if (dbcboLinhaExclusao.LookupValue = '') or
                  ((dbcboLinhaExclusao.LookupValue <> '') and
                   (cdsLancaInforme.FieldByName('IDINFORME').AsInteger <> StrToInt(dbcboLinhaExclusao.LookupValue))) then
               begin
                  if cdsLancaInforme.FieldByName('FONTEPAGADORA').AsInteger = 1 then
                  begin
                     fTotalRend1 := fTotalRend1 + cdsLancaInforme.FieldByname('VLRLANC').AsFloat;
                     iIDLanc1    := cdsLanca.FieldByName('IDLANCIRRF').AsInteger;
                  end
                  else
                  begin
                     fTotalRend2 := fTotalRend2 + cdsLancaInforme.FieldByname('VLRLANC').AsFloat;
                     iIDLanc2    := cdsLanca.FieldByName('IDLANCIRRF').AsInteger;
                  end;
               end;
               cdsLancaInforme.Next;
            end;
            cdsLanca.Next;
         end;
      end;

      fSomatorio := fTotalRend1 + fTotalRend2;

      if fSomatorio > 100 then
      begin
         if (fTotalRend1 >= fTotalRend2) then
         begin
            iFonte  := 1;
            iIDLanc := iIDLanc1;

            if fTotalRend1 > 100 then fTotalRend := 100
            else                      fTotalRend := fTotalRend1;

            try
               dtmBaseDados.dbBaseDados.StartTransaction;
               cdsLancaInforme.Data := CtrlLancaEspecial.ListaDadosInforme(iIDLanc, sRendim);

               if not cdsLancaInforme.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([StrToint(dbcboInforme.LookupValue),iFonte]),[]) then
               begin
                  qryInsert.ParamByName('IDINFORME').AsInteger     := StrToint(dbcboInforme.LookupValue);
                  qryInsert.ParamByName('IDLANCIRRF').AsInteger    := iIDLanc;
                  qryInsert.ParamByName('VLRLANC').AsFloat         := fTotalRend;
                  qryInsert.ParamByName('FONTEPAGADORA').AsInteger := iFonte;
                  qryInsert.ExecSql;
               end;
               dtmBaseDados.dbBaseDados.Commit;
            except
               dtmBaseDados.dbBaseDados.RollBack;
            end;
         end
         else
         begin
            iFonte  := 2;
            iIDLanc := iIDLanc2;

            if fTotalRend2 > 100 then fTotalRend := 100
            else                      fTotalRend := fTotalRend2;

            try
               dtmBaseDados.dbBaseDados.StartTransaction;
               cdsLancaInforme.Data := CtrlLancaEspecial.ListaDadosInforme(iIDLanc, sRendim);

               if not cdsLancaInforme.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([StrToint(dbcboInforme.LookupValue),iFonte]),[]) then
               begin
                  qryInsert.ParamByName('IDINFORME').AsInteger     := StrToint(dbcboInforme.LookupValue);
                  qryInsert.ParamByName('IDLANCIRRF').AsInteger    := iIDLanc;
                  qryInsert.ParamByName('VLRLANC').AsFloat         := fTotalRend;
                  qryInsert.ParamByName('FONTEPAGADORA').AsInteger := iFonte;
                  qryInsert.ExecSql;
               end;
               dtmBaseDados.dbBaseDados.Commit;
            except
               dtmBaseDados.dbBaseDados.RollBack;
            end;
         end;

      end
      else
      begin
         try
            dtmBaseDados.dbBaseDados.StartTransaction;
            cdsLancaInforme.Data := CtrlLancaEspecial.ListaDadosInforme(iIDLanc1, sRendim);

            if not cdsLancaInforme.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([StrToint(dbcboInforme.LookupValue),1]),[]) then
            begin
               qryInsert.ParamByName('IDINFORME').AsInteger     := StrToint(dbcboInforme.LookupValue);
               qryInsert.ParamByName('IDLANCIRRF').AsInteger    := iIDLanc1;
               qryInsert.ParamByName('VLRLANC').AsFloat         := fTotalRend1;
               qryInsert.ParamByName('FONTEPAGADORA').AsInteger := 1;
               qryInsert.ExecSql;
            end;
            dtmBaseDados.dbBaseDados.Commit;
         except
            dtmBaseDados.dbBaseDados.RollBack;
         end;

         iIDLanc := iIDLanc2;
         try
            dtmBaseDados.dbBaseDados.StartTransaction;
            cdsLancaInforme.Data := CtrlLancaEspecial.ListaDadosInforme(iIDLanc2, sRendim);

            if not cdsLancaInforme.Locate('IDINFORME;FONTEPAGADORA',VarArrayOf([StrToint(dbcboInforme.LookupValue),1]),[]) then
            begin
               qryInsert.ParamByName('IDINFORME').AsInteger     := StrToint(dbcboInforme.LookupValue);
               qryInsert.ParamByName('IDLANCIRRF').AsInteger    := iIDLanc2;
               qryInsert.ParamByName('VLRLANC').AsFloat         := fTotalRend2;
               qryInsert.ParamByName('FONTEPAGADORA').AsInteger := 2;
               qryInsert.ExecSql;
            end;
            dtmBaseDados.dbBaseDados.Commit;
         except
            dtmBaseDados.dbBaseDados.RollBack;
         end;
      end;
   end;
   frmProgresso.EscondeFormProgresso;
   MsgDlg('Fim de Processamento.','Aviso',mtWarning,[mbOk],0);
end;



end.
