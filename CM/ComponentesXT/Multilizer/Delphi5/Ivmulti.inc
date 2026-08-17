{
  VER80  = Delphi 1
  VER90  = Delphi 2
  VER93  = C++Builder 1
  VER100 = Delphi 3
  VER110 = C++Builder 3
  VER120 = Delphi 4
  VER125 = C++Builder 4
  VER130 = Delphi 5, C++Builder 5

  IVSHORT  = VCL 1.0, Delphi 1, short strings
  IVANSI   = VCL 2.0, Delphi 2 or C++Builder 1, long strings
  IVIME    = VCL 2.5, Delphi 3 or C++Builder 1, IME and charset
  IVWIDE   = VCL 3.x, Delphi 3 or C++Builder 3, wide strings, resource strings
  IVBIDI   = VCL 4.x, Delphi 4 or C++Builder 4, bidi support
  IVVCL5   = VCL 5.x, Delphi 5 or C++Builder 5, auto hotkey support

  IVDELPHI = Any Delphi version
  IVCB     = Any C++Builder version
}

{$IFDEF VER80}
  {$DEFINE IVSHORT}              { Delphi 1 }
  {$DEFINE IVDELPHI}
{$ELSE}
  {$IFDEF VER90}
    {$DEFINE IVANSI}             { Delphi 2 }
    {$DEFINE IVDELPHI}
  {$ELSE}
    {$DEFINE IVIME}
    {$IFDEF VER93}
      {$DEFINE IVANSI}           { C++Builder 1 }
      {$DEFINE IVCB}
    {$ELSE}
      {$DEFINE IVWIDE}           { Delphi 3 or C++Builder 3 }
      {$IFDEF VER100}
        {$DEFINE IVDELPHI}       { Delphi 3 }
      {$ELSE}
        {$IFDEF VER110}
          {$DEFINE IVCB}         { C++Builder 3 }
        {$ELSE}
          {$DEFINE IVBIDI}       { Delphi 4 or C++Builder 4 }
          {$IFDEF VER120}
            {$DEFINE IVDELPHI}   { Delphi 4 }
          {$ELSE}
            {$IFDEF VER125}
              {$DEFINE IVCB}     { C++Builder 4 }
            {$ELSE}
              {$DEFINE IVVCL5}   { Delphi 5 or C++Builder 5 }
              {$IFDEF VER130}
                {$IFDEF __BORLANDC__}
                  {$DEFINE IVCB}     { C++Builder 5 }
                {$ELSE}
                  {$DEFINE IVDELPHI} { Delphi 5 }
                {$ENDIF}
              {$ENDIF}
            {$ENDIF}
          {$ENDIF}
        {$ENDIF}
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
{$ENDIF}

{
  IVVCL = Multilanguage for VCL
  IVVB  = Multilanguage for Visual Basic
}

{$IFNDEF IVVB}
  {$DEFINE IVVCL}
{$ENDIF}

{
  IVSTANDARD = standard version
  IVPRO      = professional version
  IVPRO32    = 32-bit professional version
}

{$IFNDEF IVSTANDARD}
  {$DEFINE IVPRO}
  {$IFDEF WIN32}
    {$DEFINE IVPRO32}
  {$ENDIF}
{$ENDIF}


{ C++Builder 3.0 requires the following directive }

{$IFDEF VER110}
  //{$ObjExportAll On}
{$ENDIF}

