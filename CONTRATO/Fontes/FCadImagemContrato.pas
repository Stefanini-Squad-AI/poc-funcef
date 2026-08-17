unit FCadImagemContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, DBCtrls, Mask, wwdbedit, Wwdbspin, wwdblook, ExtDlgs,JPEG,
  BfDialogs, BrowseFolder, uProcuraDir, CmEventosCadastro, ImgList;

type
  TfrmCadImagensContrato = class(TfrmCadastroCS)
    pnlInfo: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    dbContrato: TwwDBLookupCombo;
    dbPagina: TwwDBSpinEdit;
    Panel1: TPanel;
    qryContrato: TwwQuery;
    qryIDCONTRATO: TFloatField;
    qryIDIMAGEM: TFloatField;
    qryPAGINA: TFloatField;
    ScrollBox1: TScrollBox;
    btnPaginaInicial: TBitBtn;
    btnPaginaAnterior: TBitBtn;
    btnProximaPagina: TBitBtn;
    btnUltimaPagina: TBitBtn;
    sbtnProcurarImagem: TSpeedButton;
    qryAux: TwwQuery;
    qryAuxPAGINA: TFloatField;
    qryGrava: TwwQuery;
    qryLer: TwwQuery;
    qryDeleta: TwwQuery;
    Imagem: TImage;
    qryEXTENSAO: TStringField;
    qryLerIMAGEM: TBlobField;
    qryLerIDIMAGEM: TFloatField;
    qryLerDESCRIMAGEM: TStringField;
    opdImagem: TOpenPictureDialog;
    sbtnGetAllFromDir: TSpeedButton;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    procedure btnPaginaInicialClick(Sender: TObject);
    procedure btnPaginaAnteriorClick(Sender: TObject);
    procedure btnProximaPaginaClick(Sender: TObject);
    procedure btnUltimaPaginaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure sbtnProcurarImagemClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnGetAllFromDirClick(Sender: TObject);
    function getfilenumber(ab : string):double;
  private
     idcontrato,idimagem,idpagina : double ;
     Lastfile : string;
     { Private declarations }
  public
    { Public declarations }

  end;

var
  frmCadImagensContrato: TfrmCadImagensContrato;

implementation

uses clipbrd,UDatabase,UMensErro,USistema;
{$R *.DFM}

procedure TfrmCadImagensContrato.FormActivate(Sender: TObject);
begin
   inherited;
   application.processmessages;
   qry.Close;
   qry.ParamByName('IDCONTRATO').AsFloat := -1;
   qry.Open;
   qryContrato.Close;
   qryContrato.SQL.Add(' WHERE IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
                          ' WHERE IDUSUARIO = '+IntToStr(Sistema.IDUsuario)+')');
   qryContrato.Open;
   sbtnProcurarImagem.enabled := false;
   sbtnGetAllFromDir.enabled := false;
   MontaSelect.Filtro.Add(' IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
                          ' WHERE IDUSUARIO = '+IntToStr(Sistema.IDUsuario)+')');
end;

procedure TfrmCadImagensContrato.CmeCadastroDelete(Sender: TObject);
begin
   idimagem := qry.fieldbyname('idimagem').AsFloat;
   inherited;
   qryDeleta.ParamByName('idimagem').AsFloat := idimagem;
   qryDeleta.ExecSQL;
   CommitTransacao;
end;
procedure TfrmCadImagensContrato.CmeCadastroConfirma(Sender: TObject);
begin
   if qry.State = dsInsert then begin
      try
      starttransacao;
      idimagem := LeUltRegistro(nil,'IMAGENS');
      idcontrato := qryContrato.FieldByName('IDCONTRATO').AsFloat;
      qryGrava.close;
      qry.FieldByName('extensao').AsString := ExtractFileExt(lastfile);
      qryGrava.parambyname('IDIMAGEM').AsFloat := idimagem;
      qryGrava.parambyname('IMAGEM').LoadFromFile(lastfile,ftBlob);
      qryGrava.parambyname('DESCRIMAGEM').AsString := qryContrato.fieldbyname('NOMECONTRATO').AsString;
      qryGrava.ExecSQL;
      qry.FieldByName('IDIMAGEM').AsFloat := idimagem;
      qry.ApplyUpdates;
      CommitTransacao;
     except
      RollBackTransacao;
     end;
   end;
   if qry.State = dsEdit then begin
      try
      starttransacao;
      idimagem := qry.FieldByname('IDIMAGEM').AsFloat;
      idpagina := qry.FieldByname('PAGINA').AsFloat;
      idcontrato := qry.FieldByname('IDCONTRATO').AsFloat;

      qry.Delete;
      qry.ApplyUpdates;
      qryDeleta.ParamByName('idimagem').AsFloat := idimagem;
      qryDeleta.ExecSQL;
      qry.Insert;
      qry.fieldbyname('IDIMAGEM').AsFloat := idimagem;
      qry.fieldbyname('IDCONTRATO').AsFloat := idcontrato;
      qry.fieldbyname('PAGINA').AsFloat := idpagina;
      qry.FieldByName('EXTENSAO').AsString := ExtractFileExt(lastfile);
      
      qryGrava.close;
      qryGrava.parambyname('idimagem').AsFloat := idimagem;
      qryGrava.parambyname('imagem').LoadFromFile(lastfile,ftBlob);
      qryGrava.parambyname('DESCRIMAGEM').AsString := qryContrato.fieldbyname('NOMECONTRATO').AsString;
      qryGrava.ExecSQL;
      qry.ApplyUpdates;
      CommitTransacao;
     except
      RollBackTransacao;
      end;
   end;
   inherited;
end;

procedure TfrmCadImagensContrato.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if montaselect.RetornouValor then begin
      idcontrato := strtoint(montaselect.ValoresChave[0]);// idcontrato

      qry.Close;
      qry.ParamByName('IDCONTRATO').AsFloat := idcontrato;
      qry.Open;
      idimagem := qry.FieldByName('IDIMAGEM').AsFloat;
      qryLer.Close;
      qryLer.ParamByName('idimagem').AsFloat := idimagem;
      qryLer.open;
      qryLerimagem.SaveToFile('c:\temp\c&p~tmp'+qry.FieldByName('EXTENSAO').AsString);
      imagem.Picture.LoadFromFile('c:\temp\c&p~tmp'+qry.FieldByName('EXTENSAO').AsString);
      deletefile('c:\temp\c&p~tmp'+qry.FieldByName('EXTENSAO').AsString);
      qryLer.close;

      Imagem.Width := Imagem.Picture.Width;
      Imagem.Height:= Imagem.Picture.Height;
   end;
end;

procedure TfrmCadImagensContrato.btnPaginaInicialClick(Sender: TObject);
begin
  inherited;
  qry.First;
end;

procedure TfrmCadImagensContrato.btnPaginaAnteriorClick(Sender: TObject);
begin
  inherited;
  qry.Prior;
end;

procedure TfrmCadImagensContrato.btnProximaPaginaClick(Sender: TObject);
begin
  inherited;
  qry.Next;
end;

procedure TfrmCadImagensContrato.btnUltimaPaginaClick(Sender: TObject);
begin
  inherited;
  qry.Last;
end;

procedure TfrmCadImagensContrato.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  sbtnProcurarImagem.enabled := true;
  sbtnGetAllFromDir.enabled := true;
end;

procedure TfrmCadImagensContrato.bbtnConfirmarClick(Sender: TObject);
begin
  idcontrato := qryContrato.FieldByName('IDCONTRATO').AsFloat;
  idpagina   := strtoint(trim(dbPagina.Text));
  qryAux.Close;
  qryAux.ParamByName('IDCONTRATO').AsFloat := IDCONTRATO;
  qryAux.ParamByName('IDPAGINA').AsFloat := IDPAGINA;
  if qry.state = dsInsert then qryAux.Open;
  if not qryAux.IsEmpty then begin
     if qryAux.RecordCount > 1 then begin
        while not qryAux.EOF do begin
           if qryAux.FieldByName('PAGINA').AsFloat = idpagina then begin
              MsgDlg('Foi encontrada outra imagem com esse número de página.'+#13+' Coloque um número maior para página.','Erro',mtError,[mbOk, mbHelp], 0);
              break;
           end;
           qryAux.next;
        end;
     end else begin
        if qryAux.FieldByName('PAGINA').AsFloat = idpagina then begin
           MsgDlg('Foi encontrada outra imagem com esse número de página.'+#13+' Coloque um número maior para página.','Erro',mtError,[mbOk, mbHelp], 0);
        end;
     end;
  end else begin
     inherited;
     sbtnProcurarImagem.enabled := true;
     sbtnGetAllFromDir.enabled := true;
  end;
end;

procedure TfrmCadImagensContrato.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   sbtnProcurarImagem.enabled := false;
   sbtnGetAllFromDir.enabled := false;
end;

procedure TfrmCadImagensContrato.bbtnSairClick(Sender: TObject);
begin
  inherited;
   sbtnProcurarImagem.enabled := false;
   sbtnGetAllFromDir.enabled := false;
end;

procedure TfrmCadImagensContrato.sbtnProcurarImagemClick(Sender: TObject);
begin
  inherited;
  if opdImagem.Execute then begin
     if fileexists(opdImagem.FileName)then begin
        imagem.Picture.LoadFromFile(opdImagem.filename);
        LASTFILE := opdImagem.FileName;
        Imagem.Width := Imagem.Picture.Width;
        Imagem.Height:= Imagem.Picture.Height;
     end;
  end;
end;

procedure TfrmCadImagensContrato.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryLer.Close;
  qryLer.ParamByName('IDIMAGEM').AsFloat := qry.FieldByName('IDIMAGEM').AsFloat;
  qryLer.open;
  qryLerimagem.SaveToFile('c:\temp\c&p~tmp'+qry.FieldByName('EXTENSAO').AsString);
  imagem.Picture.LoadFromFile('c:\temp\c&p~tmp'+qry.FieldByName('EXTENSAO').AsString);
  deletefile('c:\temp\c&p~tmp'+qry.FieldByName('EXTENSAO').AsString);
  qryLer.close;
  Imagem.Width := Imagem.Picture.Width;
  Imagem.Height:= Imagem.Picture.Height;
end;

procedure TfrmCadImagensContrato.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  sbtnProcurarImagem.enabled := true;
end;

procedure TfrmCadImagensContrato.sbtnGetAllFromDirClick(Sender: TObject);
var
file_,path_ : string;
idcontrato,idpagina,idimagem : double;
find :TSearchRec;
begin
   if opdImagem.Execute then begin
      try
      starttransacao;
      qry.Cancel;
      idcontrato := qryContrato.fieldbyname('IDCONTRATO').AsFloat;
      path_ := ExtractFilePath(opdImagem.filename);
      if findfirst(path_+'\*'+ExtractFileExt(opdImagem.filename),faAnyFile,find)= 0 then begin
         while (findnext(find)=0)do begin
            if find.Name <>'..' then begin
               file_ := find.name;
               idpagina := getfilenumber(file_);
               idimagem := LeUltRegistro(nil,'IMAGENS');
               qry.Insert;
               qry.FieldByName('pagina').Asfloat := idpagina;
               qry.Fieldbyname('idcontrato').AsFloat := idcontrato;
               qry.FieldByName('EXTENSAO').AsString := ExtractFileExt(file_);
               qry.FieldByName('IDIMAGEM').AsFloat := idimagem;
               qryGrava.close;
               qryGrava.parambyname('IDIMAGEM').AsFloat := idimagem;
               qryGrava.parambyname('IMAGEM').LoadFromFile(path_+'\'+file_,ftBlob);
               qryGrava.parambyname('DESCRIMAGEM').AsString := qryContrato.fieldbyname('NOMECONTRATO').AsString;
               qryGrava.ExecSQL;
               qry.ApplyUpdates;
            end;
         end;
      end;
      findclose(find);
      CommitTransacao;
     except
      RollBackTransacao;
     end;
   end;
end;

function TfrmCadImagensContrato.getfilenumber(ab : string):double;
var
stemp,stemp2 : string;
j : integer;
fim,encontrado : boolean;
begin
   result := -1;
   stemp2:='';
   fim := false;
   encontrado := false;
   stemp := extractfilename(ab);
   for j := length(stemp) downto 1 do
   case stemp[j]of
   '0','1','2','3','4','5','6','7','8','9':begin if not fim then stemp2:= stemp[j]+stemp2;encontrado := true; end;
   else if encontrado then fim := true;
   end;
   try
      if encontrado then result := strtoint(stemp2)
      else result := -1;
   except
     on EConverterror do MsgDlg('O número de página presente no arquivo "'+ab+'"'+#13+
                                'contém erro.','Atenção',mtWarning,[mbOk],0);
   end;     

end;
end.
