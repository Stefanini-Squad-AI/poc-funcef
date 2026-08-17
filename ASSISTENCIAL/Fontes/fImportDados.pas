unit fImportDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, DBTables,
  Wwquery, OpenArqText, wwdblook, Wwdatsrc, ComCtrls,  TB97, IvDictio,
  IvMulti, IvEMulti, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmImportDados = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    qryCpLayout: TwwQuery;
    dsCpLayout: TwwDataSource;
    dsTpLayout: TwwDataSource;
    qryTpLayout: TwwQuery;
    Label1: TLabel;
    dbgTpLayout: TwwDBGrid;
    OpenDialog: TOpenDialog;
    qryIns: TwwQuery;
    qryLgLayout: TwwQuery;
    dbgCpLayout: TwwDBGrid;
    Label2: TLabel;
    dbgLgLayout: TwwDBGrid;
    Label3: TLabel;
    dsLgLayout: TwwDataSource;
    qryAssoc: TwwQuery;
    qryTpLayoutIDLAYOUT: TFloatField;
    qryTpLayoutDESCRICAO: TStringField;
    qryTpLayoutTRGDTINCLUSAO: TDateTimeField;
    qryTpLayoutTRGUSERINCLUSAO: TStringField;
    qryLgLayoutIDLGLAYOUT: TFloatField;
    qryLgLayoutIDLAYOUT: TFloatField;
    qryLgLayoutIDCPLAYOUT: TFloatField;
    qryLgLayoutDESCASSOC: TStringField;
    qryCpLayoutIDCPLAYOUT: TFloatField;
    qryCpLayoutIDLAYOUT: TFloatField;
    qryCpLayoutDATA: TDateTimeField;
    qryCpLayoutNOMECPO: TStringField;
    qryCpLayoutPOSINICIAL: TFloatField;
    qryCpLayoutPOSFINAL: TFloatField;
    qryCpLayoutFLGVALOR: TStringField;
    qryCpLayoutIDMODULO: TFloatField;
    qryCpLayoutTIPOREG: TStringField;
    qryCpLayoutTRGDTINCLUSAO: TDateTimeField;
    qryCpLayoutTRGUSERINCLUSAO: TStringField;
    qryAssocIDLGLAYOUT: TFloatField;
    qryAssocIDLAYOUT: TFloatField;
    qryAssocIDCPLAYOUT: TFloatField;
    qryAssocNOMEARQ: TStringField;
    qryAssocCAMPOARQ: TStringField;
    qryAssocTIPOARQ: TStringField;
    qryAssocTIPOREG: TStringField;
    qryAssocPOSINICIAL: TFloatField;
    qryAssocPOSFINAL: TFloatField;
    qryAssocFLGVALOR: TStringField;
    procedure bbtnCancelaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dbgTpLayoutDblClick(Sender: TObject);
  private
    { Private declarations }
    Function ErroValor(St:String): Boolean;
    Function VerificaValor(St:String;Tp:Integer): String;
    Function ExisteTabela: Boolean;
    Function VerifData(sDt:String):String;
    Function PrepareInsert:Boolean;

  public

    { Public declarations }
  end;

var
  frmImportDados: TfrmImportDados;
  FArq: TextFile;
  sNomeArq,
  sCpIns,
  sVlIns,
  sFlgValor,
  sLinha,
  sIdCapSeg,
  sChave, sData: String;

implementation

uses DBaseDados, UDataBase, UMensErro, UAdmass, ULayoutAss;

{$R *.DFM}

Function TfrmImportDados.ErroValor(St:String): Boolean;
Var Ch  : Char;
    A   : Integer;
    Erro: Boolean;
begin
  A:=0;
  Repeat
    Inc(A,1);
    Ch:=St[A];
    If Ch In ['0'..'9','.',','] then Erro:=False
    else Erro:=True;
  Until(A>=Length(St))Or(Erro);
  Result:=Erro;
end;

Function TfrmImportDados.VerificaValor(St:String;Tp:Integer): String;
Var StA : String;
    Ch  : Char;
    A   : Integer;
begin
  StA:='';
  For A:=1 to Length(St) do
  begin
    Ch:=St[A];
    If Ch In ['0'..'9'] then StA:=StA+Ch;
  end;
  If (Tp In [2..Length(StA)-1])And(StA<>'') then
    StA:=Copy(StA,1,Length(StA)-(Tp))+'.'+
          Copy(StA,Length(StA)-(Tp-1),Tp);
  If StA='' then StA:='0';
  Result:=StA;
end;

Function TfrmImportDados.ExisteTabela: Boolean;
begin
  With qryIns do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT * FROM ALL_TABLES'+
            ' WHERE TABLE_NAME = '+Chr(39)+SNomeArq+Chr(39));
    Open;
    Result:= Not IsEmpty;
    Close;
  end; {With}
end;

Function TfrmImportDados.VerifData(sDt:String):String;
Var St:String;
    Ch: Char;
    A : Integer;
begin
  St:='';
  For A:=1 to Length(sDt) do
  begin
    Ch:=sDt[A];
    If Ch In ['0'..'9'] then St:=St+Ch;
  end;
  If Length(St)=8 then
  begin
    If Not DataValida(St,False) then
      St:=Copy(St,7,2)+Copy(St,5,2)+Copy(St,1,4);

    If DataValida(St,True) then
     St:=Copy(St,1,2)+'/'+Copy(St,3,2)+'/'+Copy(St,5,4)
    else St:='';
  end else St:='';
  Result:=St;
end;

Function TfrmImportDados.PrepareInsert:Boolean;
Var Tcp: Boolean;
    A,IPosIn,
    IposFi,
    Tam: Integer;
    sCampo,
    sIdent: String;
begin
  sCpIns:='';
  sVlIns:='';
  Tcp:=True;
  qryAssoc.First;
  Repeat
    iPosIn:=qryAssoc.FieldByName('PosInicial').AsInteger;
    iPosFi:=qryAssoc.FieldByName('PosFinal').AsInteger;
    sFlgValor:=qryAssoc.FieldByName('FlgValor').AsString;
    sCampo:=qryAssoc.FieldByName('CampoArq').AsString;
    sIdent:=qryAssoc.FieldByName('TipoReg').AsString;

    (* #@ - Caso o arquivo movimento não tenha Header ou Trailer *)
    If (sIdent='#@')Or
        (Copy(sIdent,1,Length(sIdent))=Copy(sLinha,1,Length(sIdent))) then
    begin
      sCpIns:=sCpIns+sCampo+',';
      Tam:=0;

      For A:=iPosIn to iPosfi do Inc(Tam,1);

      If sFlgValor='0' then
        sVlIns:=sVlIns+Chr(39)+copy(sLinha,iPosIn,Tam)+Chr(39)+','
      else
      If sFlgValor='1' then
      begin
        sData:=Copy(sLinha,iPosIn,Tam);
        sData:=VerifData(sData);
        If sData<>'' then
         sVlIns:=sVlIns+'TO_DATE('+Chr(39)+sData+Chr(39)+','+Chr(39)+
                  'DD/MM/YYYY'+Chr(39)+'),'
        else
        begin
          MsgDlg('ERRO! '+#13+'DATA INVÁLIDA, OPERAÇÃO SERÁ CANCELADA!',
              'Erro',mtError,[mbOk,mbHelp],0);
          Abort;
        end;
      end                                                          {-1 = AJUSTE FLGVALOR}
      else
      If Not ErroValor(copy(sLinha,iPosIn,Tam)) then
      begin
        sVlIns:=sVlIns+VerificaValor(copy(sLinha,iPosIn,Tam),StrToIntDef(sFlgValor,0)-1)+',';
      end
      else
        begin
          MsgDlg('ERRO! '+#13+'VALOR INVÁLIDO, VERIFIQUE ARQUIVO DE IMPORTAÇÃO.',
              'Erro',mtError,[mbOk,mbHelp],0);
          Abort;
        end;
    end;

    qryAssoc.Next;

  Until(qryAssoc.Eof);
  sCpIns:=Copy(sCpIns,1,Length(sCpIns)-1);
  sVlIns:=Copy(sVlIns,1,Length(sVlIns)-1);
  qryAssoc.First;
  Result:=Tcp;
end;

procedure TfrmImportDados.bbtnCancelaClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmImportDados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryTpLayout.Close;
  qryCpLayout.Close;
  qryLgLayout.Close;
  qryIns.Close;
  action := cafree;
end;

procedure TfrmImportDados.FormCreate(Sender: TObject);
begin
  inherited;
  qryTpLayout.open;
  qryCpLayout.open;
  qryLgLayout.Open;
end;

procedure TfrmImportDados.bbtnConfirmarClick(Sender: TObject);
var sSql,
    sIdLayout,
    sIdCpLayout,
    sIdLgLayout,
    sVlChave : String;
    iIdTabela,
    A,TotalInc: Integer;

begin
  inherited;
  TotalInc:=0;
  If (qryTpLayout.IsEmpty)Or(qryCpLayout.IsEmpty)Or
      (qryLgLayout.IsEmpty) then
  begin
    MsgDlg('ERRO! '+#13+'ESCOLHA O TIPO DE LAYOUT COM DUPLO CLICK.',
              'Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;
  sIdLayout:=qryLgLayout.FieldByName('IdLayout').AsString;
  sIdCpLayout:=qryLgLayout.FieldByName('IdCpLayout').AsString;
  sIdLgLayout:=qryLgLayout.FieldByName('IdLgLayout').AsString;
  With qryAssoc do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT'+
            ' LG.IDLGLAYOUT,'+
            ' LG.IDLAYOUT,'+
            ' LG.IDCPLAYOUT,'+
            ' LG.NOMEARQ,'+
            ' LG.CAMPOARQ,'+
            ' LG.TIPOARQ,'+
            ' CP.TIPOREG,'+
            ' CP.POSINICIAL,'+
            ' CP.POSFINAL,'+
            ' CP.FLGVALOR'+

            ' FROM CPLAYOUT CP, LGLAYOUT LG'+

            ' WHERE'+
            ' (LG.IDLAYOUT=CP.IDLAYOUT) AND'+
            ' (LG.IDCPLAYOUT=CP.IDCPLAYOUT)'+

            ' ORDER BY LG.IDLAYOUT,LG.IDCPLAYOUT');
    Open;
    If IsEmpty then
    begin
      Close;
      MsgDlg('ERRO! '+#13+'NÃO FORAM ASSOCIADOS OS CAMPOS DO LAYOUT.',
              'Erro',mtError,[mbOk,mbHelp],0);
      Exit;
    end;
  end; {With}

  OpenDialog.execute;
  If FileExists(OpenDialog.FileName) then
  begin
    AssignFile(FArq,OpenDialog.FileName);
    {$I+}
    Reset(FArq);
    {$I-}
    If IoResult=0 then
    begin
      sNomeArq:=qryAssoc.FieldByName('NOMEARQ').AsString;
      If ExisteTabela then
      begin
        (* Modifica tabela caso necessário *)
        If Not ModifTabela(sNomeArq) then
        begin
          MsgDlg('Houve erro na modificação da tabela.','Erro',mtError,[mbOk,mbHelp],0);
          Abort;
        end;
        Repeat
          ReadLn(FArq,sLinha);
          If Trim(sLinha)<>'' then
          begin
            sChave:='';
            sVlChave:='';
            If PrepareInsert then
            begin
              For A:=0 to NTabelas do
               If sNomeArq=TabTabelas[A] then sChave:=TabChaves[A];

              If sChave<>'' then
              begin
                iIdTabela:= LeUltRegistro(nil,sNomeArq);
                sVlChave:=IntToStr(iIdTabela);
              end
               else
               begin
                 MsgDlg('Chave não localizada!','Erro',mtError,[mbOk,mbHelp],0);
                 Abort;
               end;

              If not dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.StartTransaction;

              If NumOrdemRg>0 then
              begin
                sCpIns:=sCpIns+',ORDEM';
                sVlIns:=sVlIns+','+IntToStr(NumOrdemRg);
                Inc(NumOrdemRg,1);
              end;

              sSql:='INSERT INTO '+sNomeArq+'('+sChave+','+sCpIns+
                      ') VALUES ('+sVlChave+','+sVlIns+')';
              With qryIns do
              begin
                Close;
                SQL.Clear;
                SQL.Add(sSqL);
                try
                  ExecSQL;
                except
                  dtmBaseDados.dbBaseDados.Rollback;
                  MsgDlg('Ocorreu um erro durante a transação.'+
                         #13+'Operação será cancelada.'+
                         #13+'Verifique a definição do layout.',
                          'Erro',mtError,[mbOk,mbHelp],0);
                  Abort;
                end;
                dtmBaseDados.dbBaseDados.Commit;
                Inc(TotalInc,1);
              end; {With}
             end; {PrepareInsert}
           end; {sLinha<>''}
         Until(Eof(FArq));
         CloseFile(FArq);
         MsgDlg('Importação Concluida!'+#13+
                'Registros Incluidos: '+IntToStr(TotalInc),'Resultado',mtError,[mbOk],0);
       end else  MsgDlg('Tabela não existe.','Erro',mtError,[mbOk,mbHelp],0);
     end else MsgDlg('Erro na abertura do arquivo de importação!','Erro',mtError,[mbOk],0);
  end; {FileExists}
  bbtnConfirmar.Enabled:=False;
end;

procedure TfrmImportDados.bbtnSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmImportDados.dbgTpLayoutDblClick(Sender: TObject);
begin
  inherited;
  qryCpLayout.Close;
  qryLgLayout.Close;
  qryCpLayout.ParamByName('PIDLAYOUT').Value:=qryTpLayout.FieldByName('IDLAYOUT').Value;
  qryCpLayout.Open;
  qryLgLayout.ParamByName('PPIDLAYOUT').Value:=qryCpLayout.FieldByName('IDLAYOUT').Value;
  qryLgLayout.Open;
end;

end.
